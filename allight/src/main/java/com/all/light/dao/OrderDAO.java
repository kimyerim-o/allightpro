package com.all.light.dao;

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

	public ArrayList<OrderdetailDTO> listde(OrderdetailDTO oddto) {
		return (ArrayList)session.selectList("order.listde", oddto);
	}

	public ArrayList<ShoppingDTO> iteminfo(int ino) {
		return (ArrayList)session.selectList("order.iteminfo",ino);
	}
	/*public String getRepreImage(int ino) {
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("ino", ino);
		return (String)session.selectOne("Shopping.getRepreImage",map);
	}
	public ArrayList<ShoppingDTO> getDetail(int ino) {
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("ino", ino);
		return (ArrayList)session.selectOne("Shopping.detailByIno",map);
	}*/

	public void change(int no, int type) {
		HashMap map=new HashMap();
		map.put("no", no);
		map.put("type", type);
		session.update("order.change",map);
	}

	public void check(int mno, MemberDTO mdto) {
		session.update("order.check",mdto);
	}

	public int pageMemberId(String cono) {
		int totalCnt = session.selectOne("order.pageMemberId",cono);
		System.out.println(totalCnt);
		return totalCnt;
	}
	public ArrayList<ShoppingDTO> stocklist(PageUtil pinfo) {
		return (ArrayList)session.selectList("order.stocklist", pinfo);
	}

	public void stock(ShoppingDTO sdto) {
		session.update("order.stock",sdto);
	}

	public int pageOrderCono(String cono) {
		int totalCnt = session.selectOne("order.pageOrderCono",cono);
		System.out.println(totalCnt);
		return totalCnt;
	}

	public int pageOrderConoTerm(String cono, String term) {
		HashMap map=new HashMap();
		map.put("cono", cono);
		map.put("term", term);
		int totalCnt = session.selectOne("order.pageOrderCono",map);
		System.out.println(totalCnt);
		return totalCnt;
	}

	

}
