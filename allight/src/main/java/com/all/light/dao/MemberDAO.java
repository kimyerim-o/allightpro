package com.all.light.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.MemberDTO;
import com.all.light.util.PageUtil;

public class MemberDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;

	public HashMap login(HashMap map) {
		System.out.println("MemberDAO : " + map.toString());
		HashMap result = session.selectOne("member.login", map);
		return result;
	}

	// 7.3 최근 접속일 갱신
	public void logDate(HashMap result) {
		System.out.println("map = "+result+"\nmap.get(MNO) = "+result.get("MNO").getClass());
		// 오류해결 java.math.BigDecimal cannot be cast to java.lang.Integer
			// 1. int mno =Integer.parseInt(String.valueOf(result.get("MNO"))); -(SQL.xml에서 int로 받을 시)
			// 2. session.update("member.logDate", result.get("MNO")); -(SQL.xml에서 HashMap으로 받을 시)
		session.update("member.logDate", result.get("MNO"));
	}

	public HashMap kakao(MemberDTO memdto) {
		System.out.println("UserDAO");
		System.out.println(memdto.getMid());
		HashMap result = session.selectOne("member.kakao", memdto);
		System.out.println("result" + result);
		return result;
	}

	public HashMap join(MemberDTO memdto) {
		System.out.println("UserDAO join");
		System.out.println(memdto);
		// 수정삭제가 만들어진후에 변경
		int i = session.insert("member.kinsert", memdto);
		System.out.println(i);
		HashMap res = null;
		if (i == 1) {
			res = session.selectOne("member.kakao", memdto);
		}
		return res;
	}

	// 유태우7.2작성
	public ArrayList list(PageUtil pInfo) {
		System.out.println("MemberDAO.list = " + pInfo.toString());
		return (ArrayList) session.selectList("member.list", pInfo);
	}

	public int getTotalCnt(String searchWord) {
		int totalCnt = session.selectOne("member.totalCnt", searchWord);
		return totalCnt;
	}

	// 유태우7.3작성
	public ArrayList searchList(PageUtil pInfo, String searchWord) {
		pInfo.setSearchWord(searchWord);
		System.out.println("MemberDAO.searchList = " + pInfo.toString());
		return (ArrayList) session.selectList("member.searchList", pInfo);
	}

	public MemberDTO mInfo(int mno) {
		System.out.println("MemberDAO.mInfoList.mno = " + mno);
		return session.selectOne("member.memInfo", mno);
	}

	public void memModify(MemberDTO memDTO) {
		session.update("member.memUpdate", memDTO);
	}

	public void memDelete(int mno) {
		session.delete("member.memDelete", mno);
	}

}
