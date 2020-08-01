package com.all.light.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.BuyDAO;
import com.all.light.dao.CartDAO;
import com.all.light.dao.OrderDAO;
import com.all.light.dto.AddressDTO;
import com.all.light.dto.BuyDTO;
import com.all.light.dto.CartDTO;

@Service
public class BuyService {
	
	@Autowired
	private BuyDAO buyDAO;
	
	//주문
	public void buy(String mid) {
		/*System.out.println("BuyService 들어옴");
		List<BuyDTO> list = buyDAO.buy(mid);
		
		//2. 카트정보 안의 아이템번호로 아이템이름,가격을 for문 안에서 가져오기
		for(int i=0; i<list.size(); i++) {
			BuyDTO buydto = buyDAO.items(list.get(i).getMno());
		}
		return list;*/
	}

	public CartDTO cart(int cano) {
		System.out.println(cano);
		//2. 카트정보 안의 아이템번호로 아이템이름,가격
		CartDTO cartdto = buyDAO.cart(cano);
		CartDTO cdto = buyDAO.items(cartdto.getIno());
		cdto.setIname(cdto.getIname());
		cdto.setCaamount(cartdto.getCaamount());
		cdto.setIprice(cdto.getIprice());
		cdto.setImgimages(buyDAO.image(cartdto.getIno()));
		return cdto;
	}

	//주소가져오기
	public ArrayList<AddressDTO> address(String mid) {
		ArrayList<AddressDTO> list = buyDAO.addresslist(mid);
		System.out.println("서비스 리스트 확인 list =" + list);
		return list;
	}


}
