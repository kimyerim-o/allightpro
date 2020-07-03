package com.all.light.dto;

import java.util.Date;

public class MemberDTO {
	private int mno;
	private String mid;
	private String mpw;
	private String memail;
	private String mname;
	private String mbirth;
	private String mtel;
	private String mtel2;
	private String mjoindate;
	private String mlogdate;
	private String msex;
	private int mtype;
	
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public void setMtel2(String mtel2) {
		this.mtel2 = mtel2;
	}
	public String getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}
	public String getMlogdate() {
		return mlogdate;
	}
	public void setMlogdate(String mlogdate) {
		this.mlogdate = mlogdate;
	}
	public String getMsex() {
		return msex;
	}
	public void setMsex(String msex) {
		this.msex = msex;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
}
