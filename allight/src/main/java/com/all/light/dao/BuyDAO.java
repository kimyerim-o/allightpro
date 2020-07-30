package com.all.light.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.AddressDTO;
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

	//회원번호로 상품내용가져오기
	public CartDTO items(int ino) {
		CartDTO cartdto = session.selectOne("Cart.items",ino);
		return cartdto;
	}

	public CartDTO cart(int cano) {
		CartDTO cartdto = session.selectOne("Buy.cart",cano);
		return cartdto;
	}
	
	//장바구니로 상품이미지 가져오기
	public String image(int ino) {
		String image = session.selectOne("Buy.image",ino);
		return image;
	}

	public ArrayList<AddressDTO> addresslist(String mid) {
		return (ArrayList) session.selectList("member.memAddress", mid);
	}

}
