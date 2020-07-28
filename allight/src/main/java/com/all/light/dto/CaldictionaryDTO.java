package com.all.light.dto;

public class CaldictionaryDTO {
	
	private int		cdno;	// 칼로리번호
	private String	cdtype;	// 구분
	private int 	cdcal;	// 칼로리값
	private String	cdname;	// 음식/운동이름
	private String	mid;	// 아이디
	private int 	mno;	// 회원번호
	private int 	cdtan;	// 탄수화물
	private int 	cddan;	// 단백질
	private int 	cdji;	// 지방
	private int 	cdsik;	// 식이섬유
	private int 	cdna;	// 나트륨
	private int 	cdgram;	// 그램/시간
	private int 	cdamount;  // 수량
	
	
	public int getCdno() {
		return cdno;
	}
	public void setCdno(int cdno) {
		this.cdno = cdno;
	}
	public String getCdtype() {
		return cdtype;
	}
	public void setCdtype(String cdtype) {
		this.cdtype = cdtype;
	}
	public int getCdcal() {
		return cdcal;
	}
	public void setCdcal(int cdcal) {
		this.cdcal = cdcal;
	}
	public String getCdname() {
		return cdname;
	}
	public void setCdname(String cdname) {
		this.cdname = cdname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCdtan() {
		return cdtan;
	}
	public void setCdtan(int cdtan) {
		this.cdtan = cdtan;
	}
	public int getCddan() {
		return cddan;
	}
	public void setCddan(int cddan) {
		this.cddan = cddan;
	}
	public int getCdji() {
		return cdji;
	}
	public void setCdji(int cdji) {
		this.cdji = cdji;
	}
	public int getCdsik() {
		return cdsik;
	}
	public void setCdsik(int cdsik) {
		this.cdsik = cdsik;
	}
	public int getCdna() {
		return cdna;
	}
	public void setCdna(int cdna) {
		this.cdna = cdna;
	}
	public int getCdgram() {
		return cdgram;
	}
	public void setCdgram(int cdgram) {
		this.cdgram = cdgram;
	}
	public int getCdamount() {
		return cdamount;
	}
	public void setCdamount(int cdamount) {
		this.cdamount = cdamount;
	}
	
	@Override
	public String toString() {
		return "CaldictionaryDTO [cdno=" + cdno + ", cdtype=" + cdtype + ", cdcal=" + cdcal + ", cdname=" + cdname
				+ ", mid=" + mid + ", mno=" + mno + ", cdtan=" + cdtan + ", cddan=" + cddan + ", cdji=" + cdji
				+ ", cdsik=" + cdsik + ", cdna=" + cdna + ", cdgram=" + cdgram + ", cdamount=" + cdamount + "]";
	}

	
}