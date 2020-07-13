package com.all.light.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.util.PageUtil;
import com.all.light.dao.OrderDAO;
import com.all.light.dto.MemberDTO;
import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderData;

public class OrderService {
	
	@Autowired
	private OrderDAO ordDAO;
	
	public ArrayList<OrderData> list(HttpSession session, OrderDTO odto, OrderdetailDTO oddto, ShoppingDTO sdto,
			String term) {
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
		ArrayList<OrderDTO> list=ordDAO.list(odto);
		for(int i=0;i<list.size();i++) {
			//System.out.println("LIST"+i+"///"+list.get(i));
			oddto.setOno(list.get(i).getOno());
			ArrayList<OrderdetailDTO> listde=ordDAO.listde(oddto);//?곸꽭
			System.out.println(listde);
			for(int j=0;j<listde.size();j++) {
				//System.out.println("LISTDE"+j+"///"+listde.get(j));
				int ino=listde.get(j).getIno();
//				ShoppingDTO shop= ordDAO.getDetail(ino);
//				String img =  ordDAO.getRepreImage(ino);//??쒖씠誘몄?
//				shop.setImgimage(img);
				//System.out.println("DETAIL"+j+"///"+detail);
			}
		}
		return null;
	}
	
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
	/*public String getRepreImage(int ino) {
		String repreImg = ordDAO.getRepreImage(ino);
		return repreImg;
	}
	
	public ShoppingDTO getDetail(int ino) {
		ShoppingDTO shopDTO = ordDAO.getDetail(ino);
		return shopDTO;
	}*/


	public OrderData list(HttpSession session, OrderData odata, OrderDTO odto, OrderdetailDTO oddto,
			ShoppingDTO sdto, String term) {
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
		
		ArrayList<OrderDTO> list=ordDAO.list(odto);
		odata.setOdto(list);
		System.out.println("OrderService odata"+odata);
		System.out.println("OrderService list"+list);
		
		for(int i=0;i<list.size();i++) {
			System.out.println("LIST"+i+"///"+list.get(i));
			
			oddto.setOno(list.get(i).getOno());
			ArrayList<OrderdetailDTO> listde=ordDAO.listde(oddto);//?곸꽭
			System.out.println("OrderService odata"+odata);
			System.out.println("OrderService listde"+listde);
			
			odata.setOddto(listde);
			System.out.println(listde);
			for(int j=0;j<listde.size();j++) {
				System.out.println("LISTDE"+j+"///"+listde.get(j));
				
				int ino=listde.get(j).getIno();
				ArrayList<ShoppingDTO> shop= ordDAO.iteminfo(ino);
//				String img =  ordDAO.getRepreImage(ino);//??쒖씠誘몄?
//				shop.setImgimage(img);
				odata.setSdto(shop);

				System.out.println("OrderService odata"+odata);
				System.out.println("OrderService shop"+shop);
				
				System.out.println("DETAIL"+j+"///"+shop);
			}
		}
		return odata;
	}

	//여기는 삭제 없다!!!!!!!!!!!!!!!아마?
	//상태 변경
	public void change(int no, int type, HttpSession session) {
		ordDAO.change(no,type);
	}
	
	//계좌번호,은행
	public void check(int mno, MemberDTO mdto) {
		ordDAO.check(mno,mdto);
	}

	//기업
	//재고관리 리스트
	public PageUtil getPageInfoById(int nowPage, String cono) {
		int totalCount = ordDAO.getTotalCntById(cono);
		PageUtil pinfo = new PageUtil(nowPage, totalCount);
		return pinfo;
	}
	public ArrayList<ShoppingDTO> stocklist(String cono, PageUtil pinfo) {
		pinfo.setSearchWord(cono);
		return ordDAO.stocklist(pinfo);
	}

	//재고
	public void stock(ShoppingDTO sdto) {
		ordDAO.stock(sdto);
	}


}
