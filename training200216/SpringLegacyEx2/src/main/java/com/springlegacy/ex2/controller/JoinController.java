package com.springlegacy.ex2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springlegacy.ex2.vo.Member;

@Controller
public class JoinController {

	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(Member member, Model model) {
		System.out.println("회원가입 로직 실행");
		
		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
