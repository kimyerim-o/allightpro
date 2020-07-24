package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.FreeBoardDTO;
import com.all.light.dto.NoticeDTO;
import com.all.light.service.FreeBoardService;
import com.all.light.util.PageUtil;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService freSVC;
	
	//유저단
	@RequestMapping(value="/freeboard/write", method= RequestMethod.GET)
	public ModelAndView freeBoardWriteGet(
			HttpServletRequest request, ModelAndView mv){
		System.out.println("FreeBoardController.freeBoardWrite" + request.getMethod() + "method");
		mv.setViewName("diary/user/freeboard/boardWrite");
		return mv;
	}
	
	@RequestMapping(value="/freeboard/write", method= RequestMethod.POST)
	public ModelAndView freeBoardWritePost(
			HttpServletRequest request, ModelAndView mv, RedirectView rv, FreeBoardDTO fdto){
		System.out.println("FreeBoardController.freeBoardWrite" + request.getMethod() + "method");
		String id = (String)request.getSession().getAttribute("MID");
		String nick = (String)request.getSession().getAttribute("MNICK");
		//파라미터 전달
		fdto.setFid(id);
		fdto.setFnick(nick);
		System.out.println("파라미터 = "+fdto);
		//비즈니스로직
		freSVC.write(fdto);
		//뷰지정
		rv.setUrl(request.getContextPath() + "/freeboard/list.com");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value="/freeboard/list")
	public ModelAndView freeBoardList(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String searchWord,
			@RequestParam(value = "type", required = false, defaultValue = "fall") String searchType,
			@RequestParam(value = "ftype", required = false, defaultValue = "") String ftype,
			HttpServletRequest request, ModelAndView mv){
		System.out.println("FreeBoardController.freeBoardList" + request.getMethod() + "method");
		
		//비즈니스로직
		PageUtil pInfo = freSVC.getPageInfo(nowPage, searchWord, searchType, ftype);
		ArrayList<FreeBoardDTO> map = freSVC.searchList(pInfo, searchWord, searchType, ftype);

		System.out.println("list = " + map.toString());
		System.out.println("pinfo = " + pInfo.toString());
		
		//모델
		mv.addObject("LIST", map); // 공지 리스트
		mv.addObject("PINFO", pInfo); // 페이징 정보
		
		//뷰 지정
		mv.setViewName("diary/user/freeboard/boardList");
		return mv;
	}
}
