package com.all.light.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buySVC;
	
	//주문페이지로 가기
	@RequestMapping("/buy")
	public ModelAndView buy(ModelAndView mv) {
		System.out.println("주문페이지 입장");
		mv.setViewName("shopping/user/buy");
		return mv;
	}
		
}
