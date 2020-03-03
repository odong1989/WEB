package com.swdo.boseong.Controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.boseong.DAO.MemberDAO;
import com.swdo.boseong.vo.MiniblogMember;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="member")
public class MemberController {
	
	MemberDAO dao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//1. 회원가입 관련===================================================================
	//1.1. 회원가입폼으로 이동.
	@RequestMapping(value = "moveMemberJoinForm", method = RequestMethod.GET)
	public String joinMember() {
		logger.info("EXE joinMember");
		return "member/memberJoinForm";
	}
	
	//1.2.회원가입-ID중복확인폼으로 이동.
	@RequestMapping(value = "memberJoinIdCheckForm", method = RequestMethod.GET)
	public String memberJoinIdCheckForm(Model model) {
		logger.info("ID중복 체크폼 로드");
		boolean checkFlag=false;
		model.addAttribute("checkFlag", checkFlag);
		return "member/memberJoinIdCheckForm";		
	}	
		
	//1.3회원가입-ID체크(xml통해 조회 실시.	
	@RequestMapping(value = "IdCheck", method = RequestMethod.GET)
	public String IdCheck(String checkId,Model model) {
		logger.info("ID중복 확인 시작.");
		logger.info("checkId : ",checkId);
		
		MiniblogMember member = dao.selectOne(checkId);
		return "member/memberJoinIdCheckForm";		

	}	
	//1.4. 회원 추가 실시.(xml통한 SQL실시)
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public String memberJoin() {
		logger.info("EXE memberJoin");
		int joinResult=0;
		if(joinResult == 1){
			return "redirect:/";
		}
		else {
			return "member/memberJoinForm";		
		}
	}	
	
	//1.4 로그인 실시
	@RequestMapping(value = "LoginExe", method = RequestMethod.GET)
	public String LoginExe() {
		logger.info("EXE LoginExe");
		return "";		

	}		
	
}
