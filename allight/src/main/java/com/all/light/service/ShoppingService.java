package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.ShoppingDAO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.util.PageUtil;

public class ShoppingService {
	
	@Autowired
	private ShoppingDAO shopDAO;
	
	// ------------상품 목록-----------------------------------------------------
	// 페이지정보
	public PageUtil getPageInfo(int nowPage, String icategory) {
		int totalCount = 0;
		
		if(icategory.equals("all")) {
			totalCount = shopDAO.getAllTotalCnt();
		}else {
			totalCount = shopDAO.getTotalCnt(icategory);
		}
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,40,5);
		
		return pInfo;
	}

	public ArrayList<ShoppingDTO> list(PageUtil pInfo, String icategory, int sort) {
		ArrayList<ShoppingDTO> list = shopDAO.list(pInfo,icategory,sort);
		return list;
	}
	
	// 모든 게시물 가져오기
	public ArrayList<ShoppingDTO> listAll(PageUtil pInfo,int sort) {
		ArrayList<ShoppingDTO> list = shopDAO.listAll(pInfo,sort);
		return list;
	}
	
	// 대표 이미지 가져오기
	public String getRepreImage(int ino) {
		String repreImg = shopDAO.getRepreImage(ino);
		return repreImg;
	}
	
	// 검색된 게시물 가져오기 
	public ArrayList<ShoppingDTO> searchList(String searchWord) {
		ArrayList<ShoppingDTO> list = shopDAO.searchList(searchWord);
		return list;
	}
	
	
	// ------------브랜드관-----------------------------------------------------
	// 브랜드관 브랜드 목록 가져오기
	public ArrayList<String> brandNames() {
		ArrayList<String> brandNames = shopDAO.brandNames();
		return brandNames;
	}

	public ArrayList<ShoppingDTO> brandContent(String brand,int sort,PageUtil pInfo) {
		ArrayList<ShoppingDTO> list = shopDAO.brandContent(brand,sort,pInfo);
		return list;
	}

	public PageUtil getBrandPageInfo(int nowPage, String brand) {
		int totalCount = 0;
		totalCount = shopDAO.getBrandTotalCnt(brand);
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,40,5);
		
		return pInfo;
	}

}
