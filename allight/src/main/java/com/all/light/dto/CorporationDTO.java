package com.all.light.dto;

public class CorporationDTO {
	private int cono;
	private String coid;
	private String copw;
	private String coname;
	private String cotel;
	private String coemail;
	public int getCono() {
		return cono;
	}
	public void setCono(int cono) {
		this.cono = cono;
	}
	public String getCoid() {
		return coid;
	}
	public void setCoid(String coid) {
		this.coid = coid;
	}
	public String getCopw() {
		return copw;
	}
	public void setCopw(String copw) {
		this.copw = copw;
	}
	public String getConame() {
		return coname;
	}
	public void setConame(String coname) {
		this.coname = coname;
	}
	public String getCotel() {
		return cotel;
	}
	public void setCotel(String cotel) {
		this.cotel = cotel;
	}
	public String getCoemail() {
		return coemail;
	}
	public void setCoemail(String coemail) {
		this.coemail = coemail;
	}
	@Override
	public String toString() {
		return "CorporationDTO [cono=" + cono + ", coid=" + coid + ", copw=" + copw + ", coname=" + coname + ", cotel="
				+ cotel + ", coemail=" + coemail + "]";
	}
	
	
	
	
}
