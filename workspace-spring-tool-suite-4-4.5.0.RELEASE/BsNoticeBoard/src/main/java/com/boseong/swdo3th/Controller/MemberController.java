package com.boseong.swdo3th.Controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boseong.swdo3th.DAO.MemberDAO;
import com.boseong.swdo3th.VO.Member;

//@선언
@Controller
@RequestMapping(value="member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//0.dao선언
	
	@Autowired
	MemberDAO dao;
	
	//1.회원가입================================================================================
	//1.1[이동] 회원가입폼으로 이동.
	@RequestMapping(value="memberJoinForm", method=RequestMethod.GET)
	public String memberJoinForm(HttpServletRequest request, Model model)
	{	
		return "/member/memberJoinForm";
	}
	
	//1.2[이동] ID중복체크 폼으로 이동
	@RequestMapping(value="memberidCheckForm", method=RequestMethod.GET)
	public String memberidCheckForm(Model model) {
		logger.info("아이디 중복 체크 폼 이동 ");
		//ID중복 팝업창에서 중복채크버튼 클릭하기 전에는
		//아직 DB조회가 안되어있으니 중복여부 결과를 출력않도록 하는 설정입니다. 
		boolean checkFlag = false;
		model.addAttribute("checkFlag", checkFlag);
		return "member/memberIdCheckForm";
	}
	
	//1.3[실행] 회원가입ID중복확인 실시
	@RequestMapping(value="/memberIdCheck", method=RequestMethod.GET)
	public String memberIdCheck(String checkId, Model model) {
		logger.info("checkId : {} ",checkId);

		Member member = dao.memberSelectOne(checkId);

		boolean checkFlag = true;
		logger.info("member : {} ",member);
		model.addAttribute("member", member);
		model.addAttribute("checkId", checkId); //member가 널값인 상태라 사용자가 입력한 계정을 출력할 수 있ㄸ록 값을 저장하는 변수.
		model.addAttribute("checkFlag", checkFlag);
		
		return "member/memberIdCheckForm";
	}	

	//1.4[실행] 회원가입실시
	//회원가입완료 후 메인 화면으로 리턴시킴
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(Member member) {
		logger.info("회원가입 자료 전달");
		logger.info("member : {}",member);
		dao.memeberJoin(member);
		
		return "redirect:/";//회원가입이 완료되면 맨처음 화면(홈)으로 리턴합니다.
	}
	
	//2.로그인===================================================================================
	
	//2.1로그인폼 페이지 이동 + 쿠키(rId)확인하여 자동로그인
	@RequestMapping(value="memberLoginForm", method=RequestMethod.GET)
	public String memberLoginForm(HttpServletRequest request, Model model)
	{
		Cookie[] cookies = request.getCookies();
	    String rememberId=null;
	    if(cookies != null)
	    {
			for(Cookie c : cookies)
			{//"rId"라는 이름의 쿠키가 있는지를 확인해야 합니다.
				String name = c.getName();
				if(name.equals("rId")) 
				{//로그인 성공시의 계정을 rememberId에게 저장시킵니다.
					rememberId=c.getValue();
				}
			}
		}
		model.addAttribute("rememberId", rememberId);
		return "member/memberLoginForm";
	}
	
	//2.2로그인 
	@RequestMapping(value="memberLoginExe", method=RequestMethod.POST)
	public String memberLoginExe(Member member, String remember,HttpSession session, HttpServletResponse response,Model model) {
		logger.info("로그인 프로세스 시작");
		String errMsg = "";//에러메시지 출력위한 변수.
		
		//[스텝1] 전달받은 ID,PW를 갖고 DB까지 가서 실제 정보와 일치하는가를 확인합니다.(#Select쿼리로 결과가 있으면 로그인처리 /결과가 null이면 로그인 불허)
		Member newMember = dao.memberSelectOne(member.getMember_id());
		//id를 통해 select조회하니까 아래의 조건문에서는 id가 null값인지만 체크하는거 외에는 id는 문제사항이 없습니다. 

		if(newMember != null) {
			logger.info("로그인 프로세스 DB의 저장계정값 newMember : {}",newMember);
			logger.info("로그인 프로세스  사용자의 로그인 정보member : {}",member);
			if(member.getMember_pw().equals(newMember.getMember_pw())) {
				//[스텝2] 동일하다고 판단하면 로그인 처리
				session.setAttribute("loginId", member.getMember_id());//세션에게 로근했다고 판단할 수 있는 정보를 입력해주는 것이 로그인 처리입니다.
				//세션의 로그인id가 있으면 로그인이 되었다/안되었다를 확인합니다.
				logger.info("로그인 프로세스 - 성공함. 세션 설정 session : {}",session.getAttribute("loginId"));
				
				if(remember !=null && remember.equals("1")){
					Cookie cookie = new Cookie("rId", member.getMember_id());
					//쿠키는 유지기간 설정을 해야 합니다.
					cookie.setMaxAge(60*60*24*365);//expiry 파라미터 : 초단위로 저장할 시간을 설정합니다.(int형으로 파라미터 입력받음)
					//60초*60분(1시간)*24시간(1일)*365일 = 1년동안 유지
					//이제 저장을 시켜야 합니다. response에게 저장할 값을 주어 사용자의 컴퓨터에게 저장하도록 합니다. 
					response.addCookie(cookie);
				}
			}
			else {//PW가 틀린경우 실시
				errMsg="비밀번호가 틀렸습니다";
				model.addAttribute("errMsg",errMsg);
				return "member/memberLoginForm";
			}
		}else {//ID가 틀린경우 실시.
			errMsg="ID가 틀렸습니다";
			model.addAttribute("errMsg",errMsg);
			return "member/memberLoginForm";
		}
		
		return "redirect:/";
	}
	
	/*
	//2.3 인터셉션(로그인X상태서 로그인창으로 자동이동)
	@RequestMapping(value="memberLoginAlertPopup", method=RequestMethod.GET)
	public String memberLoginAlertPopup(HttpSession session) {
		logger.info("로거 memberLoginAlertPopup");
		return "member/interceptPopup";
	}
	*/
	
	//3.로그아웃===========================================================================================================
	@RequestMapping(value="/memberLogout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session) {
	//세션에 로그읺 할 때 저장했던 값을 지우는 일.	
		logger.info("로그아웃 프로세스 시작");
		session.removeAttribute("loginId");
		logger.info("로그아웃 프로세스 - session의 loginId : {}",session.getAttribute("loginId"));
		return "redirect:/";
	}	
	
	
	//4.MyPage============================================================================================================
	@RequestMapping(value="memberMypage", method=RequestMethod.GET)
	public String memberMypage() {
		logger.info("move mypage");
		return "/member/memberMypage";
	}		
	
}