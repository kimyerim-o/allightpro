package com.all.light.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.MemberDTO;

public class CalrecipeDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	public MemberDTO memberCheck(int mno) {
		return session.selectOne("calrecipe.memberCheck", mno);
	}

}
