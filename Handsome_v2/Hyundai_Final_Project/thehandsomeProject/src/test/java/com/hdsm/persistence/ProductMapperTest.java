package com.hdsm.persistence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.domain.ThumbnailVO;
import com.hdsm.util.ProductUtil;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {

	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void testPaging() {// 페이징으로 목록 가져오는지 확인
		Criteria cri = new Criteria();
		
		ProductVO vo = new ProductVO();
		String[] asd = new String[3];
		//asd[0] = "여성";
		vo.setClarge("여성");
		vo.setCmedium("아우터");
		vo.setCsmall("재킷");
		
		String str = "1_1136_0_1_0_0_4";
		String[] filterArr = str.split("_");
		
		List<String> fbnames = ProductUtil.builder().build().getBnameFilter(filterArr[2]);
		String fcolor = ProductUtil.builder().build().getColorFilter(filterArr[3]);
		List<String> fsizes= ProductUtil.builder().build().getSizeFilter(filterArr[4]);
		List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(filterArr[5]);
		String forderBy = ProductUtil.builder().build().getOrderbyFilter(filterArr[6]);
	
		
		FilterDTO fd = new FilterDTO();
		fd.setBnames(fbnames);
		fd.setColor(fcolor);
		fd.setSizes(fsizes);
		fd.setPrice1(fprice.get(0));
		fd.setPrice2(fprice.get(1));
		fd.setOrderBy(forderBy);
		
//		log.info("---------------------"+fbnames.get(0)+""+fbnames.get(1));
//		log.info("---------------------"+fcolor);
//		log.info("---------------------"+fsizes.get(0)+" "+fsizes.get(1));
//		log.info("---------------------"+fprice.get(0)+""+fprice.get(1));
		log.info("---------------------"+forderBy);
		
		List<ProductVO> Productlist = mapper.getListWithPaging(vo, cri, fd);
		List<String> productIDs = new ArrayList<String>();
		
		//실제로 담을 List
		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();

		Productlist.forEach(product -> {
			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
			productIDs.add(product.getPid());
			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
			ThumbnailVO tn = new ThumbnailVO();
			tn.setPid(product.getPid());
			tn.setBname(product.getBname());
			tn.setPname(product.getPname());
			tn.setPprice(product.getPprice());			
			//size를 String -> 배열 -> List로
			List<String> psizes = Arrays.asList(
					ProductUtil.builder().build().getSizeList(product.getP_size()));
			tn.setP_size(psizes);
			tn.setColorList(new ArrayList<ThumbnailColorVO>());
			Thumbnails.add(tn);
		});
		
		
		//카테고리, 필터에대한 제품 리스트가 없는경우에는 컬러 탐색을 안해야지
		if(Productlist.size()>0) {
			List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
			//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
			for ( ThumbnailColorVO cvo : colorlist){
				for ( ThumbnailVO pvo : Thumbnails){
					if( pvo.getPid().equals(cvo.getProduct_pid())) {
						pvo.getColorList().add(cvo);
					}
				}//end for
			}//end for
		}
		
		log.info("-----------------------------"+Thumbnails.size());
		for ( ThumbnailVO i : Thumbnails){
			log.info(i);
		}//end for
	}//end testP

	@Test
	public void testProductCount() {
		ProductVO vo = new ProductVO();
		String[] asd = new String[3];
		asd[0] = "남성";
		vo.setClarge(asd[0]);
		vo.setCmedium(asd[1]);
		
		String str = "1_1136_0_1_0_0_4";
		String[] filterArr = str.split("_");
		
		List<String> fbnames = ProductUtil.builder().build().getBnameFilter(filterArr[2]);
		String fcolor = ProductUtil.builder().build().getColorFilter(filterArr[3]);
		List<String> fsizes= ProductUtil.builder().build().getSizeFilter(filterArr[4]);
		List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(filterArr[5]);
		String forderBy = ProductUtil.builder().build().getOrderbyFilter(filterArr[6]);
	
		
		FilterDTO fd = new FilterDTO();
		fd.setBnames(fbnames);
		fd.setColor(fcolor);
		fd.setSizes(fsizes);
		fd.setPrice1(fprice.get(0));
		fd.setPrice2(fprice.get(1));
		fd.setOrderBy(forderBy);
		
		log.info("---------------"+mapper.productFiltedCount(vo, fd));
	}
	
//	//브랜드에 따라 필터 설정
//	@Test
//	public void testBrandPaging() {// 페이징으로 목록 가져오는지 확인
//		Criteria cri = new Criteria();
//		
//		ProductVO vo = new ProductVO();
//		String[] asd = new String[3];
//		asd[0] = "여성";
//		vo.setClarge(asd[0]);
//		vo.setCmedium(asd[1]);
//		vo.setBname("TIME");
//		List<ProductVO> Productlist = mapper.getListWithPaging(vo, cri);
//		List<String> productIDs = new ArrayList<String>();
//		
//		//실제로 담을 List
//		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();
//
//		Productlist.forEach(product -> {
//			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
//			productIDs.add(product.getPid());
//			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
//			ThumbnailVO tn = new ThumbnailVO();
//			tn.setPid(product.getPid());
//			tn.setBname(product.getBname());
//			tn.setPname(product.getPname());
//			tn.setPprice(product.getPprice());			
//			//size를 String -> 배열 -> List로
//			List<String> psizes = Arrays.asList(
//					ProductUtil.builder().build().getSizeList(product.getP_size()));
//			tn.setP_size(psizes);
//			tn.setColorList(new ArrayList<ThumbnailColorVO>());
//		});
//		List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
//		
//		//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
//		for ( ThumbnailColorVO cvo : colorlist){
//			for ( ThumbnailVO pvo : Thumbnails){
//				if( pvo.getPid().equals(cvo.getProduct_pid())) {
//					pvo.getColorList().add(cvo);
//				}
//			}//end for
//		}//end for
//	
//		for ( ThumbnailVO i : Thumbnails){
//			log.info(i);
//		}//end for
//	}//end testP
//
//	//칼라에 따른 페이지 설정
//	@Test
//	public void testColorPaging() {// 페이징으로 목록 가져오는지 확인
//		Criteria cri = new Criteria();
//		
//		ProductVO vo = new ProductVO();
//		String[] asd = new String[3];
//		asd[0] = "여성";
//		vo.setClarge(asd[0]);
//		vo.setCmedium(asd[1]);
//		vo.setBname("TIME");
//		vo.setP_color("BLACK");
//		List<ProductVO> Productlist = mapper.getListWithPaging(vo, cri);
//		List<String> productIDs = new ArrayList<String>();
//		
//		//실제로 담을 List
//		List<ThumbnailVO> Thumbnails = new ArrayList<ThumbnailVO>();
//
//		Productlist.forEach(product -> {
//			//ProductList에 들어있는 "ProductVO"객체의 pid를 따로 productIDs에 저장. 이는 Color 이미지들을 가져올때 씀
//			productIDs.add(product.getPid());
//			//ProductList에 들어있는 "ThumbnailVO"객체에 있는 colorThumbNail 속성을 채워주자 
//			ThumbnailVO tn = new ThumbnailVO();
//			tn.setPid(product.getPid());
//			tn.setBname(product.getBname());
//			tn.setPname(product.getPname());
//			tn.setPprice(product.getPprice());			
//			//size를 String -> 배열 -> List로
//			List<String> psizes = Arrays.asList(
//					ProductUtil.builder().build().getSizeList(product.getP_size()));
//			tn.setP_size(psizes);
//			tn.setColorList(new ArrayList<ThumbnailColorVO>());
//		});
//		List<ThumbnailColorVO> colorlist = mapper.getColorList(productIDs);
//		
//		//너무 찝찝한데 이중포문... Mapper에서 Map으로 return받으면 골치아파진다는데 일단 for문으로 할까 ..	
//		for ( ThumbnailColorVO cvo : colorlist){
//			for ( ThumbnailVO pvo : Thumbnails){
//				if( pvo.getPid().equals(cvo.getProduct_pid())) {
//					pvo.getColorList().add(cvo);
//				}
//			}//end for
//		}//end for
//	
//		for ( ThumbnailVO i : Thumbnails){
//			log.info(i);
//		}//end for
//	}//end testP

	@Test
	public void styleCount() {
		log.info("---------------"+mapper.styleSearchedCount("페미닌"));
	}

}
