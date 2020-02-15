package global.sesoc.sample.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 사용자 로그인 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {	
	//extends = 추상클래스(를 상속받다) ->상속을 하나밖에 못 받음 (#자바가 1개 밖에 상속못받는 이유)
	//implements=인터페이스(를 상속받다)->상속을 여러개를 받을 수 있어요(자바1.8버전부터서야 인터페이스도 완벽한 메서드를 갖게되었습니다)
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//콘트롤러의 메서드 실행 전에 처리
	@Override//(# @Override = 기능을 내 입맛대로 튜닝하는 것)
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("LoginInterceptor 실행");
		
		//세션의 로그인 정보 읽기
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		//로그인되지 않은 경우 로그인 페이지로 이동
		if (loginId == null) {
			//request.getContextPath()로 루트 경로를 구하여 절대 경로로 처리
//원본//		response.sendRedirect(request.getContextPath() + "/customer/login");
			response.sendRedirect(request.getContextPath() + "/member/memberLoginForm");//우리에게 사용에 맞게 하고자 변경.
			//http://localhost:8888/member
			return false;
		}
		//로그인 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
		//super = 자신에게 상속을 해준(extends HandlerInterceptorAdapter)를 뜻한다.
		
	}

}
