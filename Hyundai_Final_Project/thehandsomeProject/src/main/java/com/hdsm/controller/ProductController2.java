package com.hdsm.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hdsm.domain.Criteria;
import com.hdsm.domain.FilterDTO;
import com.hdsm.domain.PageDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.service.MemberService;
import com.hdsm.service.ProductService;
import com.hdsm.util.ProductUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product2/*")
@AllArgsConstructor
public class ProductController2 {

	@Autowired
	private ProductService service;
	
	@Autowired
	private MemberService mservice;
	//전체 상품 목록 이동
//	@GetMapping("/list")
//	public void productList(Criteria cri,Model model) {
//		//추가
//		/* model.addAttribute("prodList", service.getList()); */
//	}
	
	

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
		
		return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_0";
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
		
		return "redirect:/product/list/"+ctg+"/1"+"_"+ctgProductCount+"_0_0_0_0_0";
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
			  prevInfo = "0_0_0_0_0_0_0"; 
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
	
	//상품 상세 정보 보기
	@GetMapping("/product_detail")
	public String product_detail(
			@RequestParam("pid") String pid,
			@RequestParam("colorcode") String colorcode
			,Model model) {
		ProductVO product=service.getProduct(pid);
		System.out.println(product.getP_size());
		String[] sizelist=product.getP_size().split(",");
		model.addAttribute("sizelist",sizelist);
		model.addAttribute("productVO", service.getProduct(pid));
		model.addAttribute("colorVOList", service.getProductColor(pid));
		model.addAttribute("curColorCode",colorcode);
		return "/product/product_detail2";
	}
	
	//상품 바로 주문
	@PostMapping("/order")
	public void prodOrder(ProductVO product) {
		
	}
	
	//상품 쇼핑백 담기
	@PostMapping("/putshoppingbag")
	public String putShoppingbag(ProductVO product) {
		
		return "/product/list";
	}
	

}
