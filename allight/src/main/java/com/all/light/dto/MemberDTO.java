package com.all.light.dto;

import java.time.LocalDate;
// java.util.date => sql.date => view단에서 post방식으로 처리할 시 인식되지 않음
// sql.date어제는 됐는데 왜 오늘은 안됨.. (?)
// 에러내용, 400에러 
/*400에러, 클라이언트 오류로서 인지된 어떤 문제로 인하여, 서버가 해당 요청을 처리할 수 없거나, 처리하지 않을 것입니다. 
(예: 잘못된 요청 문법, 유효하지 않은 요청 메시지 framing, 또는 신뢰할 수 없는 요청 라우팅).*/
//sql.timestamp
//time.LocalDate, time.LocalDateTime
public class MemberDTO {
	private int mno;
	private String mid;
	private String mpw;
	private String memail;
	private String memail2;
	private String mname;
	private String mnick;
	private String mbirth;
	private String mtel;
	private String mtel1;
	private String mtel2;
	private LocalDate mjoindate;
	private LocalDate mlogdate;
	private String msex;
	private int mtype;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
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
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
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
	public String getMtel2() {
		return mtel2;
	}
	public void setMtel2(String mtel2) {
		this.mtel2 = mtel2;
	}
	public LocalDate getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(LocalDate mjoindate) {
		this.mjoindate = mjoindate;
	}
	public LocalDate getMlogdate() {
		return mlogdate;
	}
	public void setMlogdate(LocalDate mlogdate) {
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
	
	public String getMemail2() {
		return memail2;
	}
	public void setMemail2(String memail2) {
		this.memail2 = memail2;
	}
	public String getMtel1() {
		return mtel1;
	}
	public void setMtel1(String mtel1) {
		this.mtel1 = mtel1;
	}
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", memail=" + memail + ", memail2=" + memail2
				+ ", mname=" + mname + ", mnick=" + mnick + ", mbirth=" + mbirth + ", mtel=" + mtel + ", mtel1=" + mtel1
				+ ", mtel2=" + mtel2 + ", mjoindate=" + mjoindate + ", mlogdate=" + mlogdate + ", msex=" + msex
				+ ", mtype=" + mtype + ", getMno()=" + getMno() + ", getMid()=" + getMid() + ", getMpw()=" + getMpw()
				+ ", getMemail()=" + getMemail() + ", getMname()=" + getMname() + ", getMnick()=" + getMnick()
				+ ", getMbirth()=" + getMbirth() + ", getMtel()=" + getMtel() + ", getMtel2()=" + getMtel2()
				+ ", getMjoindate()=" + getMjoindate() + ", getMlogdate()=" + getMlogdate() + ", getMsex()=" + getMsex()
				+ ", getMtype()=" + getMtype() + ", getMemail2()=" + getMemail2() + ", getMtel1()=" + getMtel1()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
