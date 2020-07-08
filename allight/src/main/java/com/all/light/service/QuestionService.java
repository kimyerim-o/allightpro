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
		qdto.setQdate((java.sql.Date) session.getAttribute("DATE"));
		qesDAO.insertWrite(qdto);		
	}

	public QuestionDTO detail(QuestionDTO qdto) {
		return qesDAO.datail(qdto);
	}

	public ArrayList<QuestionDTO> detailcomm(QuestionDTO qdto) {
		return qesDAO.detailcomm(qdto);
	}

	public void delete(QuestionDTO qdto) {
		qesDAO.delete(qdto);
	}

	public void update(QuestionDTO qdto, HttpSession session) {
		qdto.setQdate((java.sql.Date) session.getAttribute("DATE"));
		System.out.println("ser   "+qdto);
		qesDAO.update(qdto);
	}

}
