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
import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderdetailDTO;

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

	//장바구니번호로 장바구니 불러오기
	public CartDTO cart(int cano) {
		System.out.println(cano);
		//2. 카트정보 안의 아이템번호로 아이템이름,가격
		CartDTO cartdto = buyDAO.cart(cano);
		CartDTO cdto = buyDAO.items(cartdto.getIno());
		cdto.setCano(cano);
		cdto.setIno(cartdto.getIno());
		cdto.setIname(cdto.getIname());
		cdto.setCaamount(cartdto.getCaamount());
		cdto.setIprice(cdto.getIprice());
		cdto.setCaprice(cartdto.getCaprice());
		cdto.setImgimages(buyDAO.image(cartdto.getIno()));
		return cdto;
	}

	//주소가져오기
	public ArrayList<AddressDTO> address(String mid) {
		ArrayList<AddressDTO> list = buyDAO.addresslist(mid);
		System.out.println("서비스 리스트 확인 list =" + list);
		return list;
	}

	//장바구니 비우기
	public void emptyCart(int[] canoList) {
		System.out.println("buyservice 장바구니비우기");
		for(int cano:canoList) {
			buyDAO.emptyCart(cano);
			
		}
	}

	//orderDTO에 저장하기 위해 ono가져올때 필요
	public int onosel(String mid) {
		return buyDAO.onosel(mid);
	}
	
	//결제 후 orderDTO에 저장
	public void ordersin(OrderDTO odto) {
		buyDAO.ordersin(odto);
	}

	//상품상세페이지에서 바로구매
	public void buyNow(String mid) {
		buyDAO.buyNow(mid);
	}

	//order detail
	public void oderdetailin(CartDTO li) {
		buyDAO.orderdetailin(li);
		
	}

	//결제 후 orderDetailsDTO에 저장
	/*public void orderdetailsin(OrderdetailDTO oddto) {
		buyDAO.orderdetailsin(oddto);
		
	}*/
}
