package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.CaldictionaryDAO;
import com.all.light.dto.CaldictionaryDTO;
import com.all.light.dto.ItemDTO;
import com.all.light.util.PageUtil;

@Service
public class CaldictionaryService {

	@Autowired
	CaldictionaryDAO calDAO;

	//음식
	public PageUtil getPageInfo(int nowPage, String searchWord) {
		System.out.println("서비스 상품리스트 페이징 관련 - getPageInfo() 진입");
		
		int totalCount = calDAO.getTotalCnt(searchWord);

		PageUtil pInfo = new PageUtil(nowPage, totalCount, 15, 5);
		// PageUtil(보고싶은페이지, 전체게시물수);
		// 검색어에 따른 총 게시물 수를 구하고 페이지 정보를 리턴함
		return pInfo;
	}

	public ArrayList<CaldictionaryDTO> getListView(PageUtil pInfo, String searchWord) {
		System.out.println("서비스 상품리스트 페이징 관련 - getListView() 진입");
		pInfo.setSearchWord(searchWord);
		ArrayList<CaldictionaryDTO> list = calDAO.searchList(pInfo);
		System.out.println("서비스 상품리스트 페이징 관련 - getListView() list " + list);
		return list;
	}
	
}
