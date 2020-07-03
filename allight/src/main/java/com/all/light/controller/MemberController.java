package com.all.light.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.MemberDTO;
import com.all.light.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memSVC;
	
	//메인화면
	@RequestMapping("/main")
	public String main() {
		return "index";
	}
	
	//로그인폼
	@RequestMapping("/login")
	public String log() {
		return "common/loginform";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session,ModelAndView mv,RedirectView rv) {
		if(session.getAttribute("MID")==null) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		memSVC.logout(session);
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
	
	//로그인
	@RequestMapping("/log")
	public ModelAndView login(MemberDTO memdto,HttpSession session,ModelAndView mv,RedirectView rv) {
		HashMap result=memSVC.login(memdto,session);
		if(result==null || result.size()==0) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
	
	// 카카오 로그인
	@RequestMapping(value="/kakao", method=RequestMethod.POST)
	@ResponseBody
	public String kakao(@RequestParam Map<String, Object> param, HttpSession session,MemberDTO memdto) {
		System.out.println("kakak");
		System.out.println(param.get("mid"));
		System.out.println("udto"+memdto.getMid());
		HashMap re=memSVC.kakao(param,memdto,session);
		System.out.println("kakao re"+re);
		System.out.println(re.get("mpw"));
		if(re.get("mpw")==null) {
			return "check";
		}
		System.out.println("index");
		return null;
	}
	
	// 카카오 로그아웃
	@RequestMapping(value="/kakaout", method=RequestMethod.POST)
	@ResponseBody
	public String kakaout(@RequestParam Map<String, Object> param, HttpSession session,MemberDTO memdto) {
		if(session.getAttribute("MID")==null) {
			return null;
		}
		memSVC.logout(session);
		return "out";
	}
	
}
