package com.hyundai.handsome.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.handsome.service.ProductService;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpServletRequest;

//작성자 : 김가희 , 김나형
@Log4j
@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
    
    @Autowired
	private ProductService service;

	// pid 값으로 상품 정보를 받아와 상품상세페이지로 이동
	@GetMapping("/productDetail")
	public void productGetDetail(@RequestParam("pid") String pid, @RequestParam("ccolorcode") String ccolorcode, Model model) {

		log.info("productGetDetail ................" + pid);
		//상품상세정보를 받아와서 model객체를 통해 전달
		model.addAttribute("productInfo", service.productGetDetail(pid,ccolorcode));
		
		//상품재고정보를 받아와서 model객체를 통해 전달
		List<ProductStockVO> stock = service.productGetStock(pid,ccolorcode);
		model.addAttribute("stock", stock);
	}

	// ajax로 해당 상품에 대한 컬러리스트를 가져옴
    @ResponseBody
    @GetMapping(value = "/productColor",
             produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<ProductColorVO> productGetColor(@RequestParam("pid") String pid) {

        log.info("productGetColor .................." + pid);
        return service.productGetColor(pid);
    }

 // ajax로 해당 상품에 대한 재고정보를 가져옴
    @ResponseBody
    @GetMapping(value = "/productStock",
             produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<ProductStockVO> productGetStock(@RequestParam("pid") String pid, @RequestParam("ccolorcode") String ccolorcode)
    {
        log.info("productGetStock .................." + pid+" "+ccolorcode);
        log.info(service.productGetStock(pid,ccolorcode));
        return service.productGetStock(pid,ccolorcode);
    }
}