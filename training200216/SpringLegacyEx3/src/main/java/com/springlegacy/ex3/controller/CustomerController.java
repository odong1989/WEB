package com.springlegacy.ex3.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springlegacy.ex3.dao.CustomerDAO;
import com.springlegacy.ex3.vo.Customer;

@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private CustomerDAO dao;
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String insertCustomer(Customer customer) {
		logger.info("회원가입 컨트롤러 시작");
		
		int cnt = dao.insertCustomer(customer);
		
		if(cnt > 0) {
			logger.info("회원가입 성공, 쿼리 출력값 : {}", cnt);
		} else {
			logger.info("회원가입 실패, 쿼리 출력값 : {}", cnt);
			return "redirect:joinForm";
		}
		
		logger.info("회원가입 컨트롤러 종료");
		return "redirect:/";
	}
	
	/**
	 * 회원 목록 조회
	 * @param
	 * @Return - 회원 목록 리스트 페이지
	 * */
	@RequestMapping(value="customerList", method=RequestMethod.GET)
	public String customerList(Model model) {
		logger.info("회원 목록 조회 컨트롤러 시작");
		
		ArrayList<Customer> list = dao.selectCustomerAll();
		logger.info("회원 목록 데이터 {}",list);
		model.addAttribute("list", list);
		
		logger.info("회원 목록 조회 컨트롤러 종료");
		return "customerList";
	}
	
	@RequestMapping(value="deleteCustomer", method=RequestMethod.GET)
	public String deleteCustomer(String custid) {
		//삭제 기능
		//다 지울순 없다. pk에 해당하는 값만 지워야한다.
		int cnt = dao.deleteCustomer(custid);
		
		if(cnt > 0) {
			logger.info("삭제 성공");
		}else {
			logger.info("삭제 실패");
		}
		
		return "redirect:customerList";
	}
	
	@RequestMapping(value="deleteCustomer2", method=RequestMethod.POST)
	public String deleteCustomer2(String custid,String password) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("custid", custid);
		params.put("password", password);
		
		int cnt = dao.deleteCustomer2(params);
		
		if(cnt > 0) {
			logger.info("삭제 성공");
		} else {
			logger.info("삭제 실패");
		}
		
		return "redirect:customerList";
	}
	
	@RequestMapping(value="updateCustomerForm", method=RequestMethod.GET)
	public String updateCustomerForm(String custid, Model model) {
		Customer customer = dao.selectCustomerOne(custid);
		model.addAttribute("customer", customer);
		return "updateCustomerForm";
	}
	
	@RequestMapping(value="updateCustomer", method=RequestMethod.POST)
	public String updateCustomer(Customer customer) {
		logger.info("회원수정 컨트롤러 시작");
		
		int cnt = dao.updateCustomer(customer);
		
		if(cnt > 0) {
			logger.info("회원수정 성공, 쿼리 출력값 : {}", cnt);
		} else {
			logger.info("회원수정 실패, 쿼리 출력값 : {}", cnt);
		}
		
		logger.info("회원수정 컨트롤러 종료");
		
		return "redirect:customerList";
	}
	
	
	
}