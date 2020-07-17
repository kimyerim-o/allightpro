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
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			list.get(i).setOrdernum(format.format(list.get(i).getOdate())+
					list.get(i).getMno()+list.get(i).getOno());
			list.get(i).setSodate(format2.format(list.get(i).getOdate()));		
			
			odata.setOdto(list);
			System.out.println("LIST"+i+"///"+list.get(i));
			
			listde=ordDAO.listde(list.get(i).getOno());
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
	//상세
	public OrderData detail(HttpSession session, OrderData odata, OrderDTO odto, OrderdetailDTO oddto, int ono) {
		odto.setMid((String) session.getAttribute("MID"));
		odto.setOno(ono);
		OrderDTO list=ordDAO.detail(odto);
		odata.setOdto1(list);
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		list.setOrdernum(format.format(list.getOdate())+list.getMno()+list.getOno());
		list.setSodate(format2.format(list.getOdate()));		
		oddto.setOno(list.getOno());
		ArrayList<OrderdetailDTO> listde=ordDAO.listde(ono);
		odata.setOddto(listde);			
		ArrayList<ShoppingDTO> shop=null;
		int sum=0;
		for(int j=0;j<listde.size();j++) {	
			int price=listde.get(j).getOdprice();
			sum=sum+price;
			int ino=listde.get(j).getIno();
			shop= ordDAO.iteminfo(ino);
			if(odata.getSdto()==null) {
				odata.setSdto(shop);
			}else if(odata.getSdto()!=null) {
				odata.getSdto().addAll(shop);
			}
		}
		list.setSum(sum);
		System.out.println(odata);
		return odata;
	}
	
	//상태 변경
	public void change(OrderdetailDTO oddto) {
		System.out.println(oddto);
		ordDAO.change(oddto);
	}
	//취소반품조회
	public OrderData back(HttpSession session, OrderData odata, OrderDTO odto, OrderdetailDTO oddto, ShoppingDTO sdto, String type, String term) {
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
		if(type==null) {
			oddto.setType(null);
			odto.setType(null);
		}else if(type.equals("cancel")) {
			oddto.setType("주문취소");
			odto.setType("주문취소");
		}else if(type.equals("back")) {
			oddto.setType("반품");
			odto.setType("반품");
		}
		ArrayList<OrderDTO> list=ordDAO.backlist(odto);
		System.out.println(list);
		ArrayList<OrderdetailDTO> listde=null;
		ArrayList<ShoppingDTO> shop=null;
		for(int i=0;i<list.size();i++) {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			list.get(i).setOrdernum(format.format(list.get(i).getOdate())+
					list.get(i).getMno()+list.get(i).getOno());
			list.get(i).setSodate(format2.format(list.get(i).getOdate()));		
			
			odata.setOdto(list);
			oddto.setOno(list.get(i).getOno());
			listde=ordDAO.back(oddto);
			if(odata.getOddto()==null) {
				odata.setOddto(listde);
			}else if(odata.getOddto()!=null) {
				odata.getOddto().addAll(listde);
			}
			for(int j=0;j<listde.size();j++) {
				
				int ino=listde.get(j).getIno();
				shop= ordDAO.iteminfo(ino);
				if(odata.getSdto()==null) {
					odata.setSdto(shop);
				}else if(odata.getSdto()!=null) {
					odata.getSdto().addAll(shop);
				}
			}
		}
		System.out.println(odata);
		return odata;
	}
	
	//계좌번호,은행
	public void check(int mno, MemberDTO mdto) {
		ordDAO.check(mno,mdto);
	}


	//기업
	//페이징
	public PageUtil pageOrderCono(int nowPage, int cono, String star, String las, String type) {
		int totalCount=0;
		if (star==null || star.isEmpty() || las==null || las.isEmpty() ) {
			System.out.println(cono);
			if(type==null) {
				totalCount = ordDAO.pageOrderCono(cono);
			}else {
				System.out.println("pageOrderCono"+type);
				totalCount = ordDAO.pageOrderConoType(cono,type);
			}
		}else if(star!=null && las!=null) {
			java.sql.Date start=java.sql.Date.valueOf(star);
			java.sql.Date last=java.sql.Date.valueOf(las);
			if(type==null) {
				totalCount = ordDAO.pageOrderConoTerm(cono,start,last);
			}else {
				totalCount = ordDAO.pageOrderConoTermType(cono,start,last,type);
			}
		}
		PageUtil pinfo = new PageUtil(nowPage, totalCount,2,5);
		return pinfo;
	}
	
	public OrderData listCorp(HttpSession session, OrderData odata, OrderDTO odto, OrderdetailDTO oddto, PageUtil pinfo) {
		ArrayList<OrderdetailDTO> listde=ordDAO.listdeCorp(pinfo);
		OrderDTO list=null;
		ArrayList<ShoppingDTO> shop=null;
		for(int i=0;i<listde.size();i++) {
			odata.setOddto(listde);
			list=ordDAO.listCorp(listde.get(i).getOno());
			System.out.println(listde.get(i).getOno()+"/////"+list.getOno());
			if(odata.getOdto1()==null) {
				System.out.println("nullll");
				odata.setOdto1(list);
			}else if(odata.getOdto1()!=null && listde.get(i).getOno()!=list.getOno()) {
				System.out.println("not nullll");
				odata.getOdto().add(list);
			}
			int ino=listde.get(i).getIno();
			shop= ordDAO.iteminfo(ino);
			if(odata.getSdto()==null) {
				odata.setSdto(shop);
			}else if(odata.getSdto()!=null) {
				odata.getSdto().addAll(shop);
			}
		}
		System.out.println(odata);
		return odata;
	}
	
	public OrderData detailCorp(HttpSession session, OrderData odata, OrderDTO odto, OrderdetailDTO oddto,
			MemberDTO mdto, int odno) {
		OrderdetailDTO listde=ordDAO.detailCorp(odno);
		odata.setOddto1(listde);
		OrderDTO list=ordDAO.detailByNo(listde.getOno());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		list.setOrdernum(format.format(list.getOdate())+list.getMno()+list.getOno());
		odata.setOdto1(list);
		ShoppingDTO shop=ordDAO.iteminfoCorp(listde.getIno());
		odata.setSdto1(shop);
		mdto.setMid(list.getMid());
		mdto.setMno(list.getMno());
		MemberDTO mlist=ordDAO.memIdNo(mdto);
		odata.setMdto1(mlist);
		return odata;
	}
	
	
	public void delivery(OrderdetailDTO oddto) {
		ordDAO.delivery(oddto);
	}


}
