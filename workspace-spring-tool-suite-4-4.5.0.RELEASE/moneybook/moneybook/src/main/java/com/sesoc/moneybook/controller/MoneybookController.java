package com.sesoc.moneybook.controller;

import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sesoc.moneybook.dao.MoneybookDAO;
import com.sesoc.moneybook.vo.MoneybookVO;

@Controller
public class MoneybookController {
	
//	private static final Logger logger = LoggerFactory.getLogger(MoneybookController.class)

	@Autowired
	private MoneybookDAO dao;
	
	// 가계부 화면 이동
	@RequestMapping(value = "moneybookList", method = RequestMethod.GET)
	public String moneybookList() {
		return "moneybookList";
	}
	
	// 가계부 등록
	@RequestMapping(value = "write", method = RequestMethod.GET)
	@ResponseBody
	public void write(MoneybookVO vo, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		dao.write(vo);
	}


	// 가계부 정보 리턴(웺에서 출력)
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<MoneybookVO> list(MoneybookVO vo, HttpSession session) {
		//수입이냐? 지출이냐 , 날짜는 언제 인가? 를 갖는게 vo의역할
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		return dao.list(vo);
	}

	

	// 가계부 삭제
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	@ResponseBody
	public void remove(MoneybookVO vo, HttpSession session) {
		//수입이냐? 지출이냐 , 날짜는 언제 인가? 를 갖는게 vo의역할
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		dao.remove(vo);
	}
}




