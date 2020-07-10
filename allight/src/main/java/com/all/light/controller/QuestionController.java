package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.QuestionDTO;
import com.all.light.service.QuestionService;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService queSVC;
	
	//유저
	//글쓰기처리
	@RequestMapping(value="/write", method= RequestMethod.GET)
	public ModelAndView userWriteGet(HttpServletRequest request, ModelAndView mv) {
		System.out.println("USER/question/write, "+request.getMethod()+"method");
		mv.setViewName("diary/user/question/questionWrite");
		return mv;
	}
	@RequestMapping(value="/write", method= RequestMethod.POST)
	public ModelAndView userWritePost(QuestionDTO qdto, ModelAndView mv, HttpServletRequest request) {
		System.out.println("USER/question/write, "+request.getMethod()+"method");
		queSVC.userInsertWrite(qdto, request.getSession());
		mv.setViewName("diary/user/question/questionList");
		return mv;
	}
	//목록보기
	@RequestMapping("/list")
	public ModelAndView list(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			@RequestParam(value = "type", required = false, defaultValue = "nall") String searchType,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("USER/question/list");
		PageUtil pinfo = queSVC.getPageInfoBySearch(nowPage, searchWord, searchType);
		ArrayList<QuestionDTO> list = queSVC.searchList(pinfo, searchWord, searchType);
		mv.addObject("PINFO", pinfo); //페이징 정보
		mv.addObject("LIST", list); //문의사항 상세 정보
		mv.setViewName("diary/user/question/questionList");
		return mv;
	}
	
	//상세보기
	//글 상세보기
	@RequestMapping(value="/detail")
	public ModelAndView detail(
			@RequestParam("no") int qno,
			QuestionDTO qdto, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("\nNoticeController.noticeDetail");
		QuestionDTO de=queSVC.detail(qdto);//게시글
		ArrayList<QuestionDTO> decomm=queSVC.detailcomm(qdto);//댓글
		mv.addObject("DETAIL",de);//게시글
		mv.addObject("COMM",decomm);//댓글
		System.out.println(de);
		System.out.println(decomm);
		mv.setViewName("diary/user/question/questionDetail");
		return mv;
	}
	
	//수정
	@RequestMapping(value="/modify", method= RequestMethod.GET)
	public ModelAndView modifyGET(
			@RequestParam(value = "no", required = true) int qno,
			QuestionDTO qdto,ModelAndView mv, HttpServletRequest request) {
		System.out.println("USER/question/modify, "+request.getMethod()+"method");
		qdto.setQno(qno);
		QuestionDTO de=queSVC.detail(qdto);//게시글
		mv.addObject("DETAIL",de);//게시글
		System.out.println(de);
		mv.setViewName("diary/user/question/questionModify");
		return mv;
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public ModelAndView modifyPOST(
			@RequestParam(value = "no", required = true) int qno,
			QuestionDTO qdto,ModelAndView mv, HttpServletRequest request) {
		System.out.println("USER/question/modify, "+request.getMethod()+"method");
		queSVC.update(qdto);
		return mv;
	}
	
	//기업
	//목록보기
	@RequestMapping("/list/corp")
	public ModelAndView list(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("COID");
		System.out.println("QuestionController list"+id);
		PageUtil pinfo = queSVC.getPageInfoById(nowPage,id);
		pinfo.setSearchWord(id);
		ArrayList<QuestionDTO> list = queSVC.list(pinfo);
		mv.addObject("PINFO", pinfo); //페이징 정보
		mv.addObject("LIST", list); //문의사항 상세 정보
		System.out.println(list.toString());
		mv.setViewName("/shopping/corp/question/list");
		return mv;
	}
	
	//글쓰기폼
	@RequestMapping("/write/corp")
	public String write() {
		return "shopping/corp/question/write";
	}
	
	//글쓰기처리
	@RequestMapping("/writepro/corp")
	public ModelAndView writepro(QuestionDTO qdto,HttpSession session,ModelAndView mv) {
		System.out.println(qdto);
		queSVC.insertWrite(qdto,session);
		RedirectView rv=new RedirectView("../list/corp.com");//목록보기로
		mv.setView(rv);
		return mv;
	}
	
	//상세보기
	@RequestMapping("/detail/corp")
	public ModelAndView detail(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		qdto.setQno(qno);
		System.out.println(qdto);
		QuestionDTO de=queSVC.detail(qdto);//게시글
		ArrayList<QuestionDTO> decomm=queSVC.detailcomm(qdto);//댓글
		mv.addObject("DETAIL",de);//게시글
		mv.addObject("COMM",decomm);//댓글
		System.out.println(de);
		System.out.println(decomm);
		mv.setViewName("/shopping/corp/question/detail");
		return mv;
	}
	
	//수정폼
	@RequestMapping("/update/corp")
	public ModelAndView update(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		qdto.setQno(qno);
		QuestionDTO de=queSVC.detail(qdto);//게시글
		ArrayList<QuestionDTO> decomm=queSVC.detailcomm(qdto);//댓글
		mv.addObject("DETAIL",de);//게시글
		mv.addObject("COMM",decomm);//댓글
		System.out.println(de);
		System.out.println(decomm);
		mv.setViewName("/shopping/corp/question/update");
		return mv;
		
	}
	
	//수정
	@RequestMapping("/up/corp")
	public ModelAndView up(QuestionDTO qdto,HttpSession session,ModelAndView mv) {
		System.out.println(qdto);
		queSVC.update(qdto,session);
		System.out.println(qdto.getQno());
		RedirectView rv=new RedirectView("../detail/corp.com?no="+qdto.getQno());//상세보기로
		mv.setView(rv);
		return mv;
	}
	
	//삭제
	@RequestMapping("/delete/corp")
	public ModelAndView delete(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		System.out.println(qdto);
		qdto.setQno(qno);
		queSVC.delete(qdto);
		RedirectView rv=new RedirectView("../list/corp.com");//목록보기로
		mv.setView(rv);
		return mv;
	}
	
	//댓글쓰기
	@RequestMapping("/wcomment")
	@ResponseBody
	public String writeComm(QuestionDTO qdto,HttpSession session) {
		System.out.println("000"+qdto);
		queSVC.insertComm(qdto);
		return "ok";
	}
	
	//삭제
	@RequestMapping("/dcomment")
	@ResponseBody
	public String deleteComm(QuestionDTO qdto) {
		System.out.println("del"+qdto);
		queSVC.deleteComm(qdto);
		return "shopping/corp/question/check";
	}
	
	//관리자
	//목록 totalList
	@RequestMapping("/list/admin")
	public ModelAndView listAdmin(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			HttpSession session, ModelAndView mv) {	
		PageUtil pinfo = queSVC.getPageInfo(nowPage);
		ArrayList<QuestionDTO> list = queSVC.totalList(pinfo);
		mv.addObject("PINFO", pinfo); //페이징 정보
		mv.addObject("LIST", list); //문의사항 상세 정보
		System.out.println(list.toString());
		mv.setViewName("/shopping/admin/question/list");
		return mv;
	}
	
	//검색
	@RequestMapping("/search/admin")
	public ModelAndView search(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,ModelAndView mv,HttpServletRequest request) {	
		String type=request.getParameter("type");
		String word=request.getParameter("word");
		System.out.println(type+"////"+word+"////"+nowPage);
		if(type.equals("title")) {
			System.out.println("title");
			PageUtil pinfo = queSVC.getPageInfoByTitle(nowPage,word);
			pinfo.setSearchWord(word);
			ArrayList<QuestionDTO> list = queSVC.listByTitle(pinfo);
			mv.addObject("PINFO", pinfo); //페이징 정보
			mv.addObject("LIST", list); //문의사항 상세 정보
		}else if(type.equals("id")) {
			System.out.println("id");
			PageUtil pinfo = queSVC.searchPageInfoById(nowPage,word);
			pinfo.setSearchWord(word);
			ArrayList<QuestionDTO> list = queSVC.listById(pinfo);
			mv.addObject("PINFO", pinfo); //페이징 정보
			mv.addObject("LIST", list); //문의사항 상세 정보
		}
		mv.setViewName("/shopping/admin/question/list");
		return mv;
	}
	
	//상세보기
	@RequestMapping("/detail/admin")
	public ModelAndView detailAdmin(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		qdto.setQno(qno);
		System.out.println(qdto);
		QuestionDTO de=queSVC.detail(qdto);//게시글
		ArrayList<QuestionDTO> decomm=queSVC.detailcomm(qdto);//댓글
		mv.addObject("DETAIL",de);//게시글
		mv.addObject("COMM",decomm);//댓글
		System.out.println(de);
		System.out.println(decomm);
		mv.setViewName("/shopping/admin/question/detail");
		return mv;
	}
	
	//삭제
	@RequestMapping("/delete/admin")
	public ModelAndView deleteAdmin(@RequestParam(value = "no", required = true) int qno,QuestionDTO qdto,ModelAndView mv) {
		System.out.println(qdto);
		qdto.setQno(qno);
		queSVC.delete(qdto);
		RedirectView rv=new RedirectView("../list/admin.com");//목록보기로
		mv.setView(rv);
		return mv;
	}
}
