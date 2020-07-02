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
	MemberService memSCV;
	
	@RequestMapping("/login")
	public String log() {
		return "common/loginform";
	}
	
	@RequestMapping("/log")
	public ModelAndView login(MemberDTO memdto,HttpSession session,ModelAndView mv,RedirectView rv) {
		System.out.println("login");
		memSCV.login(memdto,session);
		rv.setUrl("./");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/main")
	public String main() {
		return "index";
	}
	
	@RequestMapping(value="/kakao", method=RequestMethod.POST)
	@ResponseBody
	public Object kakao(@RequestParam Map<String, Object> param, HttpSession session,MemberDTO memdto) {
		System.out.println("kakak");
		System.out.println(param.get("id"));
		System.out.println("udto"+memdto.getMid());
		HashMap re=memSCV.kakao(param,memdto,session);
		System.out.println("kakao re"+re);
		System.out.println(re.get("mpw"));
		HashMap check=new HashMap();
		if(re.get("mpw")==null) {
			System.out.println("join");
			check.put("code", "join");
			System.out.println(check.get("code"));
			return check;
		}
		System.out.println("index");
		check.put("code", "login");
		System.out.println(check.get("code"));
		return check;
	}
	
	
}
