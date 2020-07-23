package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.CaldictionaryDTO;
import com.all.light.util.PageUtil;

public class CaldictionaryDAO extends SqlSessionDaoSupport {

	@Autowired
	SqlSessionTemplate session;

	
	// 전체 게시물 수 조회 - 음식
	public int getTotalCnt(String searchWord) {
		System.out.println("DAO 전체 게시물 수 조회 - getTotalCnt() 진입");
		int totalCnt = session.selectOne("cal.totalCntWithSearch", searchWord);
		return totalCnt;
		
	}

	// 검색 및 리스트 조회 - 음식
	public ArrayList<CaldictionaryDTO> searchList(PageUtil pInfo) {
		System.out.println("DAO 상품 목록 조회 - searchList(pInfo) 진입 = " + pInfo);
		return (ArrayList)session.selectList("cal.searchList", pInfo);// TODO Auto-generated method stub
	}
	
	
	
}
