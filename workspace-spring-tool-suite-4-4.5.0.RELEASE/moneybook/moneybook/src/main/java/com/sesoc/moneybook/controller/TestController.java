package com.sesoc.moneybook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.moneybook.vo.MemberVO;

@Controller
public class TestController {
//	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value = "testAjax", method = RequestMethod.GET)
	public String testAjax() {
		return "testAjax";
	}	

	@RequestMapping(value = "noajax1", method = RequestMethod.GET)
	public String noajax1(Model model) {
		model.addAttribute("id1", "아이디1");
		model.addAttribute("id1", "이름1");
		return "test";
	}
	
	@RequestMapping(value = "noajax2", method = RequestMethod.GET)
	public String noajax2(Model model) {
		model.addAttribute("id2", "아이디2");
		model.addAttribute("id2", "이름2");
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
	
}
