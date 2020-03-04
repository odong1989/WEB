package com.boseong.swdo3th.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("session:"+ session.toString() );
		
		String userid = (String)session.getAttribute("userid"); 
		System.out.println("userid:"+userid);
		//if(userid == null) {//왜 형변환하는데 널값이 되버리나
		if(session == null) {
		//	response.sendRedirect(request.getContextPath() + "/member/memberLoginForm");//기존 바로 로그인화면이동
			response.sendRedirect(request.getContextPath() + "/member/memberLoginAlertPopup");//팝업알림 후 로그인이동하도록
			return false;
		}
		
		return true;
	}
}
