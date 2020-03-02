package com.sesoc.moneybook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Controller
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		HttpSession session = request.getSession();		
			
//		private static final Logger logger = LoggerFactory.getLogger(preHandle.class);	
		
		String userid = (String)session.getAttribute("userid");
		
		if(userid ==null) {
			response.sendRedirect(request.getContextPath() + "/loginForm"); //로그인 폼으로 돌려보내버린다.
			//request.getContextPath() : root 컨텍스트를 자동으로 뽑아줍니다.
			//                           즉, "http://localhost:8888"를 가져와 주는 역할을 합니다. 
			return false;
		}
		
		return true;
	}
}
