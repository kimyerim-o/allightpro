package com.all.light.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.BuyDAO;
import com.all.light.dao.OrderDAO;
import com.all.light.dto.BuyDTO;

@Service
public class BuyService {
	
	@Autowired
	private OrderDAO ordDAO;
	private BuyDAO buyDAO;
	
	//주문
	public void buy(String mid) {
		System.out.println("BuyService 들어옴");
	}


}
