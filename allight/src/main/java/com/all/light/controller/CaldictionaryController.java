package com.all.light.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.service.CaldictionaryService;

@Controller
@RequestMapping("/cal")
public class CaldictionaryController {
	
	@Autowired
	CaldictionaryService calSVC;
	
	@RequestMapping("/dictionary")
	public ModelAndView calview(
			@RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage,
			@RequestParam(value = "searchWord", required = false, defaultValue="") String searchWord,
			ModelAndView mv){
		
		
		
		
		return null;
	}

}
