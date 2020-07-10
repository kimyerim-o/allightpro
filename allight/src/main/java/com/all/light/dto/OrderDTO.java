package com.all.light.dto;

import java.util.Date;

public class OrderDTO {
	private int ono;//주문번호
	private String mid;
	private Date odate;//주문날짜
	private String oaddno;//우편번호
	private String oaddress1;//주소
	private String oaddress2;//상세주소
	private String otel;
	private String oreceiver;
	private String orequirethings;//요구사항
	private Date searchdate;//찾는 날짜
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getOaddno() {
		return oaddno;
	}
	public void setOaddno(String oaddno) {
		this.oaddno = oaddno;
	}
	public String getOaddress1() {
		return oaddress1;
	}
	public void setOaddress1(String oaddress1) {
		this.oaddress1 = oaddress1;
	}
	public String getOaddress2() {
		return oaddress2;
	}
	public void setOaddress2(String oaddress2) {
		this.oaddress2 = oaddress2;
	}
	public String getOtel() {
		return otel;
	}
	public void setOtel(String otel) {
		this.otel = otel;
	}
	public String getOreceiver() {
		return oreceiver;
	}
	public void setOreceiver(String oreceiver) {
		this.oreceiver = oreceiver;
	}
	public String getOrequirethings() {
		return orequirethings;
	}
	public void setOrequirethings(String orequirethings) {
		this.orequirethings = orequirethings;
	}
	public Date getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(Date searchdate) {
		this.searchdate = searchdate;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [ono=" + ono + ", mid=" + mid + ", odate=" + odate + ", oaddno=" + oaddno + ", oaddress1="
				+ oaddress1 + ", oaddress2=" + oaddress2 + ", otel=" + otel + ", oreceiver=" + oreceiver
				+ ", orequirethings=" + orequirethings + ", searchdate=" + searchdate + "]";
	}
	
	
	
}
