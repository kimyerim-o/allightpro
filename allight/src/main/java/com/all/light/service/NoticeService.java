package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.NoticeDAO;
import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

public class NoticeService {

	@Autowired
	private NoticeDAO notDAO;

	public PageUtil getPageInfo(int nowPage, String searchWord) {
		int totalCount = notDAO.getTotalCnt(searchWord);
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		return pInfo;
	}

	public ArrayList<NoticeDTO> searchList(PageUtil pInfo, String searchWord) {
		pInfo.setSearchWord(searchWord);
		return notDAO.searchList(pInfo);
	}

	public void notModify(NoticeDTO notDTO) {
		// TODO Auto-generated method stub
		
	}

	public void getNotInfo(int nno) {
		// TODO Auto-generated method stub
		
	}
	
}
