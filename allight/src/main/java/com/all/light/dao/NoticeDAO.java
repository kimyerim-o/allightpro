package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

public class NoticeDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;
	
	public int getTotalCnt(String searchWord) {
		return session.selectOne("notice.totalCntWithSearch",searchWord);
	}


	public ArrayList<NoticeDTO> searchList(PageUtil pInfo) {
		return (ArrayList)session.selectList("notice.searchList",pInfo);
	}

}
