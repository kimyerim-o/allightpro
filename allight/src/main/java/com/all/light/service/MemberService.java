package com.all.light.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.MemberDAO;
import com.all.light.dto.MemberDTO;

public class MemberService {
	@Autowired
	private MemberDAO memdao;
	
	public void login(MemberDTO memdto, HttpSession session) {
		System.out.println("MemberService");
		HashMap map=new HashMap();
		map.put("id",memdto.getId());
		map.put("pw",memdto.getPw());
		HashMap result=memdao.login(map);
		if(result==null || result.size()==0) {
			//로그인실패
			System.out.println("로그인실패");
		}else{
			//로그인성공
			System.out.println("로그인성공");
			session.setAttribute("ID",result.get("ID"));
			session.setAttribute("PW", result.get("PW"));
			session.setAttribute("EMAIL", result.get("EMAIL"));
			session.setAttribute("NAME", result.get("NAME"));
			session.setAttribute("BIRTH", result.get("BIRTH"));
			session.setAttribute("TEL", result.get("TEL"));
			session.setAttribute("ADDNO", result.get("ADDNO"));
			session.setAttribute("ADDRESS", result.get("ADDRESS"));
			session.setAttribute("TYPE", result.get("TYPE"));
		}
	}

}
