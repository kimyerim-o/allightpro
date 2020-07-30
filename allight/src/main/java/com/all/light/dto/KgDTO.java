package com.all.light.dto;

public class KgDTO {

	private double dweight;
	private String ddate;
	
	
	public double getDweight() {
		return dweight;
	}
	public void setDweight(double dweight) {
		this.dweight = dweight;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	
	@Override
	public String toString() {
		return "KgDTO [dweight=" + dweight + ", ddate=" + ddate + "]";
	}	
	
}
