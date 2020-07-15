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

import com.all.light.dto.MemberDTO;
import com.all.light.dto.NoticeDTO;
import com.all.light.service.NoticeService;
import com.all.light.util.PageUtil;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService notSVC;
	
	@RequestMapping("/notice")
	public ModelAndView noticeList(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			@RequestParam(value = "type", required = false, defaultValue = "nall") String searchType,
			ModelAndView mv, RedirectView rv) {
		System.out.println("\nNoticeController.noticeList");
		
		//페이지 객체에 검색어와 현재 페이지를 넘기고 공지 리스트를 반환
		PageUtil pInfo = notSVC.getPageInfo(nowPage, searchWord, searchType);
		ArrayList<NoticeDTO> map = notSVC.searchList(pInfo, searchWord, searchType);
		
		System.out.println("list = "+map.toString());
		System.out.println("pinfo = "+pInfo.toString());
		mv.addObject("LIST", map); //공지 리스트
		mv.addObject("PINFO", pInfo); //페이징 정보
		
		mv.setViewName("diary/user/notice/noticeList");
		return mv;
	}
	@RequestMapping(value="/noticedetail")
	public ModelAndView noticeDetail(
			@RequestParam("nno") int nno,
			NoticeDTO notDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeDetail");
		notDTO = notSVC.getNotInfo(nno);
		System.out.println("LIST = "+notDTO.toString());
		//공지 상세 내용 모델 지정
		mv.addObject("LIST", notDTO); 
		mv.setViewName("diary/user/notice/noticeDetail");
		return mv;
	}
	
	@RequestMapping(value="/notice/write/admin", method= RequestMethod.GET)
	public ModelAndView noticeWriteGet(
			ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeWrite,"+request.getMethod()+"method");
		mv.setViewName("diary/admin/noticeWrite");
		return mv;
	}
	
	@RequestMapping(value="/notice/write/admin", method= RequestMethod.POST)
	public ModelAndView noticeWritePost(
			NoticeDTO notDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeWrite,"+request.getMethod()+"method");
		System.out.println("NoticeDTO = "+notDTO);
		notSVC.notWrite(notDTO);
		rv.setUrl(request.getContextPath()+"/notice.com");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value="/notice/modify/admin", method= RequestMethod.GET)
	public ModelAndView noticeModifyGet(
			NoticeDTO notDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeModify,"+request.getMethod()+"method");
		System.out.println("글번호 : "+notDTO.getNno());
		//비즈니스로직, 모델지정
		notDTO = notSVC.getNotInfo(notDTO.getNno());
		mv.addObject("LIST",notDTO);
		
		mv.setViewName("diary/admin/noticeModify");
		return mv;
	}
	
	@RequestMapping(value="/notice/modify/admin", method= RequestMethod.POST)
	public ModelAndView noticeModifyPOST(
			NoticeDTO notDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeModify,"+request.getMethod()+"method");
		System.out.println("수정 DTO : "+notDTO);

		//비즈니스로직
		notSVC.notModify(notDTO);
		
		rv.setUrl(request.getContextPath()+"/noticedetail.com?nno="+notDTO.getNno());
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value="/notice/delete/admin")
	public ModelAndView noticeDelete(
			NoticeDTO notDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeDelete");
		System.out.println("글번호 : "+notDTO.getNno());
		//비즈니스로직, 모델지정
		notSVC.notDelete(notDTO.getNno());
		
		rv.setUrl(request.getContextPath()+"/notice.com");
		mv.setView(rv);
		return mv;
	}
}
