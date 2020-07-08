package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.QuestionDTO;
import com.all.light.util.PageUtil;

public class QuestionDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	public ArrayList list(PageUtil pinfo) {
		System.out.println("question.list!!!!!!!!!!"+pinfo);
		return (ArrayList) session.selectList("question.list", pinfo);
	}

	public int getTotalCnt(String id) {
		int totalCnt = session.selectOne("question.totalCnt",id);
		System.out.println(totalCnt);
		return totalCnt;
	}

	public void insertWrite(QuestionDTO qdto) {
		session.insert("question.insert", qdto);
	}

	public QuestionDTO datail(QuestionDTO qdto) {
		return session.selectOne("question.detail", qdto);
	}
}
