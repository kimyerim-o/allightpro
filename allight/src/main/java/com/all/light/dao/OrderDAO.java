package com.all.light.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.MemberDTO;
import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderData;
import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.util.PageUtil;

public class OrderDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	public ArrayList<OrderDTO> list(OrderDTO odto) {
		return (ArrayList)session.selectList("order.list", odto);
	}

	public ArrayList<OrderdetailDTO> listde(int ono) {
		return (ArrayList)session.selectList("order.listde", ono);
	}

	public ArrayList<ShoppingDTO> iteminfo(int ino) {
		return (ArrayList)session.selectList("order.iteminfo",ino);
	}

	public void change(int no, String type) {
		HashMap map=new HashMap();
		map.put("no", no);
		map.put("type", type);
		session.update("order.change",map);
	}

	public void check(int mno, MemberDTO mdto) {
		session.update("order.check",mdto);
	}
	
	public ArrayList<OrderdetailDTO> back(OrderdetailDTO oddto) {
		ArrayList<OrderdetailDTO> list=null;
		if(oddto.getType()==null) {
			list=(ArrayList)session.selectList("order.back", oddto);
		}else if(oddto.getType()!=null) {
			list=(ArrayList)session.selectList("order.back2", oddto);
		}
		return list;
	}

	public int pageMemberId(String cono) {
		int totalCnt = session.selectOne("order.pageMemberId",cono);
		System.out.println(totalCnt);
		return totalCnt;
	}
	
	public int pageOrderCono(int cono) {
		int totalCnt = session.selectOne("order.pageOrderCono",cono);
		System.out.println(totalCnt);
		return totalCnt;
	}

	public int pageOrderConoTerm(int cono, java.sql.Date start, java.sql.Date last) {
		HashMap map=new HashMap();
		map.put("cono", cono);
		map.put("start", start);
		map.put("last", last);
		System.out.println(map);
		int totalCnt = session.selectOne("order.pageOrderConoTerm",map);
		System.out.println(totalCnt);
		return totalCnt;
	}

	public OrderDTO detail(OrderDTO odto) {
		return (OrderDTO)session.selectOne("order.detail", odto);
	}

	public ArrayList<OrderdetailDTO> listdeCorp(PageUtil pinfo) {
		return (ArrayList)session.selectList("order.listdeCorp", pinfo);
	}

	public OrderDTO listCorp(int ono) {
		return (OrderDTO)session.selectOne("order.listCorp", ono);
	}

	public OrderdetailDTO detailCorp(int odno) {
		return (OrderdetailDTO)session.selectOne("order.detailCorp", odno);
	}

	public ShoppingDTO iteminfoCorp(int ino) {
		return (ShoppingDTO)session.selectOne("order.iteminfo",ino);
	}

	public OrderDTO detailByNo(int ono) {
		return (OrderDTO)session.selectOne("order.detailByNo", ono);
	}

	public MemberDTO memIdNo(MemberDTO mdto) {
		return (MemberDTO)session.selectOne("order.memIdNo", mdto);
	}

	public void delivery(OrderDTO odto) {
		session.update("order.delivery", odto);
	}



}
