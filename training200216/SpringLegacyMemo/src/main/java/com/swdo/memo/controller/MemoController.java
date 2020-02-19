package com.swdo.memo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.memo.dao.MemoDAO;
import com.swdo.memo.vo.Memo;

@Controller
public class MemoController {
	
	@Autowired
	private MemoDAO dao;
	
	@RequestMapping(value="/selectMemoList" , method=RequestMethod.GET)
	public String selectMemoList(Model model) {
		//메모 리스트 조회
		ArrayList<Memo> list = dao.selectMemoList();
		
		model.addAttribute("list", list);
		
		return "selectMemoList";
	}
	
	@RequestMapping(value="/insertMemoForm" , method=RequestMethod.GET)
	public String insertMemoForm() {
		return "insertMemoForm";
	}
	
	@RequestMapping(value="/insertMemo" , method=RequestMethod.POST)
	public String insertMemo(Memo memo) {
		//등록 기능
		int cnt = dao.insertMemo(memo);
		
		if(cnt > 0) {
			//등록 성공
		}else {
			//등록 실패
		}
		
		return "redirect:selectMemoList";
	}
	
	
	
	
	
	
	
	
}
