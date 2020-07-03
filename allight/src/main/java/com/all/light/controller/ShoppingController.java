package com.all.light.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.ShoppingDTO;
import com.all.light.service.ShoppingService;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shopSVC;
	
	//list 쇼핑목록 보여주기
	@RequestMapping("/list")
	public ModelAndView shoplist(
			ModelAndView mv,
			@RequestParam(value="icategory", 
						  required=false,
						  defaultValue="all") String icategory,
			@RequestParam(value = "nowPage", 
						  required = false, 
						  defaultValue = "1") int nowPage
			) {
		System.out.println("ShoppingController-shoplist()");
		
		// Parameter
		ArrayList<ShoppingDTO> list=null;;
		PageUtil pInfo=shopSVC.getPageInfo(nowPage,icategory);
		
		list.add(shopSVC.list(pInfo,icategory));
			
		
		// Logic
		
		// Model
		mv.addObject("LIST",list); //실제조회목록
		mv.addObject("PINFO",pInfo); //페이징관련 정보
		
		// View
		mv.setViewName("shopping/user/shop/list");
		return mv;
	}
}
