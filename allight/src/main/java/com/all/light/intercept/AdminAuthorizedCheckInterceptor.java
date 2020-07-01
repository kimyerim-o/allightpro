package com.all.light.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthorizedCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		System.out.println("관리자 권한 체크");

		// 사용자가 요청한 uri알아내기
		String uri = request.getServletPath();
		String module = uri.substring(0, uri.indexOf("/", 0));
		System.out.println("uri = " + uri + "\nmodule = " + module + "\n접속ID = " + session.getAttribute("MID"));

		// 인터셉트 통과 / 불통
		if (session.getAttribute("MID").equals("admin")) {
			return super.preHandle(request, response, handler);
		} else {
			//강제로 또다른 요청을 실행하도록 조치를 취한다
			response.sendRedirect("./fail.com");
			return false;
		}
	}
}
