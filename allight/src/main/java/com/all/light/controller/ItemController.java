package com.all.light.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.ItemDTO;
import com.all.light.service.ItemService;
import com.all.light.util.FileUtil;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	ItemService itemSVC;
	
	// #관리자
	
	// #상품 목록보기
	@GetMapping("/list/admin")
	public ModelAndView listView(
		@RequestParam(value="nowPage", required=false, defaultValue="1")
		int nowPage, ModelAndView mv){

		System.out.println("컨트롤러 상품 목록보기 - listView() 요청");
		
		PageUtil pInfo = itemSVC.getPageInfo(nowPage);
		System.out.println("컨트롤러 상품 목록보기 - pInfo : " + pInfo);
		ArrayList<ItemDTO> list = itemSVC.getListView(pInfo);
		mv.addObject("LIST", list);		// 실제 조회 목록
		mv.addObject("PINFO", pInfo);	// 페이징 관련 정보
		mv.setViewName("/shopping/admin/item/list");
		System.out.println("컨트롤러 상품 목록보기 - list = " + list);
		System.out.println("컨트롤러 상품 목록보기 - pInfo = " + pInfo);
		System.out.println("컨트롤러 상품 목록보기 - mv = " + mv);
		return mv;
	}
	
	// #상품 상세보기
	@GetMapping("/detailview/admin")
	public ModelAndView detailView(HttpServletRequest request, ModelAndView mv) {
		System.out.println("컨트롤러 상품 상세보기 - detailview() 요청");
		int ino = Integer.parseInt(request.getParameter("no"));
		System.out.println("컨트롤러 상품 상세보기 - ino "+ino);
		ItemDTO iDTO = itemSVC.detailView(ino);
		ItemDTO iDTO2 = itemSVC.detailImg(ino);
		System.out.println("iDTO=" + iDTO);
		System.out.println("iDTO2=" + iDTO2);
		mv.addObject("IDTO", iDTO);
		mv.addObject("IDTO2", iDTO2);
		mv.setViewName("/shopping/admin/item/view");
		System.out.println("컨트롤러 상품 상세보기 - iDTO "+ iDTO);
		System.out.println("컨트롤러 상품 상세보기 - iDTO2 "+ iDTO2);
		System.out.println("컨트롤러 상품 상세보기 - mv "+ mv);	
		return mv;
	}
	
	// #상품 추가 폼
	@GetMapping("/insert/admin")
	public String itemInsertPage() {
		System.out.println("insert.com 폼 진입");
		return "/shopping/admin/item/insert";
	}
	
	// #상품 추가 처리
	@RequestMapping("/insert/admin")
	public ModelAndView itemInsert(ItemDTO iDTO, HttpSession session) {
		System.out.println("컨트롤러 상품 추가 처리 - itemInsert() 진입");
		System.out.println("iDTO = " + iDTO);
		
		String path="D:\\upload";
		ArrayList list = new ArrayList();
		System.out.println("컨트롤러 상품 추가 처리 - itemInsert() list="+list);
		
		
		for(int i=0; i< iDTO.getImgimages().length ;i++ ) { //파일이 여러 개이니 각각의 파일마다 반복
			System.out.println("컨트롤러 상품 추가 처리 - itemInsert() for문 진입");
			String oriName = iDTO.getImgimages()[i].getOriginalFilename();
			if(oriName==null || oriName.length()==0) {
				continue;
			}
			
			//처음 업로드 하는 사진이 대표사진
			int a;
			if(i==0) 
				a = 1;
			else
				a = 0;
				
			String saveName = FileUtil.renameTo(path, oriName);
			File file = new File(path, saveName);
			try {
				iDTO.getImgimages()[i].transferTo(file);
			}catch(Exception e) {
				System.out.println("파일복사관련에러=" + e);
			}
			HashMap map = new HashMap();
			map.put("path", path);
			map.put("oriName", oriName);
			map.put("saveName", "/item/img/"+saveName);
			map.put("len", file.length());
			map.put("select", a);
			list.add(map);	
		}
		itemSVC.insertItem(iDTO, session, list);
		System.out.println("컨트롤러 상품 추가 처리 - 진행확인4");
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../list/admin.com"); 
		mv.setView(rv);
		return mv;
	}
	
	// #상품 수정 폼
	@GetMapping("/update/admin")
	public String itemUpdatePage(HttpServletRequest request){
		System.out.println("수정폼요청함수 itemUpdatePage()진입");
		int ino  =  Integer.parseInt(request.getParameter("ino"));//글번호
		ItemDTO itemDTO = itemSVC.detailView(ino);
		request.setAttribute("IDTO", itemDTO);//상세내용
		return "/shopping/admin/item/update";
	}
	
	// #상품 수정 처리
		@RequestMapping("/update/admin")
		public ModelAndView itemUpdate(ItemDTO itemDTO,
				ModelAndView mv,
				RedirectView rv){
			System.out.println("상품 수정 요청함수 itemUpdate()진입");
			System.out.println("itemDTO="+itemDTO);
			
			boolean isUpload = false;  //첨부파일유무를 판단하기 위한 변수
			for(int i=0; i<itemDTO.getImgimages().length; i++) {
				String tempName = itemDTO.getImgimages()[i].getOriginalFilename();
				if( tempName!=null && tempName.length()!=0 ) {
					isUpload=true;
					break;
				}
			}
			
			String path="D:\\upload";
			//최대 5개까지의 첨부파일이 있으니 파일정보를 목록으로 묶는다
			ArrayList fileList= new ArrayList();
			if(isUpload==true) {
				
				for(int i=0; i< itemDTO.getImgimages().length ;i++ ) { //파일이 여러 개이니 각각의 파일마다 반복
					//한 개씩 파일의 실제이름을 알아낸다
					String oriName = 
					itemDTO.getImgimages()[i].getOriginalFilename();
					
					//파일이 업로드 되지 않으면 다음 작업을 시도한다
					if( oriName==null||oriName.length()==0 ) {
						continue;
					}
					
					//처음 업로드 하는 사진파일이 대표사진
					int a;
					if(i==0) 
						a = 1;
					else
						a = 0;
					
					String saveName = FileUtil.renameTo(path, oriName);
					File file= new File(path, saveName);
					
					//파일복사 : transferTo()
					try {
						itemDTO.getImgimages()[i].transferTo(file);
					}catch(Exception e) {
						System.out.println("파일복사관련에러="+e);
					}
					
					//업로드된 파일의 정보를 Map으로 묶는다
					HashMap map = new HashMap();
					map.put("path",    path);
					map.put("oriName", oriName);
					map.put("saveName", "/item/img/"+saveName);
					map.put("len", file.length());
					map.put("select", a);
					fileList.add(map);
				}
			}
			System.out.println("내용수정");
			itemSVC.modifyBoard(itemDTO);
			System.out.println("내용수정완료");
			if(isUpload==true) {
				System.out.println("첨부파일이 있을 경우");
				ItemDTO itemDTO1 = new ItemDTO();
						//과거에 업로드한 파일의 정보를 DB에서 가져오기
				ArrayList<ItemDTO> list = 
						 itemSVC.getFileInfo(itemDTO.getIno());
				System.out.println("itemDTO1 = "+itemDTO1);
				System.out.println("list = "+list);
				System.out.println("list = "+ itemDTO.getIno());
				
				if( list!=null && list.size()!=0 ) {
					for(int i=0; i<list.size() ;i++) {
						ItemDTO tempDTO = (ItemDTO)list.get(i);
						//해당 파일을 File객체로 만들어
						File tempFile = new File(path,tempDTO.getSaveName());
						//삭제
						tempFile.delete();
					}
				}
				//  DB에서 첨부파일정보 삭제
				System.out.println("DB첨부파일 정보 삭제 진행");
				itemSVC.deleteFileInfo(itemDTO.getIno());
				System.out.println("DB첨부파일 정보 삭제 완료");
				//  DB에    첨부파일정보 등록
				for(int i=0; i<fileList.size() ;i++) {
					HashMap tempMap = (HashMap)fileList.get(i);
					itemDTO1.setIno(itemDTO.getIno());
					itemDTO1.setPath((String)tempMap.get("path"));
					itemDTO1.setOriName((String)tempMap.get("oriName"));
					itemDTO1.setSaveName((String)tempMap.get("saveName"));
					itemDTO1.setLen((Long)tempMap.get("len"));
					itemDTO1.setSelect((Integer)tempMap.get("select"));
					
					itemSVC.insertFileInfo(itemDTO1);
				}
			}
			
			rv.setUrl("../list/admin.com");
			rv.addStaticAttribute("ino", itemDTO.getIno());
			mv.setView(rv);
			return mv;
		}
	
	// #상품 삭제
	@RequestMapping("/delete/admin")
	public ModelAndView deleteItem(
			@RequestParam(value="no") int no,
			ModelAndView mv,
			ItemDTO itemDTO
			){
		System.out.println("삭제요청함수 deleteItem()진입");
		System.out.println("삭제요청함수 deleteItem()진입 itemDTO = " +itemDTO);
		itemDTO.setIno(no);
		itemSVC.deleteItem(itemDTO);
		System.out.println("itemDTO="+itemDTO);
		RedirectView rv = 
		  new RedirectView("../list/admin.com");
		mv.setView(rv);
		return mv;
	}

	//------------------------------------------------------------
	// #기업
	
	// #상품 목록보기
	@GetMapping("/list/corp")
	public ModelAndView listViewCo(
		@RequestParam(value="nowPage", required=false, defaultValue="1")
		int nowPage, ModelAndView mv, HttpSession session){

		System.out.println("컨트롤러 상품 목록보기 - listView() 요청");
		System.out.println("컨트롤러 상품 목록보기 - listView() 요청 session=" + session);
		System.out.println(session.getAttribute("COID"));
		System.out.println(session.getAttribute("CONO"));
		//Object cono2 = session.getAttribute("CONO");
		//String cono = String.valueOf(cono2);
		//int cono = (Integer)session.getAttribute("CONO");
//		int cono = Integer.valueOf((String)session.getAttribute("CONO"));
		//int cono=Integer.parseInt(String.valueOf(session.getAttribute("CONO")));
		PageUtil pInfo = itemSVC.getPageInfo(nowPage);
		System.out.println("컨트롤러 상품 목록보기 - pInfo : " + pInfo);
		ArrayList<ItemDTO> list = itemSVC.getListView(pInfo, session);
		
		
		mv.addObject("LIST", list);		// 실제 조회 목록
		mv.addObject("PINFO", pInfo);	// 페이징 관련 정보
		mv.setViewName("/shopping/corp/item/list");
		System.out.println("컨트롤러 상품 목록보기 - list = " + list);
		System.out.println("컨트롤러 상품 목록보기 - pInfo = " + pInfo);
		System.out.println("컨트롤러 상품 목록보기 - mv = " + mv);
		return mv;
	}
	
	// #상품 상세보기
	@GetMapping("/detailview/corp")
	public ModelAndView detailViewCo(HttpServletRequest request, ModelAndView mv) {
		System.out.println("컨트롤러 상품 상세보기 - detailview() 요청");
		int ino = Integer.parseInt(request.getParameter("no"));
		System.out.println("컨트롤러 상품 상세보기 - ino "+ino);
		ItemDTO iDTO = itemSVC.detailView(ino);
		ItemDTO iDTO2 = itemSVC.detailImg(ino);
		System.out.println("iDTO=" + iDTO);
		System.out.println("iDTO2=" + iDTO2);
		mv.addObject("IDTO", iDTO);
		mv.addObject("IDTO2", iDTO2);
		mv.setViewName("/shopping/corp/item/view");
		System.out.println("컨트롤러 상품 상세보기 - iDTO "+ iDTO);
		System.out.println("컨트롤러 상품 상세보기 - iDTO2 "+ iDTO2);
		System.out.println("컨트롤러 상품 상세보기 - mv "+ mv);	
		return mv;
	}
	
	// #상품 추가 폼
	@GetMapping("/insert/corp")
	public String itemInsertPageCo() {
		System.out.println("insert.com 폼 진입");
		return "shopping/corp/item/insert";
	}
	
	// #상품 추가 처리
	@RequestMapping("/insert/corp")
	public ModelAndView itemInsertCo(ItemDTO iDTO, HttpSession session) {
		System.out.println("컨트롤러 상품 추가 처리 - itemInsert() 진입");
		System.out.println("iDTO = " + iDTO);
		
		String path="D:\\upload";
		ArrayList list = new ArrayList();
		System.out.println("컨트롤러 상품 추가 처리 - itemInsert() list="+list);
		
		
		for(int i=0; i< iDTO.getImgimages().length ;i++ ) { //파일이 여러 개이니 각각의 파일마다 반복
			System.out.println("컨트롤러 상품 추가 처리 - itemInsert() for문 진입");
			String oriName = iDTO.getImgimages()[i].getOriginalFilename();
			if(oriName==null || oriName.length()==0) {
				continue;
			}
			
			//처음 업로드 하는 사진이 대표사진
			int a;
			if(i==0) 
				a = 1;
			else
				a = 0;
				
			String saveName = FileUtil.renameTo(path, oriName);
			File file = new File(path, saveName);
			try {
				iDTO.getImgimages()[i].transferTo(file);
			}catch(Exception e) {
				System.out.println("파일복사관련에러=" + e);
			}
			HashMap map = new HashMap();
			map.put("path", path);
			map.put("oriName", oriName);
			map.put("saveName", "/item/img/"+saveName);
			map.put("len", file.length());
			map.put("select", a);
			list.add(map);	
		}
		itemSVC.insertItem(iDTO, session, list);
		System.out.println("컨트롤러 상품 추가 처리 - 진행확인4");
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../list/corp.com"); 
		mv.setView(rv);
		return mv;
	}
	
	// #상품 수정 폼
	@GetMapping("/update/corp")
	public String itemUpdatePageCo(HttpServletRequest request){
		System.out.println("수정폼요청함수 itemUpdatePage()진입");
		int ino  =  Integer.parseInt(request.getParameter("ino"));//글번호
		ItemDTO itemDTO = itemSVC.detailView(ino);
		request.setAttribute("IDTO", itemDTO);//상세내용
		return "/shopping/corp/item/update";
	}
	
	// #상품 수정 처리
		@RequestMapping("/update/corp")
		public ModelAndView itemUpdateCo(ItemDTO itemDTO,
				ModelAndView mv,
				RedirectView rv){
			System.out.println("상품 수정 요청함수 itemUpdate()진입");
			System.out.println("itemDTO="+itemDTO);
			
			boolean isUpload = false;  //첨부파일유무를 판단하기 위한 변수
			for(int i=0; i<itemDTO.getImgimages().length; i++) {
				String tempName = itemDTO.getImgimages()[i].getOriginalFilename();
				if( tempName!=null && tempName.length()!=0 ) {
					isUpload=true;
					break;
				}
			}
			
			String path="D:\\upload";
			//최대 5개까지의 첨부파일이 있으니 파일정보를 목록으로 묶는다
			ArrayList fileList= new ArrayList();
			if(isUpload==true) {
				
				for(int i=0; i< itemDTO.getImgimages().length ;i++ ) { //파일이 여러 개이니 각각의 파일마다 반복
					//한 개씩 파일의 실제이름을 알아낸다
					String oriName = 
					itemDTO.getImgimages()[i].getOriginalFilename();
					
					//파일이 업로드 되지 않으면 다음 작업을 시도한다
					if( oriName==null||oriName.length()==0 ) {
						continue;
					}
					
					//처음 업로드 하는 사진파일이 대표사진
					int a;
					if(i==0) 
						a = 1;
					else
						a = 0;
					
					String saveName = FileUtil.renameTo(path, oriName);
					File file= new File(path, saveName);
					
					//파일복사 : transferTo()
					try {
						itemDTO.getImgimages()[i].transferTo(file);
					}catch(Exception e) {
						System.out.println("파일복사관련에러="+e);
					}
					
					//업로드된 파일의 정보를 Map으로 묶는다
					HashMap map = new HashMap();
					map.put("path",    path);
					map.put("oriName", oriName);
					map.put("saveName", "/item/img/"+saveName);
					map.put("len", file.length());
					map.put("select", a);
					fileList.add(map);
				}
			}
			System.out.println("내용수정");
			itemSVC.modifyBoard(itemDTO);
			System.out.println("내용수정완료");
			if(isUpload==true) {
				System.out.println("첨부파일이 있을 경우");
				ItemDTO itemDTO1 = new ItemDTO();
						//과거에 업로드한 파일의 정보를 DB에서 가져오기
				ArrayList<ItemDTO> list = 
						 itemSVC.getFileInfo(itemDTO.getIno());
				System.out.println("itemDTO1 = "+itemDTO1);
				System.out.println("list = "+list);
				System.out.println("list = "+ itemDTO.getIno());
				
				if( list!=null && list.size()!=0 ) {
					for(int i=0; i<list.size() ;i++) {
						ItemDTO tempDTO = (ItemDTO)list.get(i);
						//해당 파일을 File객체로 만들어
						File tempFile = new File(path,tempDTO.getSaveName());
						//삭제
						tempFile.delete();
					}
				}
				//  DB에서 첨부파일정보 삭제
				System.out.println("DB첨부파일 정보 삭제 진행");
				itemSVC.deleteFileInfo(itemDTO.getIno());
				System.out.println("DB첨부파일 정보 삭제 완료");
				//  DB에    첨부파일정보 등록
				for(int i=0; i<fileList.size() ;i++) {
					HashMap tempMap = (HashMap)fileList.get(i);
					itemDTO1.setIno(itemDTO.getIno());
					itemDTO1.setPath((String)tempMap.get("path"));
					itemDTO1.setOriName((String)tempMap.get("oriName"));
					itemDTO1.setSaveName((String)tempMap.get("saveName"));
					itemDTO1.setLen((Long)tempMap.get("len"));
					itemDTO1.setSelect((Integer)tempMap.get("select"));
					
					itemSVC.insertFileInfo(itemDTO1);
				}
			}
			
			rv.setUrl("../list/corp.com");
			rv.addStaticAttribute("ino", itemDTO.getIno());
			mv.setView(rv);
			return mv;
		}
	
	// #상품 삭제
	@RequestMapping("/delete/corp")
	public ModelAndView deleteItemCo(
			@RequestParam(value="no") int no,
			ModelAndView mv,
			ItemDTO itemDTO
			){
		System.out.println("삭제요청함수 deleteItem()진입");
		System.out.println("삭제요청함수 deleteItem()진입 itemDTO = " +itemDTO);
		itemDTO.setIno(no);
		itemSVC.deleteItem(itemDTO);
		System.out.println("itemDTO="+itemDTO);
		RedirectView rv = 
		  new RedirectView("../list/corp.com");
		mv.setView(rv);
		return mv;
	}

}
			

