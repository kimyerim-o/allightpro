package com.all.light.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

import com.all.light.dto.CorporationDTO;
import com.all.light.dto.MemberDTO;
import com.all.light.service.CorporationService;
import com.all.light.util.PageUtil;

@Controller
public class CorporationController {
	@Autowired
	private CorporationService corSVC;
	
	//濡쒓렇�씤
	@RequestMapping("/corlog")
	public ModelAndView corlog(@RequestParam(value = "cnt", required = false, defaultValue = "0") int cnt,
			CorporationDTO cordto,HttpSession session,HttpServletRequest req,ModelAndView mv,RedirectView rv) {
		System.out.println("CorporationController corlog");
		if(cnt<4) {
			HashMap result=corSVC.login(cordto,session,cnt);
			if(result==null || result.size()==0) {
				rv.setUrl("./login.com");
			}else {
				rv.setUrl("./main.com");
			}
		}else {
			//�옄�룞�엯�젰諛⑹�媛� �룞�씪�븳吏� �솗�씤�븯湲�
			System.out.println("auto");
			
			HashMap result=corSVC.login(cordto,session,cnt);
			if(result==null || result.size()==0) {
				rv.setUrl("./login.com");
			}else {
				rv.setUrl("./main.com");
			}
		}
		mv.setView(rv);
		return mv;
	}
	
	//濡쒓렇�븘�썐
	@RequestMapping("/corlogout")
	public ModelAndView logout(HttpSession session,ModelAndView mv,RedirectView rv) {
		if(session.getAttribute("COID")==null) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		corSVC.logout(session);
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
	
	// 7.7
	//湲곗뾽 由ъ뒪�듃 諛� 寃��깋 硫붿냼�뱶
	@RequestMapping("/corporation/admin")
	public ModelAndView adminCorporation(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			ModelAndView mv, RedirectView rv) {

		System.out.println("\nCorporationController.adminCorporation");

		PageUtil pInfo = corSVC.getPageInfo(nowPage, searchWord);
		ArrayList<CorporationDTO> map = corSVC.searchList(pInfo, searchWord);
		
		System.out.println("list = "+map.toString());
		System.out.println("pinfo = "+pInfo.toString());
		mv.addObject("LIST", map); //湲곗뾽 �긽�꽭 �젙蹂� 由ъ뒪�듃
		mv.addObject("PINFO", pInfo); //�럹�씠吏� �젙蹂�
		
		mv.setViewName("common/admin/corporation");
		return mv;
	}
	//湲곗뾽 �닔�젙 硫붿냼�뱶
		@RequestMapping(value="/corporation/modify/admin", method= RequestMethod.GET)
		public ModelAndView adminModifyCorporationGet(
				@RequestParam(value = "cono") int cono,
				@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
				@RequestParam(value = "search", required = false) String searchWord,
				CorporationDTO corDTO,	ModelAndView mv, RedirectView rv) {
			System.out.println("corporationController.modifyCorp, GET method");
			//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
			corDTO = corSVC.getCorpInfo(cono);
			System.out.println("corpInfo = "+corDTO.toString());
			//紐⑤뜽吏��젙
			mv.addObject("CORPINFO", corDTO); //湲곗뾽 �긽�꽭 �젙蹂�
			//酉곗��젙
			mv.setViewName("common/admin/corporationModify");
			return mv;
		}
		
		@RequestMapping(value="/corporation/modify/admin", method= RequestMethod.POST)
		public ModelAndView adminModifyCorporationPost(
				// PK(CONO)瑜� DTO�뿉�꽌 int濡� 諛쏆쓣 �떆 get諛⑹떇�쑝濡� �뙆�씪誘명꽣瑜� �꽆寃⑤컺�븘�룄 corDTO�븞�뿉�꽌 諛쏆쓣 �닔 �엳�쓬
				// String�쑝濡� 諛쏆쓣 �떆 �븞�맖
				@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
				@RequestParam(value = "search", required = false) String searchWord,
				CorporationDTO corDTO,	ModelAndView mv, RedirectView rv,HttpServletRequest request) {
			System.out.println("corporationController.modifyCorp, Post method");
			//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
			System.out.println("corpDTO = "+corDTO.toString());
			corSVC.corpModify(corDTO);
			//酉곗��젙
			rv.setUrl(request.getContextPath()+"/corporation/admin.com?search="+searchWord+"&nowPage="+nowPage);
			mv.setView(rv);
			return mv;
		}
		
		
		@RequestMapping("/corporation/delete/admin")
		public ModelAndView adminDeleteCorp(
				@RequestParam(value = "cono") int cono,
				@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
				@RequestParam(value = "search", required = false) String searchWord,
				ModelAndView mv, RedirectView rv,HttpServletRequest request) {
			System.out.println("CorpController.delete.Corp");
			//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
			System.out.println("cono = "+cono);
			corSVC.corpDelete(cono);
			//酉곗��젙
			rv.setUrl(request.getContextPath()+"/corporation/admin.com?search="+searchWord+"&nowPage="+nowPage);
			mv.setView(rv);
			return mv;
		}
		
		@RequestMapping(value="/corporation/join/admin", method=RequestMethod.GET)
		public ModelAndView adminJoinCorporationGet(
				ModelAndView mv, RedirectView rv,HttpServletRequest request) {
			System.out.println("CorpController.join.Corp "+request.getMethod()+"method");
			//酉곗��젙
			mv.setViewName("common/admin/corporationJoin");
			return mv;
		}
		
		@RequestMapping(value="/corporation/join/admin", method=RequestMethod.POST)
		public ModelAndView adminJoinCorporationPost(
				CorporationDTO corDTO, ModelAndView mv, RedirectView rv,HttpServletRequest request) {
			System.out.println("CorpController.join.Corp "+request.getMethod()+"method");
			System.out.println("�쟾�떖 �뙆�씪誘명꽣 = "+corDTO);
			//鍮꾩쫰�땲�뒪 濡쒖쭅
			corSVC.corpInsert(corDTO);
			//酉곗��젙
			rv.setUrl(request.getContextPath()+"/corporation/admin.com");
			mv.setView(rv);
			return mv;
		}
		
		@ResponseBody
		@RequestMapping("/corpIdChk")
		public String corpIdChk(CorporationDTO corDTO) {
			String data=null;
			corDTO = corSVC.getCorpID(corDTO);
			System.out.println(corDTO);
			if (corDTO != null) {
				data="fail";
			} else if(corDTO == null) {
				data="success";
			}
			return data;
		}
		
		// �옣�븳蹂� �옉�꽦
		// �쉶�썝�젙蹂댁닔�젙
		@RequestMapping(value="/corporation/modifycorporation", method= RequestMethod.GET)
		public ModelAndView ModifyMemberGet(
				// @RequestParam(value = "mno") int mno,
				@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
				@RequestParam(value = "search", required = false) String searchWord,
				MemberDTO memDTO,	ModelAndView mv, RedirectView rv, HttpServletRequest request) {
			System.out.println("CorporationController.modify.corp,"+request.getMethod()+"method");
			//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
			corDTO = corSVC.getMInfo(corDTO.getMno());
			System.out.println("corInfo = "+corDTO);
			//紐⑤뜽吏��젙
			mv.addObject("MEMINFO", memDTO); //�쉶�썝 �긽�꽭 �젙蹂�
			//酉곗��젙
			//get硫붿냼�뱶�쓽 Requestparam�쓽 �젙蹂닿� 洹몃�濡� �꽆�뼱媛�
			//mv.setViewName("common/corp/Modify corp/Modifycorporation?search="+searchWord+"&nowPage="+nowPage+"&mno="+mno);
			mv.setViewName("common/corp/Modify corp/Modifycorporation");
			return mv;
		}
}