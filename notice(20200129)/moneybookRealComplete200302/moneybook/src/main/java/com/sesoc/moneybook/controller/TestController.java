package com.sesoc.moneybook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.moneybook.vo.MemberVO;

@Controller
public class TestController {
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String main() {
		return "test";
	}
	
	@RequestMapping(value = "noajax1", method = RequestMethod.GET)
	public String noajax1(Model model) {
		model.addAttribute("id1", "아이디1");
		model.addAttribute("name1", "이름1");
		return "test";
	}
	
	@RequestMapping(value = "noajax2", method = RequestMethod.GET)
	public String noajax2(Model model) {
		model.addAttribute("id2", "아이디2");
		model.addAttribute("name2", "이름2");
		return "test";
	}
	
	@RequestMapping(value = "ajax1", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO ajax1() {
		MemberVO vo = new MemberVO();
		vo.setUserid("id3");
		vo.setUserpwd("이름3");
		return vo;
	}
	
	@RequestMapping(value = "abcd", method = RequestMethod.GET)
	@ResponseBody
	public String abcd() {
		return "으아아아";
	}
}






