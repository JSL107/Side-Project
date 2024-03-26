package com.hdsm.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductColorVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ReviewsDTO;
import com.hdsm.service.MemberService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;
import com.hdsm.service.QnaService;
import com.hdsm.service.ReviewService;
import com.hdsm.service.ReviewsService;
import com.hdsm.util.ProductUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

    @Autowired
    private ProductService service;

    @Autowired
    private MemberService mservice;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ReviewsService reviewsService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private QnaService qnaservice;

    // 타임세일 페이지
    @GetMapping("/mbtiEvent")
    public String mbtiEventForm() {
        return "product/mbtiEvent" ;
    }

    //전체 상품 목록 이동
//	@GetMapping("/list")
//	public void productList(Criteria cri,Model model) {
//		//추가
//		/* model.addAttribute("prodList", service.getList()); */
//	}

    @GetMapping("/review_temp")
    public String reviewPage() {

        return "product/review_temp" ;
    }

//	//페이징 없는 테스트용 상품목록
//	@GetMapping("/list")
//	public void productList(Model model,
//			@RequestParam(required = false, value = "clarge") String clarge,
//			@RequestParam(required = false, value = "cmedium") String cmedium,
//			@RequestParam(required = false, value = "csmall") String csmall
//			) {
//		ProductVO product = new ProductVO();
//
//		product.setClarge(clarge);
//		product.setCmedium(cmedium);
//		product.setCsmall(csmall);
//
//		model.addAttribute("prodList", service.getList(product));
//	}

    //처음 카테고리 목록 할때 상품 개수를 세고 뒤에 pageNum_productCount_필터들 이런식으로 만들어서 redirect (1page부터 시작)
    @GetMapping("/list/{ctg}/")
    public String productList(
            @PathVariable(required=false) String ctg
    ) {
        Criteria cri= new Criteria();
        ProductVO product = new ProductVO();
        String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);

        product.setClarge(ctgName[0]);
        product.setCmedium(ctgName[1]);
        product.setCsmall(ctgName[2]);

        int ctgProductCount = service.productCount(product);


        return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_1";
    }

    @PostMapping("/list/{ctg}")
    public String productListFilter(
            @PathVariable(required=false) String ctg
    ) {
        Criteria cri= new Criteria();
        ProductVO product = new ProductVO();
        String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);

        product.setClarge(ctgName[0]);
        product.setCmedium(ctgName[1]);
        product.setCsmall(ctgName[2]);

        int ctgProductCount = service.productCount(product);

        return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_1";
    }

    //페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기
    @GetMapping({ "/list/{ctg}/{info}"/* ,"/list/{ctg}" */})
    public String productList(
            @PathVariable(required=false) String ctg,
            @PathVariable(required=false) String info,
            HttpServletRequest request,// 이전 url에서 info가 다르면 처리하기위해 이전 url 가져올수 있는 request를 받아옴
            Model model
    ) throws UnsupportedEncodingException {
        Criteria cri= new Criteria();
        ProductVO product = new ProductVO();


        info = ProductUtil.builder().build().getURLDecode(info);

        //대분류 > 중분류 > 소분류 나타내기 위한 카테고리 배열 만들기
        String[] ctgName = ProductUtil.builder().build().getCategoryName(ctg);


        //현 필터값 적용을 위한 FilterDTO 객체 만들어주기
        String[] pageInfo= info.split("_");
        int pagenum = Integer.parseInt(pageInfo[0]);
        int productTotal = Integer.parseInt(pageInfo[1]);
        String page_info_ex = "_"+pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];

        List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(pageInfo[5]);

        FilterDTO fd = new FilterDTO();
        fd.setBnames(ProductUtil.builder().build().getBnameFilter(pageInfo[2]));
        fd.setColor(ProductUtil.builder().build().getColorFilter(pageInfo[3]));
        fd.setSizes(ProductUtil.builder().build().getSizeFilter(pageInfo[4]));
        fd.setPrice1(fprice.get(0));
        fd.setPrice2(fprice.get(1));
        fd.setOrderBy(ProductUtil.builder().build().getOrderbyFilter(pageInfo[6]));

        //공통부분
        cri.setPageNum(pagenum);
        product.setClarge(ctgName[0]);
        product.setCmedium(ctgName[1]);
        product.setCsmall(ctgName[2]);

        //filter 부분(브랜드, 컬러, 사이즈, 가격, (정렬순은 크기가 달라지지 않으니 생략))이 다른지 확인 후
        // 다르면 1page 부터 다시 적용되는 페이지를 return
        String prevInfo = request.getHeader("Referer");


        //맨처음 로드될때는 이전info값이 없어서 null이 반환됨 그래서 아래같이 임시 info를 넣어줌
        if(prevInfo == null){
            prevInfo = "0_0_0_0_0_0_1";
        }

        String[] prevInfos = prevInfo.split("_");

        boolean isFilterChange = false;//filter부분이 바뀌었는지 체크

        //브랜드, 컬러, 사이즈, 컬러 다른지 확인
        for(int i = 2; i< prevInfos.length-1 ; i++) {
            if(!prevInfos[i].equals(pageInfo[i])) {
                isFilterChange = true;//만약 필터가 바뀌었다면 true로 바꿔줌!
            }
        } // 필터가 바뀌었으면 pageNum을 1로 바꿔주고 Total 개수를 다시 세고 물건을 가져오기 위해 fd를

        if(isFilterChange) {
            log.info(info);
            log.info(prevInfo);

            cri.setPageNum(1);
            productTotal = service.productFiltedCount(product, fd);
            String filterStr = pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];
            //return "/product/list/"+ctg+"/1_"+productTotal+"_"+filterStr;
        }


        model.addAttribute(
                "ctg",
                ctg
        );
        //상단에 여성 > 아우터 > 점퍼 이런거 처럼 보여지게 할꺼~
        model.addAttribute(
                "ctgName",
                ctgName
        );

        //카테고리, 필터 적용한 전체 개수!
        model.addAttribute(
                "productCount",
                productTotal
                //service.productCount(product)
        );

        model.addAttribute(
                "productList",
                service.getProductThumbnailListWithPaging(product, cri, fd)
        );

        model.addAttribute(
                "page_info_ex",
                page_info_ex

        );

        //페이지 버튼 그려주고 페이징최대최소 같은거 이것저것 해주는거 룰루~
        model.addAttribute(
                "pageMaker",
                new PageDTO(cri,productTotal)
        );

        return "product/list";
    }

    //처음 카테고리 목록 할때 상품 개수를 세고 뒤에 pageNum_productCount_필터들 이런식으로 만들어서 redirect (1page부터 시작)
    @GetMapping("/searchList/")
    public String productSearchList(
            @RequestParam(value = "words",required = false) String words
    ) {

        int searchProductCount = service.productSearchedCount(words);

        log.info("words : " + words);
        return "redirect:/product/searchList/1"+"_"+searchProductCount+"_0_0_0_0_1&" + words;
    }

    @PostMapping("/searchList")
    public String productSearchListFilter(
            @RequestParam(value = "words",required = false) String words
    ) throws UnsupportedEncodingException {

        log.info("/searchlist 진입 words: " + words);
        int searchProductCount = service.productSearchedCount(java.net.URLDecoder.decode(words,"utf-8"));
        log.info("/searchlist searchProductCount: " + searchProductCount);
        return "redirect:/product/searchList/1"+"_"+searchProductCount+"_0_0_0_0_1&" + words;
    }


    // ai모델 돌려서 스타일 결과 가지고 오는 곳
    @PostMapping("/styleList")
    public String styleSearchListFilter(
            @RequestParam(value = "style",required = false) String style
    ) throws UnsupportedEncodingException {
        log.info("/styleList  : " + style);
        int searchStyleCount = service.styleSearchedCount(java.net.URLDecoder.decode(style,"utf-8"));
        log.info("/styleList searchStyleCount: " + searchStyleCount);
        return "redirect:/product/styleList/1"+"_"+searchStyleCount+"_0_0_0_0_1&" + style;
    }


    //페이징된 특정 카테고리의 제품들 썸네일정보들 가져오기
    @GetMapping("/searchList/{infos}")
    public String productSearchList(
            @PathVariable(required=false) String infos,
            HttpServletRequest request,// 이전 url에서 info가 다르면 처리하기위해 이전 url 가져올수 있는 request를 받아옴
            Model model
    ) throws UnsupportedEncodingException {

        String[] infoArr = infos.split("&");

        String info = infoArr[0];
        String words = infoArr[1];

        Criteria cri= new Criteria();

        info = ProductUtil.builder().build().getURLDecode(info);

        //현 필터값 적용을 위한 FilterDTO 객체 만들어주기
        String[] pageInfo= info.split("_");
        int pagenum = Integer.parseInt(pageInfo[0]);
        int productTotal = Integer.parseInt(pageInfo[1]);
        String page_info_ex = "_"+pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];

        List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(pageInfo[5]);

        FilterDTO fd = new FilterDTO();
        fd.setBnames(ProductUtil.builder().build().getBnameFilter(pageInfo[2]));
        fd.setColor(ProductUtil.builder().build().getColorFilter(pageInfo[3]));
        fd.setSizes(ProductUtil.builder().build().getSizeFilter(pageInfo[4]));
        fd.setPrice1(fprice.get(0));
        fd.setPrice2(fprice.get(1));
        fd.setOrderBy(ProductUtil.builder().build().getOrderbyFilter(pageInfo[6]));

        //공통부분
        cri.setPageNum(pagenum);

        //filter 부분(브랜드, 컬러, 사이즈, 가격, (정렬순은 크기가 달라지지 않으니 생략))이 다른지 확인 후
        // 다르면 1page 부터 다시 적용되는 페이지를 return
        String prevInfo = request.getHeader("Referer");


        //맨처음 로드될때는 이전info값이 없어서 null이 반환됨 그래서 아래같이 임시 info를 넣어줌
        if(prevInfo == null){
            prevInfo = "0_0_0_0_0_0_1";
        }

        String[] prevInfos = prevInfo.split("_");

        boolean isFilterChange = false;//filter부분이 바뀌었는지 체크

        //브랜드, 컬러, 사이즈, 컬러 다른지 확인
        for(int i = 2; i< prevInfos.length-1 ; i++) {
            if(!prevInfos[i].equals(pageInfo[i])) {
                isFilterChange = true;//만약 필터가 바뀌었다면 true로 바꿔줌!
            }
        } // 필터가 바뀌었으면 pageNum을 1로 바꿔주고 Total 개수를 다시 세고 물건을 가져오기 위해 fd를

        if(isFilterChange) {
            log.info("필터가 바꼈어 !!!!!!!!!");
            log.info(info);
            log.info(prevInfo);

            cri.setPageNum(1);
            productTotal = service.productSearchedFilteredCount(words, fd);
            String filterStr = pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];
            //return "/product/list/"+ctg+"/1_"+productTotal+"_"+filterStr;
        }

        //카테고리, 필터 적용한 전체 개수!
        model.addAttribute(
                "productCount",
                productTotal
                //service.productCount(product)
        );

        model.addAttribute(
                "productList",
                service.getSearchThumbnailList(words, cri, fd)
        );

        model.addAttribute(
                "page_info_ex",
                page_info_ex

        );
        model.addAttribute(
                "words",
                words
        );
        //페이지 버튼 그려주고 페이징최대최소 같은거 이것저것 해주는거 룰루~
        model.addAttribute(
                "pageMaker",
                new PageDTO(cri,productTotal)
        );

        return "product/searchList";
    }

    //페이징된 특정 카테고리의 제품들 썸네일 정보 가져오기 (스마트 옷장 스타일버젼)
    @GetMapping("/styleList/{infos}")
    public String styleSearchList(
            @PathVariable(required=false) String infos,
            HttpServletRequest request,// 이전 url에서 info가 다르면 처리하기위해 이전 url 가져올수 있는 request를 받아옴
            Model model
    ) throws UnsupportedEncodingException {

        String[] infoArr = infos.split("&");

        String info = infoArr[0];
        String style = infoArr[1];
        if(style.equals("로맨틱")) style="로멘틱";

        Criteria cri= new Criteria();

        info = ProductUtil.builder().build().getURLDecode(info);

        //현 필터값 적용을 위한 FilterDTO 객체 만들어주기
        String[] pageInfo= info.split("_");
        int pagenum = Integer.parseInt(pageInfo[0]);
        int productTotal = Integer.parseInt(pageInfo[1]);
        String page_info_ex = "_"+pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];

        List<Integer> fprice= ProductUtil.builder().build().getPriceFilter(pageInfo[5]);

        FilterDTO fd = new FilterDTO();
        fd.setBnames(ProductUtil.builder().build().getBnameFilter(pageInfo[2]));
        fd.setColor(ProductUtil.builder().build().getColorFilter(pageInfo[3]));
        fd.setSizes(ProductUtil.builder().build().getSizeFilter(pageInfo[4]));
        fd.setPrice1(fprice.get(0));
        fd.setPrice2(fprice.get(1));
        fd.setOrderBy(ProductUtil.builder().build().getOrderbyFilter(pageInfo[6]));

        //공통부분
        cri.setPageNum(pagenum);

        //filter 부분(브랜드, 컬러, 사이즈, 가격, (정렬순은 크기가 달라지지 않으니 생략))이 다른지 확인 후
        // 다르면 1page 부터 다시 적용되는 페이지를 return
        String prevInfo = request.getHeader("Referer");


        //맨처음 로드될때는 이전info값이 없어서 null이 반환됨 그래서 아래같이 임시 info를 넣어줌
        if(prevInfo == null){
            prevInfo = "0_0_0_0_0_0_1";
        }

        String[] prevInfos = prevInfo.split("_");

        boolean isFilterChange = false;//filter부분이 바뀌었는지 체크

        //브랜드, 컬러, 사이즈, 컬러 다른지 확인
        for(int i = 2; i< prevInfos.length-1 ; i++) {
            if(!prevInfos[i].equals(pageInfo[i])) {
                isFilterChange = true;//만약 필터가 바뀌었다면 true로 바꿔줌!
            }
        } // 필터가 바뀌었으면 pageNum을 1로 바꿔주고 Total 개수를 다시 세고 물건을 가져오기 위해 fd를

        if(isFilterChange) {
            log.info("필터가 바꼈어 !!!!!!!!!");
            log.info(info);
            log.info(prevInfo);

            cri.setPageNum(1);
            productTotal = service.styleSearchedFilteredCount(style, fd);
            String filterStr = pageInfo[2]+"_"+ pageInfo[3] +"_"+ pageInfo[4] +"_"+ pageInfo[5] +"_"+ pageInfo[6];
            //return "/product/list/"+ctg+"/1_"+productTotal+"_"+filterStr;
        }

        //카테고리, 필터 적용한 전체 개수!
        model.addAttribute(
                "productCount",
                productTotal
                //service.productCount(product)
        );

        model.addAttribute(
                "productList",
                service.getSearchThumbnailListStyle(style, cri, fd)
        );

        model.addAttribute(
                "page_info_ex",
                page_info_ex

        );
        model.addAttribute(
                "style",
                style
        );
        //페이지 버튼 그려주고 페이징최대최소 같은거 이것저것 해주는거 룰루~
        model.addAttribute(
                "pageMaker",
                new PageDTO(cri,productTotal)
        );

        return "product/styleList";
    }


    //상품 상세 정보 보기
    @GetMapping("/product_detail")
    public String product_detail(
            HttpServletRequest request,
            @RequestParam("pid") String pid,
            @RequestParam(value = "colorcode", required = false) String colorcode,
            @RequestParam(value = "price", required = false) String price,
            Model model) throws Exception {
        String mid;
        HttpSession session = request.getSession(); // 세션

        model.addAttribute("isWishList",0);


        if((String)session.getAttribute("member") != null) {
            mid = (String)session.getAttribute("member");
            MemberWishListDTO wsDTO = new MemberWishListDTO();
            wsDTO.setMember_mid(mid);
            wsDTO.setPid(pid);
            int cnt = mservice.isinWishList(wsDTO);
            if(cnt>0) {
                model.addAttribute("isWishList",cnt);
            }
        }

        ProductVO product=service.getProduct(pid);

        // 사이즈 공백여부 확인후 값 넣기
        List<String> sizelist = new ArrayList<String>();
        if (product.getP_size() != null) {
            sizelist = Arrays.asList(product.getP_size().split(","));
            Collections.sort(sizelist);
            log.info("sizeList : " + sizelist.toString());
        }


        // 상품평 리스트 받기
        List<ReviewsDTO> getReview = reviewsService.getReviewList(pid);

        ObjectMapper objectMapper = new ObjectMapper();
        List<ReviewsDTO> reviewList = new ArrayList<ReviewsDTO>();


        int reviewCount = 0;
        int avgRating = 0;
        // rcontent map으로 변환하기
        for(ReviewsDTO dto : getReview) {
            // 문자열 타입 rcontent를 map으로 변환한다. 
            Map<String, Object> rcontent = objectMapper.readValue(dto.getRcontent(),new TypeReference<Map<String,Object>>(){});
            /*
             * log.info("rcontent에 값 넣었다-------------------\n"); log.info("age : " +
             * rcontent.get("age")+"\n"); log.info("height : " +
             * rcontent.get("height")+"\n"); log.info("enjoySize : " +
             */
            //reviewDTO에 변환한 값을 넣는다.
            dto.setRcontentMap(rcontent);
            reviewList.add(dto);


            reviewCount++;//리뷰 갯수 카운트
            avgRating += Integer.parseInt((String)rcontent.get("rating")) ;
        }

        avgRating = (int)Math.ceil((avgRating*1.0)/reviewCount);

        List<Integer> reviewinfo = new ArrayList<Integer>();

        reviewinfo.add(reviewCount);
        reviewinfo.add(avgRating);


        String member_mid = (String)session.getAttribute("member");
        if(member_mid!=null) {
            MemberVO member = mservice.getMember(member_mid);
            String mname = member.getMname();
            //이름 마스킹 해서 넘기기
            StringBuilder maskingname = new StringBuilder(mname);
            if(mname.length()>3) {
                for(int index=1 ; index<mname.length() ; index++) {
                    maskingname.setCharAt(index, '*');
                }
            }
            else {
                maskingname.setCharAt(1, '*');
            }
            String mtel = member.getMtel();
            String memail = member.getMemail();
            String[] memail_arr = memail.split("@");
            model.addAttribute("mname", maskingname);
            model.addAttribute("mtel1", mtel.substring(0,3));
            model.addAttribute("mtel2", mtel.substring(3,7));
            model.addAttribute("mtel3", mtel.substring(7,11));
            model.addAttribute("memail1", memail_arr[0]);
            model.addAttribute("memail2", memail_arr[1]);
        }

        //qna에서 사용할 attibute값
        model.addAttribute("qnalist",qnaservice.getQnaList(pid));
        model.addAttribute("qnacount", qnaservice.getQnaCount(pid));

        if (product.getP_size() != null) {
            model.addAttribute("sizelist", sizelist);
        } else {
            model.addAttribute("sizelist", "");
        }

        ProductVO productVO = service.getProduct(pid);

        model.addAttribute("clarge", productVO.getClarge());
        model.addAttribute("productVO", productVO);

        model.addAttribute("sizelist",sizelist);
        model.addAttribute("productVO", service.getProduct(pid));
        if (price != null) {
            model.addAttribute("price", price);
        }
        model.addAttribute("colorVOList", service.getProductColor(pid));
        model.addAttribute("curColorCode",colorcode);
        model.addAttribute("reviewList",reviewList);
        model.addAttribute("reviewinfo", reviewinfo);

        log.info("productdetail");
        log.info(service.getProductColor(pid).get(0).getCcolorcode());
        log.info("sizeList : " + sizelist.toString());
        //log.info("reviewInfo :" + reviewinfo.toString()) ;
        return "/product/product_detail";
    }


    //상품 쇼핑백 담기
    @PostMapping("/putshoppingbag")
    public String putShoppingbag(ProductVO product) {
        return "/product/list";
    }

    @PostMapping("/order_page")
    public void order_page(
            @RequestParam("order_colorcode") String order_colorcode,
            @RequestParam("order_size") String order_size,
            @RequestParam("order_sumprice") String order_sumprice,
            @RequestParam("order_hsm") String order_hsm,
            @RequestParam("order_hspoint") String order_hspoint,
            @RequestParam("order_count") String order_count,
            Model model,
            HttpServletRequest request
    ) {
        System.out.println(order_colorcode);
        System.out.println(order_size);
        System.out.println(order_sumprice);
        System.out.println(order_hsm);
        System.out.println(order_hspoint);
        System.out.println(order_count);
        String[]pscode = order_colorcode.split("_");
        String colorcode=pscode[0]+"_"+pscode[1];
        ProductColorVO colorVO=new ProductColorVO();
        List<ProductColorVO> productColorVO= service.getProductColor(pscode[0]);
        for(int i=0;i<productColorVO.size();i++) {
            if(productColorVO.get(i).getCcolorcode().equals(colorcode)) {
                colorVO=productColorVO.get(i);
                break;
            }
        }
        ProductVO productVO= service.getProduct(colorVO.getProduct_pid());
        HttpSession session=request.getSession();
        String memberId=(String)session.getAttribute("member");
        model.addAttribute("member", mservice.getMember(memberId));
        model.addAttribute("productVO", productVO);
        model.addAttribute("colorVO", colorVO);
        model.addAttribute("order_size", order_size);
        model.addAttribute("order_sumprice", Integer.parseInt(order_sumprice));
        model.addAttribute("order_hsm", Integer.parseInt(order_hsm));
        model.addAttribute("order_hspoint", Integer.parseInt(order_hspoint));
        model.addAttribute("order_count", Integer.parseInt(order_count));

    }

}
