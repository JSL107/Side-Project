package com.hdsm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.CouponVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MileageVO;
import com.hdsm.domain.OrderCheckVO;
import com.hdsm.domain.OrderItemVO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.persistence.MemberMapper;
import com.hdsm.persistence.OrderMapper;
import com.hdsm.persistence.ProductMapper;
import com.hdsm.persistence.ReviewsMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private ProductMapper productmapper;

	@Autowired
	private MemberMapper membermapper;

	@Autowired
	private OrderMapper ordermapper;
	    
	@Autowired
	private ReviewsMapper reviewmapper;
	
	@Autowired
	private ReviewsService reviewsservice;
	
    
	//해당 상품들에 대한 제품 정보를 가져옴
	@Override
	public List<OrderItemVO> getOrderPageInfo(List<OrderItemVO> orders){
			
			for(int i=0;i<orders.size();i++) {
				//주문한 상품에 대한 정보를 가져옴
				orders.get(i).setProductVO(productmapper.getProduct(orders.get(i).getPid())); 
				ProductVO product=orders.get(i).getProductVO();
				
				//주문한 상품 id에 대한 이미지 정보를 가져옴
				List<ThumbnailColorVO> thumbnailcolorvolist=membermapper.getProductsColor(orders.get(i).getPid());
				
				// 화장품 데이터 추가 (수정)
				if (product.getClarge().equals("뷰티")) {
					orders.get(i).setCcolorcode("none");;
					orders.get(i).setThumbnail(thumbnailcolorvolist.get(0));
					System.out.println("thumbnail:" + orders.get(i).getThumbnail().getC_thumbnail1());
				} else {
				
				//상품에 대한 여러개의 색상 컬러 중에서 컬러코드가 같은 컬럼 하나를 가져와 저장한다.
				for(int j=0;j<thumbnailcolorvolist.size();j++) {
					if(thumbnailcolorvolist.get(j).getCcolorcode().equals(orders.get(i).getCcolorcode())) {
						orders.get(i).setThumbnail(thumbnailcolorvolist.get(j));
						System.out.println("thumbnail:"+orders.get(i).getThumbnail().getC_thumbnail1());
					}
				}
			}
				
			//제품에 대한 가격을 등록
			orders.get(i).setOprice(product.getPprice());
			//제품에 대한 가격 및 총 가격을 계산
			orders.get(i).initSaleTotal();
			}
			
			return orders;
	}

    @Override
    public void insertOrderUser(OrderUserVO ouv) {
        Date date = new Date();
       
        if (ouv.getStrpayment().equals("inicis")) {
            ouv.setOpayment(1);
        }

        if (ouv.getOusedcoupondetail().equals("")) {
            ouv.setOusedcoupon(0);
        } else {
            ouv.setOusedcoupon(1);
        }

        //물품주문 접수라는 의미로 1을 지정
        ouv.setOstatus(1);

        ordermapper.insertOrderUser(ouv);
    }

    //회원 아이디를 통해 쿠폰에 대한 정보를 조회
    @Override
    public List<CouponVO> getcoupon(String mid) {
        return ordermapper.getcoupon(mid);
    }

    //회원의 사용가능한 쿠폰 및 할인율 조회
    @Override
    public List<CouponVO> getcouponwithevent(String mid) {
        return ordermapper.getcouponwithevent(mid);
    }

    //주문사용자의 정보를 통해 주문 사용자의 상품 정보를 입력
    @Override
    public void insertOrderProduct(OrderUserVO ouv) {
        //주문한 사용자가 주문한 상품들을 LIST로 선언
        List<OrderItemVO> olv = ouv.getOrders();

        //LIST의 사이즈만큼 반복한다.
        for (int i = 0; i < olv.size(); i++) {
            //사용자의 OID를 상품의 OID에 설정한다.
            olv.get(i).setOid(ouv.getOid());
            //주문한 사용자의 주문 사용자의 상품 정보를 입력하는 SQL문을 실행
            ordermapper.insertOrderProduct(olv.get(i));
        }
    }

    //회원의 마일리지를 등록
    @Override
    public void insertMileage(OrderUserVO ouv) {

        //MILEGEVO 객체 선언
        MileageVO miv = new MileageVO();

        //주문한 사용자의 회원ID를 가져와 마일리지 회원 ID에 등록
        miv.setMember_mid(ouv.getMid());

        //카테고리를 지급완료라고 지정
        miv.setMicategory("지급완료");

        //주문한 사용자들에 대한 주문한 상품 :list
        List<OrderItemVO> olv = ouv.getOrders();

        //받은 마일리지에 대한 정보를 저장
        String content = "";
        //content에 주문번호(제품이름:가격/....)이런식으로 등록되게 설정
        content += ouv.getOid();
        content += "(";
        for (int i = 0; i < olv.size(); i++) {
            //주문한 사용자의 상품들의 pid를 가져와 상품 자체를 가져온다.
            ProductVO product = productmapper.getProduct(olv.get(i).getPid());


            content += product.getPname();
            content += (":" + product.getPprice());
            if (i != olv.size() - 1) {
                content += "/";
            }
        }
        content += ")";
        content += ouv.getStrpayment();
        //마일리지 vo의 content를 content로 바꾼다.
        miv.setMicontent(content);

        //Mipoint를 주문한 사용자의 마일리지 값으로 지정
        miv.setMipoint(ouv.getOusermilege());

        //mapper를 통해 inserMilege를 실행
        ordermapper.insertMilege(miv);

    }


    //한섬 포인트를 업데이트
    @Override
    public void updateHspoint(OrderUserVO ouv) {

        //주문한 사용자의 mid를 통해 member 객체를 가져온다.
        MemberVO member = membermapper.getMember(ouv.getMid());
        //상품들의 목록을 list로 가져온다.
        List<OrderItemVO> orders = ouv.getOrders();

        //회원의 한섬 포인트를 주문한 사용자의 상품들의 총 포인트를 더하면 된다.
        int HSpoint = member.getMpoint();
        for (int i = 0; i < orders.size(); i++) {
            //해당 상품에 대해 포인트 계산을 한다.
            orders.get(i).initSaleTotal();

            //계산한 총 포인트를 더한다.
            HSpoint += orders.get(i).getTotalpoint();
        }

        //주문한 사용자의 mid를 변경
        member.setMid(ouv.getMid());
        //한섬 포인트를 지정한다.
        member.setMpoint(HSpoint);
        System.out.println(member.getMpoint());

        ordermapper.updateHspoint(member);


    }

    //쿠폰을 사용한 사용자의 해당 쿠폰을 지움
    @Override
    public void deleteCoupon(OrderUserVO ouv) {

        //couponVO 객체 생성
        CouponVO coupon = new CouponVO();

        //주문한 사용자의 MID를 Couponvo 객체 mid에 지정
        coupon.setMember_mid(ouv.getMid());

        //주문한 사용자의 ccode를 지정
        coupon.setCcode(ouv.getOusedcoupondetail());

        //쿠포을 지운다.
        ordermapper.deleteCoupon(coupon);
    }

    //회원 id에 해당하는 주소 목록을 조회
    @Override
    public List<AddressVO> getAddress(String mid) {

        return ordermapper.getAddress(mid);
    }

    //주문번호를 통해 주문한 사용자의 정보를 가져온다.
    @Override
    public OrderUserVO getOrderUserItem(String oid) {

        //userITEM을 리스트로 가져와 주문한 사용자의 ORDERS 정보에 넣는다.
        OrderUserVO ouv = ordermapper.getOrderUserItem(oid);
        ouv.setOrders(ordermapper.getOrderItem(oid));

        //주문한 사용자가 주문한 상품들의 리스트를 가져온다.
        List<OrderItemVO> olv = ouv.getOrders();
        for (int i = 0; i < olv.size(); i++) {
            //ProductVO를 pid를 통해 가져와 지정
            olv.get(i).setProductVO(productmapper.getProduct(olv.get(i).getPid()));
            //주문한 상품의 가격을 지정한다.
            olv.get(i).setOprice(olv.get(i).getProductVO().getPprice());
            //주문한 상품의 리뷰 작성여부 확인
            olv.get(i).setReviewcheck(reviewsservice.chkReviews(olv.get(i).getOid(), olv.get(i).getPid()));
            //상품들의 총합이나 총 마일리지, 총 포인트를 계산
            olv.get(i).initSaleTotal();

            //상품에 대한 pid를 가져와 색깔과 이미지를 가져온다.
            List<ThumbnailColorVO> thumbnailcolorvolist = membermapper.getProductsColor(olv.get(i).getPid());
            System.out.println(olv.get(i).getCcolorcode());
            //color를 크기만큼 반복하는데 객체의 ccolorcode가 같으면 해당하는 객체를 thumbnail에 저장한다.
            for (int j = 0; j < thumbnailcolorvolist.size(); j++) {
                if (thumbnailcolorvolist.get(j).getCcolorcode().equals(olv.get(i).getCcolorcode())) {
                    olv.get(i).setThumbnail(thumbnailcolorvolist.get(j));
                }
            }

        }

        return ouv;
    }

    //회원 id를 통해 주문한 사용자들에 대한 정보를 가져온다.
    @Override
    public List<OrderUserVO> getOrderUserVO(String mid) {
        //실질적으로 보낼 주문한 사용자들의 정보 리스트를 생성
        List<OrderUserVO> rouvl = new ArrayList<OrderUserVO>();
        //mid를 통해 주문한 사용자들의 정보를 담는다.
        List<OrderUserVO> ouvl = ordermapper.getOrderUserVO(mid);

        for (int i = 0; i < ouvl.size(); i++) {
            //oid를 통해 주문한 사용자의 정보 vo를 선언한다.
            OrderUserVO ouv = getOrderUserItem(ouvl.get(i).getOid());
            //실질적으로 보낼 list 객체에 추가한다.
            rouvl.add(ouv);
        }
        return rouvl;
    }	
	//주문한 사용자의 정보를 통해 쇼핑백 정보를 삭제
	@Override
	public int deleteShoppingbag(OrderUserVO ouv) {
		
		//쇼핑백 정보 리스트를 저장할 쇼핑백 LIST 객체 선언
		List<MemberSbagDTO> msList=new ArrayList<>();
		
		//주문한 상품들의 리스트를 가져온다.
		List<OrderItemVO> olv=ouv.getOrders();

		//주문한 상품들의 리스트만큼 반복한다.
		for(int i=0;i<olv.size();i++) {
			
			//쇼핑백 정보VO 를 선언
			MemberSbagDTO dto=new MemberSbagDTO();
			
			//주문한 사용자의 회원 ID를 가져와 쇼핑백VO에 설정한다.
			dto.setMid(ouv.getMid());
			//주문한 사용자의 제품ID를 가져와 쇼핑백VO에 설정한다.
			dto.setPid(olv.get(i).getPid());
			
			//각각 상품들의 PID를 가져와 리스트로 선언
			List<ProductColorVO> plc=productmapper.getProductColor(olv.get(i).getPid());
			
			//리스트만큼 반복해 만약 CCOLORCODE와 CCOLORCODE가 같다면 색 정보를 가져온다.
			for(int j=0;j<plc.size();j++) {
				if(plc.get(j).getCcolorcode().equals(olv.get(i).getCcolorcode())) {
				dto.setPcolor(plc.get(j).getCname());
				}
			}
			
			//주문한 상품들의 사이즈를 가져와 쇼핑백 사이즈에 지정
			dto.setPsize(olv.get(i).getSsize());
			
			//주문한 상품들의 개수를 가져와 쇼핑백 양에 저장한다.
			dto.setPamount(olv.get(i).getOamount());
			
			//해당하는 DTO를 저장
			msList.add(dto);
		}
		
		return membermapper.deleteShoppingBag(msList);

	}
		
	//주문한 사용자의 정보를 삭제
	//데이터 삭제 -> 상태 변경
	@Override
	public void deleteOrderUser(String oid) {
		
		//주문번호를 통해 주문한 사용자의 정보를 가져온다.
		OrderUserVO ouv= ordermapper.getOrderUserItem(oid);
		
		MemberVO member= membermapper.getMember(ouv.getMid());
		
		//주문한 사용자의 정보를 삭제한다.
		ordermapper.cancleOrderUser(oid);
							
		//oid를 통해 주문한 상품의 개수를 가져온다.
		List<OrderItemVO> oivl= ordermapper.getOrderItem(oid);
		int mpoint=member.getMpoint();
		for(int i=0;i<oivl.size();i++) {
			oivl.get(i).initSaleTotal();
			mpoint-=oivl.get(i).getTotalpoint();
		}
		
		member.setMpoint(mpoint);
		membermapper.updateHSpoint(member);
	}
	

	//사용자의 id를 통해 사용자가 최근에 주문한 상품을 가져온다.
	@Override
	public OrderUserVO getRecentOrderUserVO(@Param("mid") String mid) {
		// TODO Auto-generated method stub
		// 최근 주문한 사용자 정보를 가져온다.
		OrderUserVO ouv = ordermapper.getRecentOrderUserVO(mid);
		log.info(ordermapper.getRecentOrderUserVO(mid));
		if (ouv != null) {
			// oid를 통해 톻해 상품들의 리스트를 조회
			ouv.setOrders(ordermapper.getOrderItem(ouv.getOid()));
			// 주문한 사용자가 주문한 상품들의 리스트를 가져온다.
			List<OrderItemVO> olv = ouv.getOrders();
			for (int i = 0; i < olv.size(); i++) {
				// ProductVO를 pid를 통해 가져와 지정
				olv.get(i).setProductVO(productmapper.getProduct(olv.get(i).getPid()));
				// 주문한 상품의 가격을 지정한다.
				olv.get(i).setOprice(olv.get(i).getProductVO().getPprice());

				// 상품들의 총합이나 총 마일리지, 총 포인트를 계산
				olv.get(i).initSaleTotal();

				// 상품에 대한 pid를 가져와 색깔과 이미지를 가져온다.
				List<ThumbnailColorVO> thumbnailcolorvolist = membermapper.getProductsColor(olv.get(i).getPid());

				// color를 크기만큼 반복하는데 객체의 ccolorcode가 같으면 해당하는 객체를 thumbnail에 저장한다.
				for (int j = 0; j < thumbnailcolorvolist.size(); j++) {
					if (thumbnailcolorvolist.get(j).getCcolorcode().equals(olv.get(i).getCcolorcode())) {
						olv.get(i).setThumbnail(thumbnailcolorvolist.get(j));
					}
				}

			}

			return ouv;
		}
		return null;
	}

	//마일리지의 총합을 가져온다.
	@Override
	public int SumMilege(String mid) {
		
		return ordermapper.SumMilege(mid);
	}
	
	//회원의 쿠폰  개수를 가져온다
	@Override
	public int getCouponCount(String mid) {
		// TODO Auto-generated method stub
		return ordermapper.getCouponCount(mid);
	}
	
	


	
	//회원 아이디와 상품 id에 대한 주문 내역 확인
	@Override
	public int getOrderCheck(String pid, String mid) {
		int result = ordermapper.getOrderCheck(pid, mid);
		return result;
	}
	
	//회원 아이디와 상품 id에 대한 주문 내역 확인
	@Override
	public List<OrderCheckVO> getOrderCheckVO(String pid, String mid) {
		List<OrderCheckVO> result = ordermapper.getOrderCheckVO(pid, mid);
		return result;
	}
	
	//주문번호와 일치하는 제품의 제품정보 반환(사이즈, 컬러이름)
	@Override
	public OrderItemVO getOrderItemProductInfo(String oid){
		
		List<OrderItemVO> orderItemList = ordermapper.getOrderItemProductInfo(oid);

		return orderItemList.get(0);
	}
	
    @Override
    public OrderUserVO getOrderInfo(String mid, String oid) {
        return ordermapper.getOrderInfo(mid, oid);
    }

}
