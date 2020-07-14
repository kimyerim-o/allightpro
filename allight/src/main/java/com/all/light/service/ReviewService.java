package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.ReviewDAO;
import com.all.light.dto.ReviewDTO;
import com.all.light.util.PageUtil;

public class ReviewService {

	@Autowired
	ReviewDAO revDAO;
	
	public PageUtil getPageInfo(String id, int nowPage, String searchWord) {
		PageUtil pInfo = new PageUtil(searchWord);
		pInfo.setRid(id);
		int totalCount = revDAO.getTotalCnt(pInfo); //게시물 수를 구함
		pInfo = new PageUtil(nowPage, totalCount); //게시물 수에 따른 페이징정보를 구함
		return pInfo;
	}
	
	public ArrayList<ReviewDTO> getList(PageUtil pInfo) {
		return revDAO.getList(pInfo);
	}

	public void reviewWrite(ReviewDTO revDTO) {
		revDAO.reviewWrite(revDTO);
	}

	public void reviewDelete(ReviewDTO revDTO) {
		revDAO.reviewDelete(revDTO);
	}

	public ReviewDTO getReviewInfo(int ino, String id) {
		ReviewDTO revDTO = new ReviewDTO(ino, id);
		return revDAO.getReviewInfo(revDTO);
	}

	public void reviewUpdate(ReviewDTO revDTO) {
		revDAO.reviewUpdate(revDTO);
	}

	
	

}
