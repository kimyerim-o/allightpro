package com.all.light.controller;

import java.util.ArrayList;
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
import com.all.light.util.PageUtil;

@Controller
public class MemberController {
	@Autowired
	MemberService memSVC;
<<<<<<< HEAD

=======
	
	//메인화면
	@RequestMapping("/main")
	public String main() {
		return "index";
	}
	
	//로그인폼
>>>>>>> yerim
	@RequestMapping("/login")
	public String log() {
		return "common/loginform";
	}
<<<<<<< HEAD

	@RequestMapping("/log")
	public ModelAndView login(MemberDTO memdto, HttpSession session, ModelAndView mv, RedirectView rv) {
		System.out.println("login");
		memSVC.login(memdto, session);
=======
	
	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session,ModelAndView mv,RedirectView rv) {
		if(session.getAttribute("MID")==null) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		memSVC.logout(session);
>>>>>>> yerim
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
<<<<<<< HEAD

	@RequestMapping("/main")
	public String main() {
		return "index";
	}

	@RequestMapping(value = "/kakao", method = RequestMethod.POST)
	@ResponseBody
	public Object kakao(@RequestParam Map<String, Object> param, HttpSession session, MemberDTO memdto) {
		System.out.println("kakak");
		System.out.println(param.get("id"));
		System.out.println("udto" + memdto.getMid());
		HashMap re = memSVC.kakao(param, memdto, session);
		System.out.println("kakao re" + re);
		System.out.println(re.get("mpw"));
		HashMap check = new HashMap();
		if (re.get("mpw") == null) {
			System.out.println("join");
			check.put("code", "join");
			System.out.println(check.get("code"));
			return check;
=======
	
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
>>>>>>> yerim
		}
		System.out.println("index");
		return null;
	}
<<<<<<< HEAD

	// 7.2유태우 작성
	@RequestMapping("/member/admin")
	public ModelAndView adminMember(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			HttpSession session, ModelAndView mv, RedirectView rv) {
		System.out.println("memberController.adminMember");
		System.out.println("nowPage = "+nowPage);

		PageUtil PInfo = memSVC.getPageInfo(nowPage);
		ArrayList<MemberDTO> map = memSVC.list(PInfo);
  
		System.out.println("list = "+map.toString());
		System.out.println("pinfo = "+PInfo.toString());
		mv.addObject("LIST", map); //회원 상세 정보
		mv.addObject("PINFO", PInfo); //페이징 정보
		
		mv.setViewName("common/admin/member");
		System.out.println("MemberController.adminMember().viewName:"+mv.getViewName());
		return mv;
	}
=======
	
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
	
>>>>>>> yerim
}
