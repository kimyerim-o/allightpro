package com.all.light.dto;

import java.util.Date;

public class MemberDTO {
	private int mno;
	private String mid;
	private String mpw;
<<<<<<< HEAD
	private String email;
	private String name;
	private String nick;
	private String birth;
	private String tel;
	private String tel2;
	private int type;
	private Date joinDate;
	private Date logDate;
	private String sex;
	private String addno;
	private String address;
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
	public String getEmail() {
		return email;
=======
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
>>>>>>> yerim
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
<<<<<<< HEAD
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth() {
		return birth;
=======
	public String getMbirth() {
		return mbirth;
>>>>>>> yerim
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
<<<<<<< HEAD
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getLogDate() {
		return logDate;
	}
	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddno() {
		return addno;
=======
	public String getMtel2() {
		return mtel2;
>>>>>>> yerim
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
<<<<<<< HEAD
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", email=" + email + ", name=" + name
				+ ", nick=" + nick + ", birth=" + birth + ", tel=" + tel + ", tel2=" + tel2 + ", type=" + type
				+ ", joinDate=" + joinDate + ", logDate=" + logDate + ", sex=" + sex + ", addno=" + addno + ", address="
				+ address + "]";
=======
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
>>>>>>> yerim
	}
}
