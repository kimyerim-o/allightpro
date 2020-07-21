package com.all.light.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.CalrecipeDTO;
import com.all.light.dto.MemberDTO;
import com.all.light.service.CalrecipeService;

@Controller
public class CalrecipeController {
	@Autowired
	private CalrecipeService creSVC;
	
	@RequestMapping("/calorie_recipe")
	public ModelAndView recipe(ModelAndView mv,HttpSession session,MemberDTO mdto) {
		if (session.getAttribute("MNO")!=null) {
			int mno=Integer.parseInt(String.valueOf(session.getAttribute("MNO")));
			MemberDTO list=creSVC.memberCheck(mno);
			mv.addObject("LIST",list);
		}
		mv.setViewName("diary/user/calrecipe/before");
		return mv;
	}
	
	@RequestMapping("/recipeCheck")
	public ModelAndView recipeCheck(ModelAndView mv,HttpSession session,CalrecipeDTO cdto) {
		CalrecipeDTO list=creSVC.recipeCheck(session,cdto);
		
		return mv;
	}
	
	
}
