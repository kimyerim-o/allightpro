package com.all.light.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.CorporationDTO;
import com.all.light.service.CorporationService;

@Controller
public class CorporationController {
	@Autowired
	private CorporationService corSVC;
	
	@RequestMapping("/corlog")
	public ModelAndView corlog(CorporationDTO cordto,HttpSession session,ModelAndView mv,RedirectView rv) {
		System.out.println("CorporationController corlog");
		corSVC.login(cordto,session);
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
}
