package com.all.light.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.QuestionDAO;
import com.all.light.dto.QuestionDTO;
import com.all.light.util.PageUtil;

public class QuestionService {
	@Autowired
	private QuestionDAO qesDAO;
	
	public ArrayList<QuestionDTO> list(PageUtil pinfo) {
		return qesDAO.list(pinfo);
	}

	public PageUtil getPageInfo(int nowPage, String id) {
		int totalCount = qesDAO.getTotalCnt(id);
		PageUtil pinfo = new PageUtil(nowPage, totalCount);
		return pinfo;
	}

	public void insertWrite(QuestionDTO qdto, HttpSession session) {
		qdto.setQid((String) session.getAttribute("MID"));
		String date=(String) session.getAttribute("DATE");
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
		try {
			Date today = format.parse(date);
			qdto.setQdate(today);
			System.out.println(qdto);
			qesDAO.insertWrite(qdto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	public QuestionDTO detail(QuestionDTO qdto) {
		return qesDAO.datail(qdto);
	}

}
