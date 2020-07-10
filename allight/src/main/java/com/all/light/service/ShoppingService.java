package com.all.light.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.ShoppingDAO;
import com.all.light.dto.ReviewDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.util.PageUtil;

public class ShoppingService {
	
	@Autowired
	private ShoppingDAO shopDAO;
	
	// ------------상품 목록-----------------------------------------------------
	// 페이지정보
	public PageUtil getPageInfo(int nowPage, String icategory) {
		int totalCount = 0;
		
		if(icategory.equals("all")) {
			totalCount = shopDAO.getAllTotalCnt();
		}else {
			totalCount = shopDAO.getTotalCnt(icategory);
		}
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,40,5);
		
		return pInfo;
	}
	
	// 카테고리별 게시물 가져오기
	public ArrayList<ShoppingDTO> list(PageUtil pInfo, String icategory, int sort) {
		ArrayList<ShoppingDTO> list = shopDAO.list(pInfo,icategory,sort);
		return list;
	}
	
	// 모든 게시물 가져오기
	public ArrayList<ShoppingDTO> listAll(PageUtil pInfo,int sort) {
		ArrayList<ShoppingDTO> list = shopDAO.listAll(pInfo,sort);
		return list;
	}
	
	// 대표 이미지 가져오기
	public String getRepreImage(int ino) {
		String repreImg = shopDAO.getRepreImage(ino);
		return repreImg;
	}
	
	// 검색된 게시물 가져오기 
	public ArrayList<ShoppingDTO> searchList(String searchWord) {
		ArrayList<ShoppingDTO> list = shopDAO.searchList(searchWord);
		return list;
	}
	
	
	// ------------브랜드관-----------------------------------------------------
	// 브랜드관 브랜드 목록 가져오기
	public ArrayList<String> brandNames() {
		ArrayList<String> brandNames = shopDAO.brandNames();
		return brandNames;
	}

	// 해당 브랜드 페이지 정보
	public PageUtil getBrandPageInfo(int nowPage, String brand) {
		int totalCount = 0;
		totalCount = shopDAO.getBrandTotalCnt(brand);
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,40,5);
		
		return pInfo;
	}
	
	// 해당 브랜드 상품 리스트 가져오기
	public ArrayList<ShoppingDTO> brandContent(String brand,int sort,PageUtil pInfo) {
		ArrayList<ShoppingDTO> list = shopDAO.brandContent(brand,sort,pInfo);
		return list;
	}
	
	// ------------상세 페이지-----------------------------------------------------
	// 상품 상세 정보 가져오기
	public ShoppingDTO getDetail(int ino) {
		System.out.println("getDetail"+ino);
		ShoppingDTO shopDTO = shopDAO.getDetail(ino);
		return shopDTO;
	}
	
	// 상품 상세 이미지 가져오기
	public ArrayList<String> getImgs(int ino) {
		ArrayList<String> list = shopDAO.getImgs(ino);
		return list;
	}

	// 상품 후기 페이지 정보
	public PageUtil getRPageInfo(int ino, int rNowPage) {
		int totalCount = 0;
		totalCount = shopDAO.getRTotalCnt(ino);
		
		// PageUtil(보고싶은페이지, 전체게시물수, 보여줄 게시물수, 페이징);
		PageUtil pInfo = new PageUtil(rNowPage, totalCount,5,5);
		
		return pInfo;
	}

	// 상품 후기 전체 개수 가져오기
	public int getRTotalCnt(int ino) {
		int rTotalCnt = shopDAO.getRTotalCnt(ino);
		return rTotalCnt;
	}
	
	// 상품 후기 리스트 가져오기
	public ArrayList<ReviewDTO> getReview(int ino, PageUtil rPInfo, String mid) {
		ArrayList<ReviewDTO> list = shopDAO.getReview(ino,rPInfo);
		
		for(int i=0; i<list.size();i++) {
			if(this.isLike(list.get(i).getRno(), mid)==1){
				list.get(i).setIsLiked(Boolean.TRUE);
			}
		}
		return list;
	}

	public int isLike(int rno, String mid) {
		//isLike 이 아이디 사람이 이미 좋아요 했으면 1, 안했으면 0
		int isLike = shopDAO.getIsLike(rno,mid);
		
		return isLike;
	}
	
	public void reviewLike(int rno, String mid) {
		//isLike 이 아이디 사람이 이미 좋아요 했으면 1, 안했으면 0
		int isLike = shopDAO.getIsLike(rno,mid);
		
		switch (isLike) {
		case 0: //좋아요 추가
			shopDAO.rLikeIns(rno,mid);
			break;
		case 1: //좋아요 삭제
			shopDAO.rLikeDel(rno,mid);
		}
	}
}
