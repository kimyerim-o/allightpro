package com.all.light.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
<<<<<<< HEAD
	private MemberService memSVC;
	
=======
	MemberService memSVC;

>>>>>>> dbxodn
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
	
	//카카오로그인
	@RequestMapping(value = "/kakao", method = RequestMethod.POST)
	@ResponseBody
	public String kakao(@RequestParam Map<String, Object> param, HttpSession session, MemberDTO memdto) {
		System.out.println("kakak");
		System.out.println(param.get("id"));
		System.out.println("udto" + memdto.getMid());
		HashMap re = memSVC.kakao(param, memdto, session);
		System.out.println("kakao re" + re);
		System.out.println(re.get("mpw"));
		if (re.get("mpw") == null) {
			return "check";
		}
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

	// 7.2유태우 작성, 7.3검색 메소드 추가
	//회원 검색 메소드
	@RequestMapping("/member/admin")
	public ModelAndView adminMember(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			HttpSession session, ModelAndView mv, RedirectView rv) {

		System.out.println("memberController.adminMember");
		System.out.println("nowPage = "+nowPage);

		PageUtil pInfo = memSVC.getPageInfo(nowPage);
		ArrayList<MemberDTO> map = memSVC.searchList(pInfo, searchWord);
		
		System.out.println("list = "+map.toString());
		System.out.println("pinfo = "+pInfo.toString());
		mv.addObject("LIST", map); //회원 상세 정보 리스트
		mv.addObject("PINFO", pInfo); //페이징 정보
		
		mv.setViewName("common/admin/member");
		return mv;
	}
	
	//7.3 관리자 회원 수정 메소드
	@RequestMapping("/member/modify/admin")
	public ModelAndView adminModifyMember(@RequestParam(value = "mno") int mno,
			@RequestParam(value = "memInfo", required=false) MemberDTO memDTO,
			HttpSession session, ModelAndView mv, RedirectView rv) {
		System.out.println("memberController.modify.Member");
		
		//파라미터 받기, 비즈니스로직
		memDTO = memSVC.mInfo(mno);
		System.out.println("memInfo = "+memDTO.toString());
		//모델지정
		mv.addObject("MEMINFO", memDTO); //회원 상세 정보
		//뷰지정
		mv.setViewName("common/admin/memberModify");
		return mv;
	}
}
