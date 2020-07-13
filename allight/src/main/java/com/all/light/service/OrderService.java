package com.all.light.service;

import java.text.SimpleDateFormat;
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

		
		System.out.println("OrderService odata"+odata);
		System.out.println("OrderService list"+list);
		
		ArrayList<OrderdetailDTO> listde=null;
		ArrayList<ShoppingDTO> shop=null;
		for(int i=0;i<list.size();i++) {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			list.get(i).setOrdernum(format.format(list.get(i).getOdate()));
			odata.setOdto(list);
			System.out.println("LIST"+i+"///"+list.get(i));
			
			oddto.setOno(list.get(i).getOno());
			listde=ordDAO.listde(oddto);
			System.out.println(listde);
			if(odata.getOddto()==null) {
				odata.setOddto(listde);
			}else if(odata.getOddto()!=null) {
				odata.getOddto().addAll(listde);
			}
			
			System.out.println("OrderService listde"+listde);
			System.out.println("OrderService odata"+odata);
			
			for(int j=0;j<listde.size();j++) {
				System.out.println(odata);
				System.out.println("LISTDE"+j+"///"+listde.get(j));
				
				int ino=listde.get(j).getIno();
				shop= ordDAO.iteminfo(ino);
				if(odata.getSdto()==null) {
					odata.setSdto(shop);
				}else if(odata.getSdto()!=null) {
					odata.getSdto().addAll(shop);
				}

				System.out.println("OrderService odata"+odata);
				System.out.println("OrderService shop"+shop);
				
				System.out.println("DETAIL"+j+"///"+shop);
			}
		}
		System.out.println(odata);
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
	public PageUtil pageMemberId(int nowPage, String cono) {
		int totalCount = ordDAO.pageMemberId(cono);
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

	public PageUtil pageOrderCono(int nowPage, String cono, String term) {
		int totalCount=0;
		if (term==null)
			totalCount = ordDAO.pageOrderCono(cono);
		else 
			totalCount = ordDAO.pageOrderConoTerm(cono,term);
		PageUtil pinfo = new PageUtil(nowPage, totalCount);
		return pinfo;
	}

	/*public PageUtil getPageInfoByIdTerm(int nowPage, String cono, String term) {
		int totalCount = ordDAO.getPageInfoByIdTerm(cono);
		PageUtil pinfo = new PageUtil(nowPage, totalCount);
		return pinfo;
	}*/


}
