package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.CalrecipeDAO;
import com.all.light.dao.FreeBoardDAO;
import com.all.light.dto.FreeBoardDTO;
import com.all.light.dto.NoticeDTO;
import com.all.light.util.PageUtil;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO freDAO;

	public void write(FreeBoardDTO fdto) {
		freDAO.write(fdto);
	}

	public PageUtil getPageInfo(int nowPage, String searchWord, String searchType, String ftype) {
		PageUtil pInfo = new PageUtil(searchWord, searchType);
		pInfo.setFtype(ftype);
		int Cnt = freDAO.getPageInfo(pInfo);
		pInfo = new PageUtil(nowPage, Cnt);
		return pInfo;
	}

	public ArrayList<FreeBoardDTO> searchList(PageUtil pInfo, String searchWord, String searchType, String ftype) {
		pInfo.setSearchWord(searchWord);
		pInfo.setSearchType(searchType);
		pInfo.setFtype(ftype);
		return freDAO.searchList(pInfo);
	}

}
