package com.sesoc.moneybook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.moneybook.dao.MemberDAO;
import com.sesoc.moneybook.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	// 회원가입 화면 이동
	@RequestMapping(value = "signupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "signupForm";
	}
	
	// 로그인 화면 이동
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	// 회원가입
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(MemberVO vo) {
		int result = dao.signup(vo);
		if(result == 1) return "redirect:loginForm";
		return "redirect:signupForm";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		if(dao.login(vo) != 1) return "redirect:loginForm";
		session.setAttribute("userid", vo.getUserid());
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userid");
		return "redirect:/";
	}
}




