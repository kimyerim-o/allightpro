package com.all.light.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.CartDTO;
import com.all.light.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buySVC;
	
	//주문페이지로 가기
	@RequestMapping("/buy")
	public ModelAndView buy(ModelAndView mv, HttpServletRequest request) {
		System.out.println("주문페이지 입장");
		//파라미터 받기. 파라미터 받는 방법이 여러가지
		
		//String mid = (String)request.getSession().getAttribute("MID");
		//List<BuyDTO> list = buySVC.buy(mid);
		mv.setViewName("shopping/user/buy");
		//mv.addObject("clist",list);
		return mv;
	}
		
}
