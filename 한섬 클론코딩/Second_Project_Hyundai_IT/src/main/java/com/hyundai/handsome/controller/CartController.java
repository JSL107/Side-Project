package com.hyundai.handsome.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyundai.handsome.service.CartService;
import com.hyundai.handsome.service.ProductService;
import com.hyundai.handsome.vo.CartVO;
import com.hyundai.handsome.vo.MemberVO;
import com.hyundai.handsome.vo.ProductColorVO;
import com.hyundai.handsome.vo.ProductStockVO;
import com.hyundai.handsome.vo.ProductVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/cart")
@AllArgsConstructor
public class CartController {
    @Autowired
    private CartService service;

    @Autowired
    private ProductService productService;

    // 장바구니 페이지에 진입시 세션에 저장된 유저의 아이디를 통해 해당 유저의 장바구니 목록 조회
    @GetMapping("/cartList")
    public String getCart(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("member");
        // 로그인하지 않았을 경우 로그인 페이지로 이동
        if (memberVO == null) {
            return "redirect:member/login";
        }
        String mid = memberVO.getMid();

        // 로그인한 유저의 장바구니 상품 총 개수를 조회하여 헤더에 표시
        List<CartVO> cartList = new ArrayList<>();
        cartList = service.cartList(mid);
        int cartTotal = cartList.size();
        session.setAttribute("cartTotal", cartTotal);
        model.addAttribute("cartList", cartList);
        model.addAttribute("total", cartList.size());

        // 옵션변경 버튼 누를 시 보여줄 상품의 디테일 정보 전달
        // 장바구니 상품 리스트의 개수 = 상품 디테일 리스트 개수 이용
        // 상품 컬러의 경우 ProductColorVO List를 추가로 전달해줘야 함
        ArrayList<ProductVO> detailList = new ArrayList<>();
        List<ProductColorVO> colorList = null;
        List<ProductStockVO> sizeList = null;

        List<List<ProductColorVO>> colorMap = new ArrayList<>();
        List<List<ProductStockVO>> sizeMap = new ArrayList<>();

        for (int i = 0; i < cartList.size(); i++) {
            String pid = cartList.get(i).getPid();
            String pcolor = cartList.get(i).getPcolor();
            ProductVO pvo = productService.productGetDetail(pid, pcolor);
            detailList.add(pvo);
            colorList = productService.productGetColor(pid);
            sizeList = productService.productGetStock(pid, pcolor);
            colorMap.add(colorList);
            sizeMap.add(sizeList);
        }

        model.addAttribute("cartList", cartList);
        model.addAttribute("detailList", detailList);
        model.addAttribute("total", cartList.size());
        model.addAttribute("colorMap", colorMap);
        model.addAttribute("sizeMap", sizeMap);

        return "cart/cart";
    }

    // 상품상세페이지에서 선택한 상품,색상,사이즈,수량 정보를 가지고 cart에 추가
    @PostMapping("/add")
    public String addCart(CartVO cart, HttpServletRequest request) throws Exception {
        service.cartAdd(cart.getMid(), cart);
        return "redirect:/cart/cartList";
    }

    // 물품을 여러개를 체크박스 인덱스 값을 통해 삭제
    @ResponseBody
    @PostMapping("/delete")
    public String deleteCart(HttpServletRequest request, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
        List<Integer> cidList = new ArrayList<>();
        for (String s : chArr) {
            cidList.add(Integer.parseInt(s));
        }

        service.cartDelete(cidList);


        return "redirect:/cart/cartList";
    }

    // 장바구니에 유저가 선택한 수량을 넘겨주기
    @GetMapping("/updateQty")
    public String updateCart(@RequestParam int cid, @RequestParam int qty) {
        service.cartUpdate(cid, qty);
        return "redirect:/cart/cartList";
    }

    // 장바구니에 담긴 옷에 대해서 데이터 수정하기
    @GetMapping("/updateOption")
    public String updateOption(@RequestParam int cid, @RequestParam String colorcode, @RequestParam String size) {
        service.updateOption(cid, colorcode, size);
        return "redirect:/cart/cartList";
    }

}
