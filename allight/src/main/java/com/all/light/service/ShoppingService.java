package com.all.light.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.ShoppingDAO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.util.PageUtil;

public class ShoppingService {
	
	@Autowired
	private ShoppingDAO shopDAO;
	
	public PageUtil getPageInfo(int nowPage, String icategory) {
		
		int totalCount = shopDAO.getTotalCnt(icategory);
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,32,5);
		
		return pInfo;
	}
	

	public ShoppingDTO list(PageUtil pInfo, String icategory) {


		return null;
	}


	public ShoppingDTO listAll(PageUtil pInfo) {
		
	
		
		return null;
	}
}
