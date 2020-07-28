package com.all.light.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class BuyDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	public String buy(String mid) {
		
		return null;
	}

}
