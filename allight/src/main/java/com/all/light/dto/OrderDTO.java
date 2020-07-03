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
	private String ocouriercompany;//택배회사
	private String orequirethings;//요구사항
	private String ostatus;
	private String oinvoicenumber;//송장번호
	private int odno;//주문상세번호
	private int ino;//상품번호
	private int odamount;//수량
	private int odprice;//가격
	
	public int getOdno() {
		return odno;
	}
	public void setOdno(int odno) {
		this.odno = odno;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getOdamount() {
		return odamount;
	}
	public void setOdamount(int odamount) {
		this.odamount = odamount;
	}
	public int getOdprice() {
		return odprice;
	}
	public void setOdprice(int odprice) {
		this.odprice = odprice;
	}
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
	public String getOcouriercompany() {
		return ocouriercompany;
	}
	public void setOcouriercompany(String ocouriercompany) {
		this.ocouriercompany = ocouriercompany;
	}
	public String getOrequirethings() {
		return orequirethings;
	}
	public void setOrequirethings(String orequirethings) {
		this.orequirethings = orequirethings;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public String getOinvoicenumber() {
		return oinvoicenumber;
	}
	public void setOinvoicenumber(String oinvoicenumber) {
		this.oinvoicenumber = oinvoicenumber;
	}
	
	
}
