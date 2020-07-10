package com.all.light.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.dao.OrderDAO;
import com.all.light.dto.OrderDTO;

public class OrderService {
	
	@Autowired
	private OrderDAO ordDAO;
	
	public ArrayList<OrderDTO> list(HttpSession session, OrderDTO odto, String term) {
		odto.setMid((String) session.getAttribute("MID"));
		Date udate=new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(udate);
		if(term.equals("w")) {
			cal.add(Calendar.DATE, -7); //1주일
		}else if(term.equals("m1")) {
			cal.add(Calendar.MONTH, -1); //개월
		}else if(term.equals("m3")) {
			cal.add(Calendar.MONTH, -3);
		}else if(term.equals("m6")) {
			cal.add(Calendar.MONTH, -6); 
		}
		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		odto.setSearchdate(date);
		return ordDAO.list(odto);
	}

	public ArrayList<OrderdetailDTO> listde(HttpSession session, OrderdetailDTO oddto, String term) {
		return ordDAO.listde(oddto);	
	}
	
	// 대표 이미지 가져오기
	public String getRepreImage(int ino) {
		String repreImg = ordDAO.getRepreImage(ino);
		return repreImg;
	}
	
	public ShoppingDTO getDetail(int ino) {
		ShoppingDTO shopDTO = ordDAO.getDetail(ino);
		return shopDTO;
	}

}
