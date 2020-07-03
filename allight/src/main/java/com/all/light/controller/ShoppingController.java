package com.all.light.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	//list 쇼핑목록 보여주기
	@RequestMapping("/list")
	public ModelAndView shoplist(ModelAndView mv) {
		System.out.println("ShoppingController-shoplist()");
		
		mv.setViewName("shopping/user/list/list");
		return mv;
	}
}
