package com.all.light.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;

public class OrderDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	public ArrayList<OrderDTO> list(OrderDTO odto) {
		return (ArrayList)session.selectList("order.list", odto);
	}

	public ArrayList<OrderdetailDTO> listde(OrderdetailDTO oddto) {
		return (ArrayList)session.selectList("order.listde", oddto);
	}

	public String getRepreImage(int ino) {
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("ino", ino);
		return (String)session.selectOne("Shopping.getRepreImage",map);
	}
	public ShoppingDTO getDetail(int ino) {
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("ino", ino);
		return (ShoppingDTO)session.selectOne("Shopping.detailByIno",map);
	}
}
