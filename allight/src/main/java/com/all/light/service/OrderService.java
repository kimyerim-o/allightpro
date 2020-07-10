package com.all.light.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.OrderDAO;
import com.all.light.dto.OrderDTO;

public class OrderService {
	
	@Autowired
	private OrderDAO ordDAO;
	
	public ArrayList<OrderDTO> list(HttpSession session, OrderDTO odto, int term) {
		odto.setMid((String) session.getAttribute("MID"));
		Date udate=(Date) session.getAttribute("DATE");
		Calendar cal = Calendar.getInstance();
		cal.setTime(udate);
		cal.add(Calendar.MONTH, -term); //개월
		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		odto.setSearchdate(date);
//		ordDAO.list();
		return null;
	}

}
