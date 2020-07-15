package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.NoticeDAO;
import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

public class NoticeService {

	@Autowired
	private NoticeDAO notDAO;
	
	public PageUtil getPageInfo(int nowPage, String searchWord, String searchType) {
		PageUtil pInfo = new PageUtil(searchWord, searchType);
		int totalCount = notDAO.getTotalCnt(pInfo); //검색어에 따른 게시물 수를 구함
		pInfo = new PageUtil(nowPage, totalCount);
		return pInfo;
	}

	public ArrayList<NoticeDTO> searchList(PageUtil pInfo, String searchWord, String searchType) {
		pInfo.setSearchWord(searchWord);
		pInfo.setSearchType(searchType);
		return notDAO.searchList(pInfo);
	}

	public void notModify(NoticeDTO notDTO) {
		notDAO.notModify(notDTO);
	}

	public NoticeDTO getNotInfo(int nno) {
		return notDAO.getNotInfo(nno);
	}

	public void notWrite(NoticeDTO notDTO) {
		notDAO.notWrite(notDTO);
	}

	public void notDelete(int nno) {
		notDAO.notDelete(nno);
	}
	
}
