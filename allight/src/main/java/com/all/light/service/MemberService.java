package com.all.light.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.MemberDAO;
import com.all.light.dto.MemberDTO;
import com.all.light.util.PageUtil;

public class MemberService {
	@Autowired
	private MemberDAO memDAO;
	
	//일반로그인
	public HashMap login(MemberDTO memdto, HttpSession session) {
		System.out.println("MemberService");
		HashMap map=new HashMap();
			map.put("mid",memdto.getMid());
			map.put("mpw",memdto.getMpw());
			HashMap result=memDAO.login(map);
			//날짜
			java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
			if(result==null || result.size()==0) {
				//로그인실패
				System.out.println("로그인실패");
				return result;
			}else{
				//로그인성공
				System.out.println("로그인성공");
				session.setAttribute("MNO",result.get("MNO"));
				session.setAttribute("MID",result.get("MID"));
				session.setAttribute("MPW", result.get("MPW"));
				session.setAttribute("MEMAIL", result.get("MEMAIL"));
				session.setAttribute("MNAME", result.get("MNAME"));
				session.setAttribute("MBIRTH", result.get("MBIRTH"));
				session.setAttribute("MTEL", result.get("MTEL"));
				session.setAttribute("MTYPE", result.get("MTYPE"));
				session.setAttribute("DATE", date);
				memDAO.logDate(result);
		}
			return result;
	}
	
	//카카오로그인
	public HashMap kakao(Map<String, Object> param, MemberDTO memdto, HttpSession session) {
		memdto.setMid((String) param.get("id"));
		System.out.println("UserService" + memdto.getMid());
		HashMap result = memDAO.kakao(memdto);
		if (result == null || result.size() == 0) {
			// 로그인실패
			System.out.println("로그인실패");
			HashMap res = memDAO.join(memdto);
			if (res != null) {
				System.out.println("res.get(\"MID\")" + res.get("MID"));
				session.setAttribute("ID", res.get("MID"));
				System.out.println("res" + res.get("MID"));
			}
			return res;
		} else {
			// 로그인성공
			System.out.println("로그인성공");
			session.setAttribute("MID", result.get("MID"));
			System.out.println("result" + result.get("MID"));
		}
		return result;
	}
	
	//공통로그아웃
	public void logout(HttpSession session) {
		if(session.getAttribute("MID")!=null) {
			session.invalidate();
		}else {
			System.out.println("null logout");
		}
	}

	//검색 및 회원수 가져오기 메소드
	public PageUtil getPageInfo(int nowPage, String searchWord) {
		int totalCount = memDAO.getTotalCnt(searchWord);
		// PageUtil(보고싶은페이지, 전체게시물수);
		// 검색어에 따른 총 게시물 수를 구하고 페이지 정보를 리턴함
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		return pInfo;
	}
	
	//검색 및 리스트 출력 메소드
	public ArrayList<MemberDTO> searchList(PageUtil pInfo, String searchWord){
		pInfo.setSearchWord(searchWord);
		return memDAO.searchList(pInfo);
	}
	
	public MemberDTO getMInfo(int mno) {
		return memDAO.getMInfo(mno);
	}

	public void memModify(MemberDTO memDTO) {
		memDAO.memModify(memDTO);
	}

	public void memDelete(int mno) {
		memDAO.memDelete(mno);
	}

}
