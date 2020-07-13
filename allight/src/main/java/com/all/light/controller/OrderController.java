package com.all.light.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.all.light.dto.MemberDTO;
import com.all.light.dto.OrderDTO;
import com.all.light.dto.OrderData;
import com.all.light.dto.OrderdetailDTO;
import com.all.light.dto.ShoppingDTO;
import com.all.light.service.OrderService;
import com.all.light.util.PageUtil;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService ordSVC;
	
	//주문목록조회-기간
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value = "term", required = false, defaultValue = "m1") String term,
			OrderDTO odto,OrderdetailDTO oddto,ShoppingDTO sdto,OrderData odata,HttpSession session, ModelAndView mv) {
		OrderData data=ordSVC.list(session,odata,odto,oddto,sdto,term);
		System.out.println("OrderController"+data);
		mv.addObject("ORDER", data);
		System.out.println("OrderController"+data);
		mv.setViewName("shopping/user/order/list");
		return mv;
	}
	
	//주문상세조회
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam(value = "term", required = false, defaultValue = "m1") int term,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("MID");
		//ordSVC.list();
		mv.setViewName("shopping/user/order/detail");
		return mv;
	}
	
	//주문취소및반품조회 
	@RequestMapping("/back") //type o,x
	public ModelAndView back(@RequestParam(value = "type", required = false) int type,
			HttpSession session, ModelAndView mv) {
		String id=(String) session.getAttribute("MID");
		//ordSVC.back(type);
		mv.setViewName("shopping/user/order/backlist");
		return mv;
	}
	
	//상태 변경
	@RequestMapping("/change")
	public ModelAndView change(@RequestParam(value = "no", required = true) int no,
			@RequestParam(value = "type", required = true) int type,
			HttpSession session, ModelAndView mv) {
		ordSVC.change(no,type,session);
		RedirectView rv =new RedirectView("./list.com");
		return mv;
	}
	
	//취소 반품 페이지이동
	@RequestMapping("/confirm")
	public String confirm(MemberDTO mdto) {
		//ordSVC.confirm(mdto);
		return "shopping/user/order/check";
	}
	
	//취소반품시 계좌확인
	@RequestMapping("/check")
	public ModelAndView check(@RequestParam(value = "no", required = true) int no,
			@RequestParam(value = "type", required = true) int type,MemberDTO mdto,
			HttpSession session, ModelAndView mv) {
		int mno=(Integer) session.getAttribute("MNO");
		ordSVC.check(mno,mdto);//
		RedirectView rv=new RedirectView("./change.com?no="+no+"&type="+type);
		mv.setView(rv);
		return mv;
	}
	
	//기업
	//재고관리 리스트
	@RequestMapping("/stocklist")
	public ModelAndView stocklist(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,HttpSession session, ModelAndView mv) {
		String cono=(String) session.getAttribute("CONO");
		PageUtil pinfo = ordSVC.pageMemberId(nowPage,cono);
		ArrayList<ShoppingDTO> list =ordSVC.stocklist(cono,pinfo);
		mv.addObject("PINFO",pinfo);
		mv.addObject("LIST",list);
		mv.setViewName("shopping/corp/order/stocklist");
		return mv;
	}
	
	//재고관리
	@RequestMapping("/stock")
	public ModelAndView stock(@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			ShoppingDTO sdto,HttpSession session, ModelAndView mv) {
		ordSVC.stock(sdto);
		RedirectView rv=new RedirectView("./stocklist.com?nowPgae="+nowPage);
		mv.setView(rv);
		return mv;
	}
	
	//아직미완성!!!!!!!!!!
	//주문관리 리스트 페이징, 기간(년월일)  - select * from orderdetail where ino in (select ino from item where cono=?)
	@RequestMapping("/list/corp")
	public ModelAndView listcorp(@RequestParam(value = "term", required = false) String term,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			HttpSession session, ModelAndView mv) {
		String cono=(String) session.getAttribute("CONO");
		PageUtil pinfo = ordSVC.pageOrderCono(nowPage,cono,term);
		//ordSVC.listcorp(session);
		//System.out.println("OrderController"+data);
		//mv.addObject("ORDER", data);
		return mv;
	}
	
	//주문관리 상세 - select * from orders where ono=(select ono from orderdatail where odno=?)
	
	
	//주문관리 현황 변경
	
	
	//취소 반품 리스트 페이징,기간(년월일) ,type o,x- select * from orderdetail where ino in (select ino from item where cono=?) and ostatus in ('취소','반품')

	
	
	
}
