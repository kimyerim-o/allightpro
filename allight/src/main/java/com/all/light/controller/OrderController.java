package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.service.OrderService;
import com.all.light.service.ShoppingService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService ordSVC;
	private ShoppingService shopSVC;
	
	//주문목록조회-기간
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value = "term", required = false, defaultValue = "m1") String term,
			OrderDTO odto,OrderdetailDTO oddto,ShoppingDTO sdto,HttpSession session, ModelAndView mv) {
		ArrayList<OrderDTO> list=ordSVC.list(session,odto,term);
		System.out.println(list);
		mv.addObject("LIST", list);//주문
		for(int i=0;i<list.size();i++) {
			//System.out.println("LIST"+i+"///"+list.get(i));
			oddto.setOno(list.get(i).getOno());
			ArrayList<OrderdetailDTO> listde=ordSVC.listde(session,oddto,term);
			System.out.println(listde);
			mv.addObject("LISTDE", listde);//상세주문
			for(int j=0;j<listde.size();j++) {
				//System.out.println("LISTDE"+j+"///"+listde.get(j));
				int ino=listde.get(j).getIno();
				ShoppingDTO detail = ordSVC.getDetail(ino); //상세내용
				String img = ordSVC.getRepreImage(ino); //대표이미지
				detail.setImgimage(img);
				System.out.println(detail);
				mv.addObject("DETAIL",detail);
				//System.out.println("DETAIL"+j+"///"+detail);
			}
		}
		mv.setViewName("shopping/user/order/list");
		return mv;
	}
	
	//주문상세조회
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam(value = "term", required = false, defaultValue = "m1") int term,
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
