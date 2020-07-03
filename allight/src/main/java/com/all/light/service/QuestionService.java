package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.QuestionDAO;
import com.all.light.dto.QuestionDTO;
import com.all.light.util.PageUtil;

public class QuestionService {
	@Autowired
	private QuestionDAO qesDAO;
	
	public ArrayList<QuestionDTO> list(PageUtil pInfo) {
		System.out.println(qesDAO.list(pInfo));
		return qesDAO.list(pInfo);
	}

	public PageUtil getPageInfo(int nowPage) {
		int totalCount = qesDAO.getTotalCnt();
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		return pInfo;
	}

}
