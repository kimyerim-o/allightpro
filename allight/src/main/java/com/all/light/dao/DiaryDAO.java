package com.all.light.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.DiaryDTO;

public class DiaryDAO extends SqlSessionDaoSupport {

	@Autowired
	SqlSessionTemplate session;
	
	public List<DiaryDTO> main(String mid, int year, int month) {
		System.out.println("dao");
		HashMap<String,Object> map = new HashMap<String,Object>(); 	// 파라미터 보낼 맵
		map.put("mid", mid);
		map.put("year", year);
		map.put("month", month);
		
		List<DiaryDTO> list = (ArrayList)session.selectList("diary.main", map);;
		
		System.out.println(list.toString());
		return list;
	}

}
