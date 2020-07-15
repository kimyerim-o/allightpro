package com.webjjang.graph.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webjjang.log.dao.LogDAO;
import com.webjjang.log.dto.ModuleCountDTO;

@Controller
@RequestMapping("/graph")
public class GraphController {

	// 자동 DI 적용 - @Inject, @Autowired
	@Autowired
	private LogDAO dao;
	
	@GetMapping("/menuCount.co")
	public String drowGraph(Model model) {
		List<ModuleCountDTO> list = dao.getModuleCount();
		
		// 가져온 데이터를 요구되어지는 데이터 형식으로 만든다.
		String data = "[";
		for(ModuleCountDTO dto : list) {
			data += "['";
			data += dto.getModule();
			data += "',";
			data += dto.getValue();
			data += "],";
		}			
		// 마지막 콤마 제거
		data = data.substring(0,data.length()-1);
		data += "]";
		
		model.addAttribute("data", data);
		
		return "graph/pichart";
	}
}