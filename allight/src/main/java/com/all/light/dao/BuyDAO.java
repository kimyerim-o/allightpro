package com.all.light.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.BuyDTO;
import com.all.light.dto.CartDTO;

public class BuyDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	//주문페이지로 이동
	public List<BuyDTO> buy(String mid) {
		List <BuyDTO> list = session.selectList("Buy.buy",mid);
		return list;
	}

	//회원번호로 장바구니에 있던 상품목록 가져오기
	public BuyDTO items(int mno) {
		BuyDTO buydto = session.selectOne("Buy.items",mno);
		return buydto;
	}

}
