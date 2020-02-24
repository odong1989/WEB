package com.sesoc.ajaxtest;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	
	//20.02.21 ajax 1일차 - jsp페이지=>ㅁㅁcontroller.java에게로 자료보내기
	//(#사용자에게 받은 데이터를 서버에게 수신하기)
	
	//방법1 각 변수로 받기
	//step3 ajax test1 url이 실시할 메소드 작성
	//[중요!]@ResponseBody를 선언해주어야 화면전체 새로고침을 않도록 합니다.
	@RequestMapping(value = "test1", method = RequestMethod.GET)
	@ResponseBody
	public void test1(String userid, String username) {
		logger.info("userid : {}",userid);
		logger.info("username : {}",username);
	
	}
	
	//방법2 VO객체로 받기
	@RequestMapping(value = "test2", method = RequestMethod.GET)
	@ResponseBody
	public void test2(TestVO vo) {
		logger.info("test2- userid : {}",vo.getId());
		logger.info("test2- username : {}",vo.getName());
	}

	//방법3 json포맷으로 받기
	@RequestMapping(value = "test3", method = RequestMethod.POST)
	@ResponseBody
	public void test3(@RequestBody TestVO vo) {
	//서버에서 json형태로 받으려면 매개변수 앞에
	//@RequestBody라는 에노테이션을 붙여야 합니다.
		logger.info("test3- userid : {}", vo.getId());
		logger.info("test3- username : {}", vo.getName());
	}

	//방법4 form로 받기
	@RequestMapping(value = "test4", method = RequestMethod.POST)
	@ResponseBody
	public void test4(TestVO vo) {
		logger.info("test4- userid : {}",vo.getId());
		logger.info("test4- username : {}",vo.getName());
	}	
	
	
	//방법5 서버에서 웹페이지로 배열형태로 리턴(
	@RequestMapping(value = "test5", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<TestVO> test5() {
		ArrayList<TestVO> list = new ArrayList<TestVO>();
		list.add(new TestVO("aaa","111"));
		list.add(new TestVO("bbb","222"));
		list.add(new TestVO("ccc","333"));
		list.add(new TestVO("ddd","444"));
		list.add(new TestVO("eee","555"));

		return list;
	}	

	//방법5 서버에서 웹페이지로 배열형태로 리턴(
	@RequestMapping(value = "test6", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> test6() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<TestVO> list = new ArrayList<TestVO>();
		list.add(new TestVO("aaa","111"));
		list.add(new TestVO("bbb","222"));
		list.add(new TestVO("ccc","333"));
		list.add(new TestVO("ddd","444"));
		list.add(new TestVO("eee","555"));

		map.put("list", list);
		
		return map;
	}	

	//방법7 서버에서 웹페이지로 배열형태로 리턴(
	@RequestMapping(value = "test7", method = RequestMethod.POST)
	@ResponseBody
	public void test7(TestVO vo, MultipartFile uploadFile) {
		logger.info(vo.toString());
		FileService.saveFile(uploadFile, "C:/test/"); //"C:/test/" 경로에 첨부한 uploadfile을 올리겠다.
	}	
	
	@RequestMapping(value = "getListForm", method = RequestMethod.GET)
	public String getListForm() {
		return "list";
	}
}

