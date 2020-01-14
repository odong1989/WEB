package com.sesoc.legarcy2.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JstlCore {

	@RequestMapping(value="jstlCore",method=RequestMethod.GET)
	public String jstlCore(Model model) {
		int number =1;
		String str = "abc";
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("aaa");
		list.add("bbb");
		list.add("ccc");
		
		String phone = "010-1111-2222";
		String data = "<marquee>문자열</marquee>";
		
		model.addAttribute("number", number);
		model.addAttribute("str", str);
		model.addAttribute("list", list);
		model.addAttribute("phone", phone);
		model.addAttribute("data", data);

		return "jstlCore";
		
	}
}