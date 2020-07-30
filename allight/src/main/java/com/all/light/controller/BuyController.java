package com.all.light.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.AddressDTO;
import com.all.light.dto.BuyDTO;
import com.all.light.dto.CartDTO;
import com.all.light.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buySVC;
	
	//주문페이지로 가기
	@RequestMapping("/buy")
	public ModelAndView buy(HttpSession session,ModelAndView mv, BuyDTO buydto, HttpServletRequest request) {
		System.out.println("주문페이지 입장");
		//파라미터 받기. 파라미터 받는 방법이 여러가지
		//1.@RequestParam
		//2.request.getParameter
		System.out.println("arr="+buydto.getArr().toString());
		List<CartDTO> list = new ArrayList<CartDTO>();
		for(int i=0;i<buydto.getArr().length;i++) {
			CartDTO li=buySVC.cart(buydto.getArr()[i]);
			System.out.println(li);
			list.add(li);
		}
		//주소지 목록 가져오기
		System.out.println(session.getAttribute("MID"));
		ArrayList<AddressDTO> alist = buySVC.address((String)session.getAttribute("MID"));
		mv.addObject("LIST", alist);
		mv.addObject("clist",list);
		mv.setViewName("shopping/user/buy");
		return mv;
	}
		
}
