package com.jquery.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("Welcome home!");
		return "home";
	}
	
	//sel : select의 줄임말입니다.
	@RequestMapping(value = "sel1", method = RequestMethod.GET)
	public String sel1() {
		return "sel1";
	}

	@RequestMapping(value = "sel2", method = RequestMethod.GET)
	public String sel2() {
		return "sel2";
	}

	@RequestMapping(value = "sel3", method = RequestMethod.GET)
	public String sel3() {
		return "sel3";
	}	
	
	@RequestMapping(value = "sel3Quiz", method = RequestMethod.GET)
	public String sel3Quiz() {
		return "sel3Quiz";
	}	

	
	@RequestMapping(value = "hw1", method = RequestMethod.GET)
	public String hw1() {
		return "hw1";
	}	
	
	
	@RequestMapping(value = "each", method = RequestMethod.GET)
	public String each() {
		return "each";
	}	

	@RequestMapping(value = "css", method = RequestMethod.GET)
	public String css() {
		return "css";
	}	
	
	@RequestMapping(value = "Class", method = RequestMethod.GET)
	public String Class() {
		return "Class";
	}	
	
	@RequestMapping(value = "hw2_myStyle", method = RequestMethod.GET)
	public String hw2_myStyle() {
		return "hw2_myStyle";
	}	

	@RequestMapping(value = "hw2", method = RequestMethod.GET)
	public String hw2() {
		return "hw2";
	}	

	@RequestMapping(value = "val", method = RequestMethod.GET)
	public String val() {
		return "val";
	}	

	@RequestMapping(value = "attr", method = RequestMethod.GET)
	public String attr() {
		return "attr";
	}	
	
	@RequestMapping(value = "hometext", method = RequestMethod.GET)
	public String hometext() {
		return "hometext";
	}	

	@RequestMapping(value = "node", method = RequestMethod.GET)
	public String node() {
		return "node";
	}	
	
	@RequestMapping(value = "hw3_template", method = RequestMethod.GET)
	public String hw3_template() {
		return "hw3_template";
	}		
	
	
}
