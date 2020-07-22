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
		pInfo.setRid(id);
		pInfo.setSearchWord(searchWord);
		System.out.println("reviewService.getPageInfo. pInfo = "+pInfo);
		return pInfo;
	}
	
	public ArrayList<ReviewDTO> getList(PageUtil pInfo) {
		System.out.println("reviewService.getList. pInfo = "+pInfo);
		return revDAO.getList(pInfo);
	}

	public void reviewWrite(ReviewDTO revDTO) {
		revDAO.reviewWrite(revDTO);
	}

	public void reviewDelete(ReviewDTO revDTO) {
		revDAO.reviewDelete(revDTO);
	}

	public ReviewDTO getReviewInfo(int num, String id) {
		ReviewDTO revDTO = new ReviewDTO(num, id);
		return revDAO.getReviewInfo(revDTO);
	}

	public void reviewUpdate(ReviewDTO revDTO) {
		revDAO.reviewUpdate(revDTO);
	}

	public PageUtil getPageInfoCorp(String id, int nowPage, String searchWord) {
		PageUtil pInfo = new PageUtil(searchWord);
		pInfo.setCoid(id);
		int totalCount = revDAO.getTotalCntCorp(pInfo); //게시물 수를 구함
		pInfo = new PageUtil(nowPage, totalCount); //게시물 수에 따른 페이징정보를 구함
		pInfo.setCoid(id);
		pInfo.setSearchWord(searchWord);
		System.out.println("reviewService.getPageInfoCorp. pInfo = "+pInfo);
		return pInfo;
	}
	
	public ArrayList<ReviewDTO> getListCorp(PageUtil pInfo) {
		System.out.println("reviewService.getListCorp. pInfo = "+pInfo);
		return revDAO.getListCorp(pInfo);
	}

	public void reviewDeleteCorp(ReviewDTO revDTO) {
		revDAO.reviewDeleteCorp(revDTO);
	}

}
