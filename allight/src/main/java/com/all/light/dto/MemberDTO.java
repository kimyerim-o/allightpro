package com.all.light.dto;

import java.util.Date;

public class MemberDTO {
	private int mno;
	private String mid;
	private String mpw;
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
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
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
	}
	public void setAddno(String addno) {
		this.addno = addno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", email=" + email + ", name=" + name
				+ ", nick=" + nick + ", birth=" + birth + ", tel=" + tel + ", tel2=" + tel2 + ", type=" + type
				+ ", joinDate=" + joinDate + ", logDate=" + logDate + ", sex=" + sex + ", addno=" + addno + ", address="
				+ address + "]";
	}
}
