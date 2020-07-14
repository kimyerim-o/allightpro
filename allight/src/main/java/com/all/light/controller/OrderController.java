package com.all.light.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView detail(@RequestParam(value = "no", required = true) int ono,
			OrderDTO odto,OrderdetailDTO oddto,OrderData odata,ModelAndView mv,HttpSession session) {
		System.out.println("detail");
		OrderData data=ordSVC.detail(session,odata,odto,oddto,ono);
		mv.addObject("ORDER", data);
		mv.setViewName("shopping/user/order/detail");
		return mv;
	}
	
	//주문취소및반품조회 
	@RequestMapping("/back") //type o,x
	public ModelAndView back(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "term", required = false, defaultValue = "m1") String term,
			OrderDTO odto,OrderdetailDTO oddto,ShoppingDTO sdto,OrderData odata,HttpSession session, ModelAndView mv) {
		OrderData data=ordSVC.back(session,odata,odto,oddto,sdto,type,term);
		System.out.println(data);
		mv.addObject("ORDER", data);
		mv.setViewName("shopping/user/order/backlist");
		return mv;
	}
	
	//상태 변경
	@RequestMapping("/change")
	public ModelAndView change(@RequestParam(value = "no", required = true) int no,
			@RequestParam(value = "type", required = true) String type,
			HttpSession session, ModelAndView mv,RedirectView rv, HttpServletRequest request) {
		System.out.println("change "+no+" change "+type);
		ordSVC.change(no,type,session);
		rv.setUrl(request.getContextPath()+"/order/list.com");
		mv.setView(rv);
		return mv;
	}
	
	//취소 반품 페이지이동-주문관리 ajax 후
	@RequestMapping("/confirm")
	public String confirm(MemberDTO mdto) {
		//ordSVC.confirm(mdto);
		return "shopping/user/order/check";
	}
	
	//취소반품시 계좌확인-주문관리 ajax 후
	@RequestMapping("/check")
	public ModelAndView check(@RequestParam(value = "no", required = true) int no,
			@RequestParam(value = "type", required = true) String type,MemberDTO mdto,
			HttpSession session, ModelAndView mv) {
		int mno=(Integer) session.getAttribute("MNO");
		ordSVC.check(mno,mdto);//
		RedirectView rv=new RedirectView("./change.com?no="+no+"&type="+type);
		mv.setView(rv);
		return mv;
	}
	
	//기업

	/*<!-- 해당 아이디 게시물 수 조회 -->
	<select id="totalCntById" resultType="Integer">
	select count(*) from question where qid=#{id} and qtype=1
	</select>
	
	<!-- question리스트 출력 -->
	<select id="list" resultType="queDTO" parameterType="PageUtil">
	select * from (select row_number() over(order by question.qno ) as rno,question.* from question where qid='${searchWord}') where rno between ${startNo} and ${endNo} order by rno desc
	</select>*/
	//주문관리 리스트 페이징, 기간(년월일)  - select * from orderdetail where ino in (select ino from item where cono=?)
	@RequestMapping("/list/corp")
	public ModelAndView listcorp(@RequestParam(value = "start", required = false) String start,
			@RequestParam(value = "last", required = false) String last,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			OrderDTO odto,OrderdetailDTO oddto,ShoppingDTO sdto,OrderData odata,
			HttpSession session, ModelAndView mv) {
		int cono=Integer.parseInt(String.valueOf(session.getAttribute("CONO")));
		PageUtil pinfo = ordSVC.pageOrderCono(nowPage,cono,start,last);
		OrderData data=ordSVC.listCorp(session,odata,odto,oddto,pinfo);
		mv.addObject("PINFO", pinfo);
		mv.addObject("ORDER", data);
		System.out.println("OrderController"+data);
		mv.setViewName("shopping/corp/order/list");
		return mv;
	}
	
	//주문관리 상세 - select * from orders where ono=(select ono from orderdatail where odno=?)
	
	
	//주문관리 현황 변경
	
	
	//취소 반품 리스트 페이징,기간(년월일) ,type o,x- select * from orderdetail where ino in (select ino from item where cono=?) and ostatus in ('취소','반품')

	
	
	
}
