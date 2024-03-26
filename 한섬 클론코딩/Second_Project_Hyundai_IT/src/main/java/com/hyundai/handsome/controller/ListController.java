package com.hyundai.handsome.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyundai.handsome.service.ProductService;
import com.hyundai.handsome.vo.CategoryVO;
import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.PageDTO;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
public class ListController {

    private ProductService service;

    // 작성자 : 김가희, 김나형

    //카테고리 별 상품리스트
    @GetMapping("/list")
    public String list(Criteria cri, Model model, @RequestParam("clarge") String clarge, @RequestParam("cmedium") String cmedium, @RequestParam("csmall") String csmall) {

        // 상품 리스트 상단 카테고리 정보 보여주기 위해 저장 
        System.out.println("카테고리" + clarge + " " + cmedium + " " + csmall);
        CategoryVO category = new CategoryVO(clarge, cmedium, csmall);
        model.addAttribute("category", category);
        
        //카테고리 별 상품리스트를 model에 저장
        List<ProductVO> list = service.getList(cri, clarge, cmedium, csmall);
        model.addAttribute("list", list);
        
        //페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
        int total = service.getTotal(clarge, cmedium, csmall);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("totalProducts", total);
        
        // Product table에는 상품의 색상정보가 없어서 추가로 Color table 정보 조회 필요
        // Product table에는 상품의 사이즈정보가 없어서 추가로 Size table 정보 조회 필요        
        List<ProductColorVO> colorList = null;
        List<String> sizeList = null;
        List<List<ProductColorVO>> colorMap = new ArrayList<>();
        List<List<String>> sizeMap = new ArrayList<>();
        
        // pid 당 여러개의 size를 가지고 있을 수 있어 sizeMap안에 sizeList 저장
        // pid 당 여러개의 color를 가지고 있을 수 있어 colorMap안에 colorList 저장
        for (int i = 0; i < list.size(); i++) {
            colorList = service.productGetColor(list.get(i).getPid());
            sizeList = service.getSize(list.get(i).getPid());
            colorMap.add(colorList);
            sizeMap.add(sizeList);
        }

        model.addAttribute("colorMap", colorMap);
        model.addAttribute("sizeMap", sizeMap);
        return "product/productlist";
    }

    //브랜드 별 상품리스트
    @GetMapping("/listBrand")
    public String list(Criteria cri, Model model, @RequestParam("bname") String bname) {

        //페이지 상단에 어떤 브랜드인지 보여주기 위해서 필터링된 브랜드이름을 model에 저장
        model.addAttribute("bname", bname);

        //브랜드 별 상품리스트를 model에 저장
        List<ProductVO> list = service.getListBrand(cri, bname);
        model.addAttribute("list", list);
        
        //페이징 처리를 위해 총상품 개수와 pageDTO를 model로 넘김
        int total = service.getTotalBrand(bname);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("totalProducts", total);
        
        // Product table에는 상품의 색상정보가 없어서 추가로 Color table 정보 조회 필요
        // Product table에는 상품의 사이즈정보가 없어서 추가로 Size table 정보 조회 필요        
        List<ProductColorVO> colorList = null;
        List<String> sizeList = null;
        List<List<ProductColorVO>> colorMap = new ArrayList<>();
        List<List<String>> sizeMap = new ArrayList<>();
        
        // pid 당 여러개의 size를 가지고 있을 수 있어 sizeMap안에 sizeList 저장
        // pid 당 여러개의 color를 가지고 있을 수 있어 colorMap안에 colorList 저장
        for (int i = 0; i < list.size(); i++) {
            colorList = service.productGetColor(list.get(i).getPid());
            sizeList = service.getSize(list.get(i).getPid());
            colorMap.add(colorList);
            sizeMap.add(sizeList);
        }

        model.addAttribute("colorMap", colorMap);
        model.addAttribute("sizeMap", sizeMap);
        return "product/productBrandlist";
    }
}