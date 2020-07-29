package com.all.light.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dto.FreeBoardDTO;
import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

public class FreeBoardDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;

	public void write(FreeBoardDTO fdto, String string) {
		if("fboard".equals(string)) {
			session.insert("freeboard.write",fdto);
			System.out.println("자유게시판 입력완료");
		}else if("fInfo".equals(string)) {
			session.insert("freeboard.writeFile", fdto);
			System.out.println("자유게시판 파일입력완료");
		}
		
	}

	public int getPageInfo(PageUtil pInfo) {
		return session.selectOne("freeboard.getPageInfo",pInfo);
	}

	public ArrayList<FreeBoardDTO> searchList(PageUtil pInfo) {
		return (ArrayList) session.selectList("freeboard.searchList",pInfo);
	}

	//Detail페이지
	public FreeBoardDTO getDetail(int fno) {
		return session.selectOne("freeboard.getDetail",fno);
	}

	public ArrayList<FreeBoardDTO> getFile(int fno) {
		return (ArrayList) session.selectList("freeboard.getFile",fno);
	}

	public int getTotalCntOfComm(int fno) {
		return session.selectOne("freeboard.getTotalCntOfComm",fno);
	}

	public ArrayList<FreeBoardDTO> getCommDetail(PageUtil pInfo) {
		return (ArrayList)session.selectList("freeboard.getCommList",pInfo);
	}
	
}