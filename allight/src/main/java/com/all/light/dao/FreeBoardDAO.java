package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.FreeBoardDTO;
import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

public class FreeBoardDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;

	public void write(FreeBoardDTO fdto) {
		session.insert("freeboard.write",fdto);
	}

	public int getPageInfo(PageUtil pInfo) {
		return session.selectOne("freeboard.getPageInfo",pInfo);
	}

	public ArrayList<FreeBoardDTO> searchList(PageUtil pInfo) {
		return (ArrayList) session.selectList("freeboard.searchList",pInfo);
	}
	
}