package com.all.light.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.CaldictionaryDTO;
import com.all.light.service.CaldictionaryService;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/cal")
public class CaldictionaryController {
	
	@Autowired
	CaldictionaryService calSVC;

	
	@GetMapping("/dictionary")
	public String callist() {
		System.out.println("callist 폼 진입");
		return "/diary/admin/dictionary/list";
	}

	
	// 음식 사전 보기
	@RequestMapping("/dictionary/food")
	public ModelAndView foodview(
			@RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage,
			@RequestParam(value = "searchWord", required = false, defaultValue="") String searchWord,
			ModelAndView mv){

		System.out.println("컨트롤러 상품 목록보기 - foodview() 요청");
		PageUtil pInfo = calSVC.getPageInfo(nowPage, searchWord);
		System.out.println("컨트롤러 상품 목록보기 - pInfo : " + pInfo);
		ArrayList<CaldictionaryDTO> list = calSVC.getListView(pInfo, searchWord);
		mv.addObject("LIST", list);		// 실제 조회 목록
		mv.addObject("PINFO", pInfo);	// 페이징 관련 정보
		mv.addObject("searchWord", searchWord);	// 페이징 관련 정보
		mv.setViewName("/diary/admin/dictionary/list");
		System.out.println("컨트롤러 상품 목록보기 - list = " + list);
		System.out.println("컨트롤러 상품 목록보기 - pInfo = " + pInfo);
		System.out.println("컨트롤러 상품 목록보기 - searchWord = " + searchWord);
		System.out.println("컨트롤러 상품 목록보기 - mv = " + mv);
		return mv;
	}

	
	
	
	
	
	
	
	
	
	
}
