package com.all.light.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.MemberDTO;
import com.all.light.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memSCV;
	
	@RequestMapping("/log")
	public String log() {
		return "common/loginform";
	}
	
	@RequestMapping("/login")
	public ModelAndView login(MemberDTO memdto,HttpSession session,ModelAndView mv,RedirectView rv) {
		System.out.println("login");
		memSCV.login(memdto,session);
		rv.setUrl("./");
		mv.setView(rv);
		return mv;
	}
	
}
