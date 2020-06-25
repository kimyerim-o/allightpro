package com.all.light.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;


public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;
	
	public HashMap login(HashMap map) {
		System.out.println("MemberDAO : "+map.toString());
		HashMap result=session.selectOne("member.login", map);
		return result;
	}

}
