package com.all.light.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.MemberDTO;

public class ShoppingDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	public int getTotalCnt(String icategory) {
		
		int cnt = session.selectOne("", icategory);
		
		return cnt;
	}
}
