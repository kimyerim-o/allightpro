package com.all.light.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.QuestionDTO;
import com.all.light.service.QuestionService;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService queSVC;
	
	//목록보기
	@RequestMapping("/list/corp")
	public ModelAndView list(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("MID");
		System.out.println("QuestionController list"+id);
		PageUtil pinfo = queSVC.getPageInfo(nowPage,id);
		ArrayList<QuestionDTO> list = queSVC.list(pinfo);
		mv.addObject("PINFO", pinfo); //페이징 정보
		mv.addObject("LIST", list); //문의사항 상세 정보
		System.out.println(list.toString());
		mv.setViewName("/shopping/corp/question/list");
		return mv;
	}
	
	//글쓰기폼
	@RequestMapping("/write/corp")
	public String write() {
		return "shopping/corp/question/write";
	}
	
	//글쓰기처리
	@RequestMapping("/writepro/corp")
	public String writepro(QuestionDTO qdto,HttpSession session) {
		System.out.println(qdto);
		queSVC.insertWrite(qdto,session);
		return "shopping/corp/question/check";
	}
	
	//상세보기
	@RequestMapping("/detail/corp")
	public ModelAndView detail(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		qdto.setQno(qno);
		System.out.println(qdto);
		QuestionDTO de=queSVC.detail(qdto);
		mv.addObject("DETAIL",de);//게시글
		
		mv.setViewName("/shopping/corp/question/detail");
		return mv;
	}
	
}
