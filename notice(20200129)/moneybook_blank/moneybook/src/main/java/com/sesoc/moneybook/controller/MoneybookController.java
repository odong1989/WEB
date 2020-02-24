package com.sesoc.moneybook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.moneybook.dao.MemberDAO;
import com.sesoc.moneybook.dao.MoneybookDAO;

@Controller
public class MoneybookController {
	
	MoneybookDAO DAO = new MoneybookDAO();
	
	@RequestMapping(value="moneybookList", method=RequestMethod.GET)
	public String moneybookList() {
		return "moneybookList";
	}

	
}
