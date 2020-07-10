package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.OrderDTO;
import com.all.light.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService ordSVC;
	
	//주문목록조회
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value = "term", required = false, defaultValue = "1") int term,
			OrderDTO odto,HttpSession session, ModelAndView mv) {
		System.out.println(odto);
		ArrayList<OrderDTO> list=ordSVC.list(session,odto,term);
		return mv;
	}
	
	//주문상세조회
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam(value = "term", required = false, defaultValue = "1") int term,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("MID");
		//ordSVC.list();
		return mv;
	}
	
	//주문취소및반품조회
	@RequestMapping("/back")
	public ModelAndView back(@RequestParam(value = "term", required = false, defaultValue = "1") int term,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("MID");
		//ordSVC.list();
		return mv;
	}
}
