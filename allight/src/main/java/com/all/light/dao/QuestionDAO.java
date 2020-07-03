package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.util.PageUtil;

public class QuestionDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	public ArrayList list(PageUtil pInfo) {
		System.out.println("question.list!!!!!!!!!!"+pInfo);
		return (ArrayList) session.selectList("question.list", pInfo);
	}

	public int getTotalCnt() {
		int totalCnt = session.selectOne("question.totalCnt");
		System.out.println(totalCnt);
		return totalCnt;
	}
}
