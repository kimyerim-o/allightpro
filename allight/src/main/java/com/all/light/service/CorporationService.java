package com.all.light.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.CorporationDAO;
import com.all.light.dto.CorporationDTO;

public class CorporationService {
	@Autowired
	private CorporationDAO corDAO;
	
	public void login(CorporationDTO cordto, HttpSession session) {
		System.out.println("CorporationService");
		//일반로그인
		HashMap map=new HashMap();
			map.put("coid",cordto.getCoid());
			map.put("copw",cordto.getCopw());
			HashMap result=corDAO.login(map);
			if(result==null || result.size()==0) {
				//로그인실패
				System.out.println("로그인실패");
			}else{
				//로그인성공
				System.out.println("로그인성공");
				session.setAttribute("COID",result.get("COID"));
		}
		
	}

}
