package com.all.light.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.MemberDAO;
import com.all.light.dto.MemberDTO;

public class MemberService {
	@Autowired
	private MemberDAO memDAO;
	
	public void login(MemberDTO memdto, HttpSession session) {
		System.out.println("MemberService");
		//일반로그인
		HashMap map=new HashMap();
			map.put("mid",memdto.getMid());
			map.put("mpw",memdto.getMpw());
			HashMap result=memDAO.login(map);
			if(result==null || result.size()==0) {
				//로그인실패
				System.out.println("로그인실패");
			}else{
				//로그인성공
				System.out.println("로그인성공");
				session.setAttribute("MID",result.get("MID"));
				session.setAttribute("MPW", result.get("MPW"));
				session.setAttribute("MEMAIL", result.get("MEMAIL"));
				session.setAttribute("MNAME", result.get("MNAME"));
				session.setAttribute("MBIRTH", result.get("MBIRTH"));
				session.setAttribute("MTEL", result.get("MTEL"));
				session.setAttribute("MTYPE", result.get("MTYPE"));
		}
		
	
	}

	public HashMap kakao(Map<String, Object> param, MemberDTO memdto, HttpSession session) {
		memdto.setMid((String) param.get("id"));
		System.out.println("UserService"+memdto.getMid());
		HashMap result=memDAO.kakao(memdto);
		if(result==null || result.size()==0) {
			//로그인실패
			System.out.println("로그인실패");
			HashMap res=memDAO.join(memdto);
			if(res!=null) {
				System.out.println("res.get(\"MID\")"+res.get("MID"));
				session.setAttribute("ID",res.get("MID"));
				System.out.println("res"+res.get("MID"));
			}
			return res;
		}else{
			//로그인성공
			System.out.println("로그인성공");
			session.setAttribute("MID",result.get("MID"));
			System.out.println("result"+result.get("MID"));
	}
		return result;
	}

}
