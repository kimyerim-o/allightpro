package com.all.light.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.AddressDTO;
import com.all.light.dto.BuyDTO;
import com.all.light.dto.CartDTO;
import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderdetailDTO;
import com.all.light.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buySVC;
	
	//바로구매 눌러서 주문페이지로
	@ResponseBody
	@RequestMapping("/buyNow")
	public ModelAndView buyNow(CartDTO cartdto, HttpServletRequest request, HttpSession session,ModelAndView mv) {
		String mid = (String)request.getSession().getAttribute("MID");
		System.out.println("Buy Controller입니다"+cartdto.toString());

		cartdto.getIno();
		
		
		//주소지 목록 가져오기
		ArrayList<AddressDTO> alist = buySVC.address((String)session.getAttribute("MID"));
		mv.addObject("LIST", alist);
		//mv.addObject("clist",list);
		//mv.addObject("canoList", canoList);
		mv.setViewName("shopping/user/buy");
		return mv;
	}
	//주문페이지로 가기
	@RequestMapping("/buy")
	public ModelAndView buy(HttpSession session,ModelAndView mv, int[] canoList, HttpServletRequest request) {
		System.out.println("주문페이지 입장");
		
		//선택한 상품만 결제페이지로 넘겨주려고 arraylist로 넘김
		List<CartDTO> list = new ArrayList<CartDTO>();
		for(int i=0;i<canoList.length;i++) {
			CartDTO li=buySVC.cart(canoList[i]);
			System.out.println(li);
			list.add(li);
		}
		
		//주소지 목록 가져오기
		System.out.println(session.getAttribute("MID"));
		ArrayList<AddressDTO> alist = buySVC.address((String)session.getAttribute("MID"));
		mv.addObject("LIST", alist);
		mv.addObject("clist",list);
		mv.addObject("canoList", canoList);
		mv.setViewName("shopping/user/buy");
		return mv;
	}
	
	//결제완료 후 장바구니 지우기
	@RequestMapping("/paySuccess")
	public ModelAndView emptyCart(HttpSession session,ModelAndView mv,CartDTO cartdto,OrderDTO odto, OrderdetailDTO oddto, HttpServletRequest request) {
		System.out.println("buy컨트롤러 들어옴");
		//System.out.println("CART"+cartdto);
		System.out.println("ORDER"+odto);
		for(int i=0;i<cartdto.getCanolist().length;i++) {
			CartDTO li=buySVC.cart(cartdto.getCanolist()[i]);
			System.out.println(li);
		}
		//order insert
		String mid=(String) session.getAttribute("MID");
		odto.setMid(mid);
		buySVC.ordersin(odto); //결제 후 orderDTO에 저장하기 위해서
		int ono=buySVC.onosel(mid);
		System.out.println("ono="+ono);
		
		buySVC.emptyCart(cartdto.getCanolist());//결제 후 장바구니 비우기
		mv.setViewName("shopping/user/paySuccess");
		return mv;
	}
	
	/*//결제완료
	@RequestMapping("/paySuccess")
	public ModelAndView paySuccess(HttpSession session,ModelAndView mv, BuyDTO buydto, HttpServletRequest request) {
		mv.setViewName("shopping/user/paySuccess");
		return mv;
	}*/
	
	
}
