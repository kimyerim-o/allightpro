package com.all.light.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.FreeBoardDAO;
import com.all.light.dto.FreeBoardDTO;
import com.all.light.util.PageUtil;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO freDAO;

	public void write(FreeBoardDTO fdto, ArrayList list) {
		freDAO.write(fdto,"fboard");
		for(int i=0; i<list.size() ;i++) {
			//하나의 첨부파일의 정보는 Map으로 저장되어 있다
			HashMap map = (HashMap)list.get(i);
			/*map.put("path",    path);
			map.put("oriName", oriName);
			map.put("saveName",saveName);
			map.put("len", file.length()); 넣었으니..*/

			//DAO에서는  정보는 FileBoardDTO로 받기로 했으므로
			//--> DTO의  setter()를 이용하여 세팅한다
			fdto.setFipath((String)map.get("path"));
			fdto.setFioriname((String)map.get("oriName"));
			fdto.setFiimg((String)map.get("saveName"));
			fdto.setFilength((Long)map.get("len"));
			freDAO.write(fdto,"fInfo");
			}
	}

	public PageUtil getPageInfo(int nowPage, String searchWord, String searchType, String ftype) {
		PageUtil pInfo = new PageUtil(searchWord, searchType);
		pInfo.setFtype(ftype);
		int Cnt = freDAO.getPageInfo(pInfo);
		pInfo = new PageUtil(nowPage, Cnt);
		return pInfo;
	}
	public PageUtil getPageInfoMyPage(int nowPage, String searchWord, String searchType, String ftype, String fid) {
		PageUtil pInfo = new PageUtil(searchWord, searchType);
		pInfo.setFtype(ftype);
		pInfo.setFid(fid);
		int Cnt = freDAO.getPageInfoMyPage(pInfo);
		pInfo = new PageUtil(nowPage, Cnt);
		return pInfo;
	}

	public ArrayList<FreeBoardDTO> searchList(PageUtil pInfo, String searchWord, String searchType, String ftype) {
		pInfo.setSearchWord(searchWord);
		pInfo.setSearchType(searchType);
		pInfo.setFtype(ftype);
		return freDAO.searchList(pInfo);
	}
	
	public ArrayList<FreeBoardDTO> searchListMyPage(PageUtil pInfo, String searchWord, String searchType, String ftype, String fid) {
		pInfo.setSearchWord(searchWord);
		pInfo.setSearchType(searchType);
		pInfo.setFtype(ftype);
		pInfo.setFid(fid);
		return freDAO.searchListMyPage(pInfo);
	}		
	public FreeBoardDTO detail(int fno) {
		return freDAO.getDetail(fno);
	}

	public ArrayList<FreeBoardDTO> getFile(int fno) {
		return freDAO.getFile(fno);
	}

	public PageUtil getCommPageInfo(int fno, int commPage) {
		int Cnt = freDAO.getTotalCntOfComm(fno);
		PageUtil pInfo = new PageUtil(commPage, Cnt);
		pInfo.setFno(fno);
		return pInfo;
	}

	public ArrayList<FreeBoardDTO> getCommDetail(PageUtil pInfo) {
		return freDAO.getCommDetail(pInfo);
	}



	//댓글
		public void insertComm(FreeBoardDTO freDTO) {
			freDAO.insertComm(freDTO);
		}

		public void deleteComm(int fcno) {
			freDAO.deleteComm(fcno);
		}
		/*수정*/
		//글만 수정
		public void update(FreeBoardDTO fdto) {
			freDAO.update(fdto,"fboard");
		}
		//파일까지 수정
		public void update(FreeBoardDTO fdto, ArrayList list) {
			freDAO.update(fdto,"fboard");
			freDAO.deleteFile(fdto);
			for(int i=0; i<list.size() ;i++) {
				//하나의 첨부파일의 정보는 Map으로 저장되어 있다
				HashMap map = (HashMap)list.get(i);
				fdto.setFipath((String)map.get("path"));
				fdto.setFioriname((String)map.get("oriName"));
				fdto.setFiimg((String)map.get("saveName"));
				fdto.setFilength((Long)map.get("len"));
				freDAO.updateFile(fdto,"fInfo");
				}
		}

		public void delete(FreeBoardDTO freDTO) {
			freDAO.delete(freDTO);
		}


	}
