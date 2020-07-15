package com.all.light.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/* 인터셉터를 할때 실행할 클래스를 제잓한다
 * xml환경설정파일에 인터셉터 클래스를 틍록하면서 인터셉터가 발생되는 상황을 지정
 * 로그인체크를 통해 권한 체크
 * 
 * */
/*인터셉터클래스가 되기 위해서는
1.	HandlerInterceptorAdapter 상속받아야 한다
2.	 preHandle() 오버라이딩해야 한다*/

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//true 리턴하는 경우 - 컨트롤러가 실행되게 한다
		//false 리턴하는 경우 - 컨트롤러가 실행하지 않게 하겠다
		//로그인했으면 글입력(수정,삭제)컨트롤러가 실행호출 - 로그인한 유저정보 저장 UID,UNAME,NICK
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("UID");
		if(id==null||id.length()==0){//로그인X
			System.out.println("LoginCheck 로그인폼으로 이동요청");
			//강제로 또다른 요청을 실행하도록 조치를 취한다
			response.sendRedirect("../member/loginFrm.co");
			return false;
		}else {//로그인O
			return true;
		}
	}
	
}
