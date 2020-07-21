package com.all.light.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.CalrecipeDAO;
import com.all.light.dto.CalrecipeDTO;
import com.all.light.dto.MemberDTO;

public class CalrecipeService {
	@Autowired
	private CalrecipeDAO creDAO;
	
	public MemberDTO memberCheck(int mno) {
		return creDAO.memberCheck(mno);
	}
	
	public CalrecipeDTO recipeCheck(HttpSession session, CalrecipeDTO cdto) {
		// TODO Auto-generated method stub
		return null;
	}


}
