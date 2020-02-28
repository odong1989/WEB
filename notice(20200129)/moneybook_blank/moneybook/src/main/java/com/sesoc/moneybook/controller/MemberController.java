package com.sesoc.moneybook.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sesoc.moneybook.dao.MemberDAO;
import com.sesoc.moneybook.dao.MoneybookDAO;
import com.sesoc.moneybook.vo.Member;


@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired	
	MemberDAO dao = new MemberDAO();

	//1.회원 가입화면 이동 / main.jsp의 "회원가입에게 a태그 href 속성으로 할당.
	@RequestMapping(value="signupForm", method=RequestMethod.GET)
	public String signupForm() {
		return "signupForm";
	}
	
	//2.회원가입 메서드
	@RequestMapping(value="sign", method=RequestMethod.POST)
	public String sign(Member member) {
		int result = dao.insertMoneybookMember(member);
		if(result ==1 ) return "redirect:loginForm"; //회원가입완료시 로그인폼으로 이동.
		return "redirect:signupForm";//회원가입실패시 다시 ㅏ입페이지로 
	}
	

	
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		logger.info("로그아웃 프로세스 시작");
		session.removeAttribute("loginId");
		logger.info("로그아웃 프로세스 - session의 loginId : {}",session.getAttribute("loginId"));

		return "redirect:/";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Member member, HttpSession session) {

		logger.info("login - member:{}",member);
		logger.info("login - session:{}",session);
		Member newMember =  dao.selectOne(member.getUserid());
		logger.info("login - newMember:{}",newMember);
		if(newMember != null) {
			logger.info("1단계 아이디 Pass ");
			if(member.getUserpwd().equals(newMember.getUserpwd())) {
				logger.info("2단계 비번일치 Pass ");
				session.setAttribute("loginId", member.getUserid());
				logger.info("로그인 프로세스 - 성공함. 세션 설정 session : {}",session.getAttribute("loginId"));
			}
			else {
				//비밀번호가 다릅니다.
			}
			
			
		}
		else {
			//계정이 다릅니다.
		}
		return "redirect:/";
	}
	
}
