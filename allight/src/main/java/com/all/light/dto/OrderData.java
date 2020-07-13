package com.all.light.dto;

import java.util.ArrayList;

public class OrderData {
	private ArrayList<OrderDTO> odto;
	private ArrayList<OrderdetailDTO> oddto;
	private ArrayList<ShoppingDTO> sdto;
		
	public ArrayList<OrderDTO> getOdto() {
		return odto;
	}
	public void setOdto(ArrayList<OrderDTO> odto) {
		this.odto = odto;
	}
	public ArrayList<OrderdetailDTO> getOddto() {
		return oddto;
	}
	public void setOddto(ArrayList<OrderdetailDTO> oddto) {
		this.oddto = oddto;
	}
	public ArrayList<ShoppingDTO> getSdto() {
		return sdto;
	}
	public void setSdto(ArrayList<ShoppingDTO> sdto) {
		this.sdto = sdto;
	}
	
	

}
