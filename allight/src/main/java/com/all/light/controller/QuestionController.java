package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println("nowPage = "+nowPage);
		PageUtil PInfo = queSVC.getPageInfo(nowPage);
		ArrayList<QuestionDTO> list = queSVC.list(PInfo);
		mv.addObject("LIST", list); //회원 상세 정보
		mv.addObject("PINFO", PInfo); //페이징 정보
		System.out.println(list.toString());
		mv.setViewName("/shopping/corp/question/list");
		return mv;
	}
	
}
