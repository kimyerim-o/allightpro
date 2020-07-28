package com.all.light.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.AddressDTO;
import com.all.light.dto.MemberDTO;
import com.all.light.service.MemberService;
import com.all.light.util.PageUtil;

@Controller
public class MemberController {
	@Autowired
	private MemberService memSVC;

	//硫붿씤�솕硫댁뿉�꽌 �쉶�썝媛��엯�뤌 �씠�룞
	@RequestMapping("/joinFrm")
	public String join() {
		return "common/user/join";
	}
	
	//�쉶�썝媛��엯
	@RequestMapping("/join")
	public ModelAndView join(MemberDTO memdto,ModelAndView mv) {
		memSVC.join(memdto);
		RedirectView rv=new RedirectView("./joinSuccess.com");
		mv.setView(rv);
		return mv;
	}
	
	//�븘�씠�뵒 以묐났�솗�씤
	@ResponseBody
	@RequestMapping("/idChk")
	public String idChk(MemberDTO memdto) {
		String data=null;
		MemberDTO mem = memSVC.getMemberID(memdto);
		System.out.println(mem);
		if (mem != null) {
			data="fail";
		} else if(mem == null) {
			data="success";
		}
		return data;
	}
	
	//�땳�꽕�엫 以묐났�솗�씤
	@ResponseBody
	@RequestMapping("/nickChk")
	public String nickChk(MemberDTO memdto) {
		String data=null;
		MemberDTO mem = memSVC.getMemberNICK(memdto);
		System.out.println(mem);
		if (mem != null) {
			data="fail";
		} else if(mem == null) {
			data="success";
		}
		System.out.println(data);
		return data;
	}
	
	//�쉶�썝媛��엯�슜 �씠硫붿씪�씠 議댁옱�븯�뒗 �씠硫붿씪�씤吏� �솗�씤�븯怨� �씤利앹퐫�뱶 諛쒖넚
    @RequestMapping("/checkMail")
    @ResponseBody
	public String checkMail(HttpServletRequest request) throws Exception {
    	System.out.println("�씠硫붿씪 �솗�씤 �뱾�뼱�샂!");
    	String email=request.getParameter("email");
    	
		int isMail=memSVC.checkMail(email);
		System.out.println(isMail);
		
		if(isMail==0) {//媛숈� �씠硫붿씪�씠 �뾾�쑝硫� -> 肄붾뱶踰덊샇 �쟾�넚
			
			System.out.println("媛숈��씠硫붿씪 �뾾�뼱");
			String scode=memSVC.getCode();//肄붾뱶�깮�꽦
			System.out.println(scode);
			memSVC.sendMail(scode,email);//硫붿씪�쟾�넚
			
			String code=scode;
			System.out.println("�씠硫붿씪 �솗�씤 �셿猷�!");
			
			return code;
		}else {//媛숈� �씠硫붿씪�씠 �엳�쑝硫� -> 1 �쟾�넚
			System.out.println("媛숈��씠硫붿씪 �엳�뼱");
			return "1";
		}
    }
	    
	//�쉶�썝媛��엯�셿猷�
	@RequestMapping("/joinSuccess")
	public String joinSuccess() {
		return "common/user/joinSuccess";
	}
		
	//�븘�씠�뵒李얘린 �뤌
	@RequestMapping("/findIdFrm")	
	public String findIdFrm(){
		System.out.println("�슂泥� �븿�닔 findIdFrm()!"); 
		return "common/user/findId";
	}
		
	//�븘�씠�뵒李얘린
	@RequestMapping("/findId")
	public ModelAndView findId(MemberDTO memdto,ModelAndView mv) {
		MemberDTO mem = memSVC.findId(memdto);
		mv.addObject("MEM",mem);
		mv.setViewName("common/user/findIdResult");
		return mv;
	}
	
	//濡쒓렇�씤 �솕硫댁뿉�꽌 鍮꾨�踰덊샇李얘린 �뤌�쑝濡�
	@RequestMapping("/findPwFrm")	
	public String findPwFrm(){
		System.out.println("�슂泥� �븿�닔 findPwFrm!"); 
		return "common/user/findPw";
	}
	
	//鍮꾨�踰덊샇李얘린
	@RequestMapping("/findPw")
	public ModelAndView findPw(MemberDTO memdto,ModelAndView mv) {
		MemberDTO mem = memSVC.findId(memdto);
		mv.addObject("MEM",mem);
		mv.setViewName("common/user/findPwChange");
		return mv;
	}
	
	//鍮꾨�踰덊샇 李얘린�슜 �씠硫붿씪 �씤利� �썑 �씤利앹퐫�뱶 諛쒖넚
	@RequestMapping("/checkPwMail")
	@ResponseBody
	public String checkPwMail(HttpServletRequest request) throws Exception {
		System.out.println("鍮꾨�踰덊샇李얘린 �씠硫붿씪�씤利앸뱾�뼱�샂");
		String email=request.getParameter("email");
		
		int isMail=memSVC.checkMail(email);
		System.out.println(isMail);
		
		if(isMail==1) {//媛숈� �씠硫붿씪�씠 �엳�쑝硫� -> 肄붾뱶踰덊샇 �쟾�넚
			
			System.out.println("媛숈��씠硫붿씪 �엳�뼱");
			String scode=memSVC.getCode();//肄붾뱶�깮�꽦
			System.out.println(scode);
			memSVC.sendMail(scode,email);//硫붿씪�쟾�넚
			
			String code = scode;
			System.out.println("�씠硫붿씪 �솗�씤 �셿猷�!");
			
			return code;
		}else {//媛숈� �씠硫붿씪�씠 �뾾�쑝硫� ->
			System.out.println("媛숈��씠硫붿씪 �뾾�뼱");
			return "1";
		}
	}
	
	//鍮꾨�踰덊샇 李얘린 - 鍮꾨�踰덊샇 蹂�寃�
	@RequestMapping("/findPwChange")
	public ModelAndView findPwEmail(MemberDTO memdto,ModelAndView mv) {
		System.out.println("findPwChange");
		memSVC.findPwChange(memdto);
		RedirectView rv=new RedirectView("./findPwSuccess.com");
		mv.setView(rv);
		return mv;
	}
	
	//鍮꾨�踰덊샇李얘린 �셿猷�
	@RequestMapping("/findPwSuccess")
	public String findPwSuccess() {
		return "common/user/findPwSuccess";
	}
		
	//濡쒓렇�씤�뤌
	@RequestMapping("/login")
	public ModelAndView log(ModelAndView mv,
			@RequestParam(value="reUrl", required=false)String reUrl) {
		mv.addObject("reUrl", reUrl);
		mv.setViewName("common/loginform");
		return mv;
	}
	
	//濡쒓렇�븘�썐
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session,ModelAndView mv,RedirectView rv) {
		if(session.getAttribute("MID")==null) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		memSVC.logout(session);
		rv.setUrl("./main.com");
		mv.setView(rv);
		return mv;
	}
	
	//濡쒓렇�씤
	@RequestMapping("/log")
	public ModelAndView login(MemberDTO memdto,HttpSession session,ModelAndView mv,RedirectView rv,
			@RequestParam(value="reUrl", required=false)String reUrl) {
		
		HashMap result=memSVC.login(memdto,session);
		if(result==null || result.size()==0) {
			rv.setUrl("./login.com");
			mv.setView(rv);
			return mv;
		}
		
		System.out.println(reUrl);
		if(reUrl==null || reUrl.equals("")) {
			rv.setUrl("./main.com");
		}else {
			rv.setUrl(reUrl);
		}
		mv.setView(rv);
		return mv;
	}
	
	//移댁뭅�삤濡쒓렇�씤
	@RequestMapping(value = "/kakao", method = RequestMethod.POST)
	@ResponseBody
	public String kakao(@RequestParam Map<String, Object> param, HttpSession session, MemberDTO memdto) {
		System.out.println("kakak");
		System.out.println(param.get("id"));
		System.out.println("udto" + memdto.getMid());
		HashMap re = memSVC.kakao(param, memdto, session);
		System.out.println("kakao re" + re);
		System.out.println(re.get("mpw"));
		if (re.get("mnick") == null) {
			return "check";
		}
		return null;
	}
	
	
	// 移댁뭅�삤 濡쒓렇�븘�썐
	@RequestMapping(value="/kakaout", method=RequestMethod.POST)
	@ResponseBody
	public String kakaout(@RequestParam Map<String, Object> param, HttpSession session,MemberDTO memdto) {
		if(session.getAttribute("MID")==null) {
			return null;
		}
		memSVC.logout(session);
		return "out";
	}

	// 7.2�쑀�깭�슦 �옉�꽦, 7.3寃��깋 硫붿냼�뱶 異붽�
	//�쉶�썝 由ъ뒪�듃 諛� 寃��깋 硫붿냼�뱶
	@RequestMapping("/member/admin")
	public ModelAndView adminMember(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			ModelAndView mv, RedirectView rv) {

		System.out.println("\nmemberController.adminMember");

		//�럹�씠吏� 媛앹껜�뿉 寃��깋�뼱�� �쁽�옱 �럹�씠吏�瑜� �꽆湲곌퀬 �쉶�썝 由ъ뒪�듃瑜� 諛섑솚
		PageUtil pInfo = memSVC.getPageInfo(nowPage, searchWord);
		ArrayList<MemberDTO> map = memSVC.searchList(pInfo, searchWord);
		
		System.out.println("list = "+map.toString());
		System.out.println("pinfo = "+pInfo.toString());
		mv.addObject("LIST", map); //�쉶�썝 �젙蹂� 由ъ뒪�듃
		mv.addObject("PINFO", pInfo); //�럹�씠吏� �젙蹂�
		
		mv.setViewName("common/admin/member");
		return mv;
	}
	
	//7.3 愿�由ъ옄 �쉶�썝 �닔�젙 硫붿냼�뱶
	@RequestMapping(value="/member/modify/admin", method= RequestMethod.GET)
	public ModelAndView adminModifyMemberGet(
			// @RequestParam(value = "mno") int mno,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			MemberDTO memDTO,	ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("memberController.modify.Member,"+request.getMethod()+"method");
		//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
		memDTO = memSVC.getMInfo(memDTO.getMno());
		System.out.println("memInfo = "+memDTO.toString());
		//紐⑤뜽吏��젙
		mv.addObject("MEMINFO", memDTO); //�쉶�썝 �긽�꽭 �젙蹂�
		//酉곗��젙
		//get硫붿냼�뱶�쓽 Requestparam�쓽 �젙蹂닿� 洹몃�濡� �꽆�뼱媛�
		//mv.setViewName("common/admin/memberModify?search="+searchWord+"&nowPage="+nowPage+"&mno="+mno);
		mv.setViewName("common/admin/memberModify");
		return mv;
	}
	
	@RequestMapping(value="/member/modify/admin", method = RequestMethod.POST)
	public ModelAndView adminModifyMemberPost(
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String searchWord,
			MemberDTO memDTO, ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("memberController.modify.Member, "+request.getMethod()+"method");
		//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
		System.out.println("memInfo = "+memDTO.toString());
		memSVC.memModify(memDTO);
		//酉곗��젙
		rv.setUrl(request.getContextPath()+"/member/admin.com?search="+searchWord+"&nowPage="+nowPage);
		//由щ떎�씠�젆�듃�떆 Requestparam�쓽 �젙蹂대�� 酉� 寃쎈줈�뿉 �꽕�젙�빐�꽌 �꽆寃⑥쨾�빞�븿
		//rv.setUrl(request.getContextPath()+"/member/admin.com");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/member/delete/admin")
	public ModelAndView adminDeleteMember(
			@RequestParam(value = "mno") int mno,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			ModelAndView mv, RedirectView rv,HttpServletRequest request) {
		System.out.println("memberController.delete.Member");
		//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
		System.out.println("mno = "+mno);
		memSVC.memDelete(mno);
		//酉곗��젙
		rv.setUrl(request.getContextPath()+"/member/admin.com?search="+searchWord+"&nowPage="+nowPage);
		mv.setView(rv);
		return mv;
	}
	
	
	// 瑜섏��쁺 �옉�꽦
	// �쉶�썝 諛곗넚吏� 由ъ뒪�듃, 異붽� �뤌
	@GetMapping("/member/user/address")
	public ModelAndView address(HttpSession session, ModelAndView mv) {
		System.out.println("而⑦듃濡ㅻ윭 �쉶�썝 諛곗넚吏� 紐⑸줉蹂닿린 - address() �슂泥�");
		System.out.println(session.getAttribute("MID"));
		
		ArrayList<AddressDTO> list = memSVC.address(session);
		mv.addObject("LIST", list);
		mv.setViewName("common/user/address");
		System.out.println("而⑦듃濡ㅻ윭 �쉶�썝 諛곗넚吏� 蹂닿린 - list = " + list);
		return mv;	
	}
	
	// �쉶�썝 諛곗넚吏� 異붽�
	@RequestMapping("/member/user/addressinsert")
	public ModelAndView addressinsert(AddressDTO aDTO, HttpSession session, ModelAndView mv) {
		System.out.println("而⑦듃濡ㅻ윭 諛곗넚吏� 異붽� - addressinsert() �슂泥�");
		ArrayList list = new ArrayList();
		memSVC.addressinsert(aDTO, session, list);
		System.out.println(aDTO);
		System.out.println(list);
		RedirectView rv = new RedirectView("../user/address.com");
		mv.setView(rv);	
		return mv;
	}
	
	// �쉶�썝 諛곗넚吏� �궘�젣
	@RequestMapping("/member/user/addressdelete")
	public ModelAndView addressdelete(
			@RequestParam(value="no") int no,
			AddressDTO aDTO, ModelAndView mv) {
		System.out.println("而⑦듃濡ㅻ윭 諛곗넚吏� �궘�젣 - addressdelete() �슂泥�");
		aDTO.setAno(no);
		memSVC.addressdelete(aDTO);
		RedirectView rv = new RedirectView("../user/address.com");
		mv.setView(rv);
		return mv;
	}
	
	// �옣�븳蹂� �옉�꽦
	// �쉶�썝�젙蹂댁닔�젙
	@RequestMapping(value="/mypage/member/modify", method= RequestMethod.GET)
	public ModelAndView ModifyMemberGet(
			// @RequestParam(value = "mno") int mno,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			MemberDTO memDTO,	ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("memberController.modify.Member,"+request.getMethod()+"method");
		//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
		memDTO = memSVC.getMInfo(memDTO.getMno());
		System.out.println("memInfo = "+memDTO);
		//紐⑤뜽吏��젙
		mv.addObject("MEMINFO", memDTO); //�쉶�썝 �긽�꽭 �젙蹂�
		//酉곗��젙
		//get硫붿냼�뱶�쓽 Requestparam�쓽 �젙蹂닿� 洹몃�濡� �꽆�뼱媛�
		//mv.setViewName("common/user/Modify member/Modifymember?search="+searchWord+"&nowPage="+nowPage+"&mno="+mno);
		mv.setViewName("common/user/Modify member/Modifymember");
		return mv;
	}
	
	//회원탈퇴
	@RequestMapping(value="/mypage/member/delete", method= RequestMethod.GET)
	public ModelAndView deleteMemberGet(
			// @RequestParam(value = "mno") int mno,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false) String searchWord,
			MemberDTO memDTO,	ModelAndView mv, RedirectView rv, HttpServletRequest request) {
		System.out.println("memberController.delete.Member,"+request.getMethod()+"method");
		//�뙆�씪誘명꽣 諛쏄린, 鍮꾩쫰�땲�뒪濡쒖쭅
		memDTO = memSVC.getMInfo(memDTO.getMno());
		System.out.println("memInfo = "+memDTO);
		//紐⑤뜽吏��젙
		mv.addObject("MEMINFO", memDTO); //�쉶�썝 �긽�꽭 �젙蹂�
		//酉곗��젙
		//get硫붿냼�뱶�쓽 Requestparam�쓽 �젙蹂닿� 洹몃�濡� �꽆�뼱媛�
		//mv.setViewName("common/user/Modify member/Modifymember?search="+searchWord+"&nowPage="+nowPage+"&mno="+mno);
		mv.setViewName("common/user/Modify member/deletemember");
		return mv;
	}
}