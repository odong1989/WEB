package global.sesoc.sample.controller;

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

import global.sesoc.sample.dao.MemberDAO;
import global.sesoc.sample.vo.Member;

/**
 * 사용자 입력을 받아 처리
 */
@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value="/memberJoinForm", method=RequestMethod.GET)
	public String memberJoinForm() {
		logger.info("회원 가입폼 이동");
		return "member/memberJoinForm";
	}	
	
	@RequestMapping(value="/memberidCheckForm", method=RequestMethod.GET)
	public String memberidCheckForm(Model model) {
		logger.info("아이디 중복 체크 폼 이동 ");
		
		//ID중복 팝업창에서 중복채크버튼 클릭하기 전에는
		//아직 DB조회가 안되어있으니 중복여부 결과를 출력않도록 하는 설정입니다. 
		boolean checkFlag = false;
		model.addAttribute("checkFlag", checkFlag);

		return "member/memberidCheckForm";
	}
	
	@RequestMapping(value="/memberIdCheck", method=RequestMethod.POST)
	public String memberIdCheck(String checkId, Model model) {
		Member member = dao.memberSelectOne(checkId);

		//ID가 중복되었는지 DB의 결과가 리턴되었습니다
		//이제 checkFlag를 참으로 변경하여
		//하단에 검사결과(ID 중복이다/ 아니다 결과)를 출력할 수 있게 합니다.
		boolean checkFlag = true;
		logger.info("member : {} ",member);
		model.addAttribute("member", member);
		model.addAttribute("checkId", checkId); //member가 널값인 상태라 사용자가 입력한 계정을 출력할 수 있ㄸ록 값을 저장하는 변수.
		model.addAttribute("checkFlag", checkFlag);

		
		return "member/memberidCheckForm";
	}	
	
	//회원가입완료 후 메인 화면으로 리턴시킴
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(Member member) {
		logger.info("회원가입 자료 전달");
		logger.info("member : {}",member);
		dao.memeberJoin(member);
		
		return "redirect:/";//회원가입이 완료되면 맨처음 화면(홈)으로 리턴합니다.
	}
	
	
	
	@RequestMapping(value="memberLoginForm", method=RequestMethod.GET)
	public String memberLoginForm(HttpServletRequest request, Model model) {
		logger.info("로그인 폼 이동");
		//쿠키에 대한 여부를 파악해야 합니다.이를 위해서는 리퀘스트가 필요합니다.
		Cookie[] cookies = request.getCookies();//쿠키정보가 한둘이 아니니까. 배열로 받습니다.
		String rememberId=null;
		
		if(cookies != null) {
			for(Cookie c : cookies){
				//"rId"라는 이름의 쿠키가 있는지를 확인해야 합니다.
				String name = c.getName();
				if(name.equals("rId")) {
					rememberId=c.getValue();//로그인 성공시의 계정을 rememberId에게 저장시킵니다.
				}
			}
		}
		model.addAttribute("rememberId", rememberId);
		
		return "member/memberLoginForm";
	}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(Member member, String remember,HttpSession session, HttpServletResponse response,Model model) {
		logger.info("로그인 프로세스 시작");
		/* Member member : 로그인 정보(ID,PW)
		 * 
		 * String remember : 계쏙 로그인 유지 체크박스의 값.
		 * httpHttpSession session : 
		 * HttpServletResponse response : 
		 */
		
		 /* 우리가 해야할 일[2020.02.06기준]
		 * [스텝0] SQL 통해 회원정보 가져오기
		 * [스텝1] 전달받은 ID,PW를 갖고 DB까지 가서 실제 정보와 일치하는가를 확인합니다.(#Select쿼리로 결과가 있으면 로그인처리 /결과가 null이면 로그인 불허)
		 * [스텝2] 동일하다고 판단하면 로그인 처리
		 * [스텝3] 체크박스가 체크되어 있다면 아이디를 기억
		 * */
		
	
		String errMsg = "";//에러메시지 출력위한 변수.
		
		//[스텝1] 전달받은 ID,PW를 갖고 DB까지 가서 실제 정보와 일치하는가를 확인합니다.(#Select쿼리로 결과가 있으면 로그인처리 /결과가 null이면 로그인 불허)
		Member newMember = dao.memberSelectOne(member.getMember_id());
		//id를 통해 select조회하니까 아래의 조건문에서는 id가 null값인지만 체크하는거 외에는 id는 문제사항이 없습니다. 
	
		
		
		
		if(newMember != null) {
			logger.info("로그인 프로세스 DB의 저장계정값 newMember : {}",newMember);
			logger.info("로그인 프로세스  사용자의 로그인 정보member : {}",member);
			if(member.getMember_pw().equals(newMember.getMember_pw())) {
				//가져온 DB의 id계정이 갖고 있는 pw값도 같다(한마디로 비번도 같다)
				//[결론]로그인 시키기(#스텝2 발동) + [스텝3] 체크박스가 체크되어 있다면 아이디를 기억여부 확인
				
				//[스텝2] 동일하다고 판단하면 로그인 처리
				session.setAttribute("loginId", member.getMember_id());//세션에게 로근했다고 판단할 수 있는 정보를 입력해주는 것이 로그인 처리입니다.
				//세션의 로그인id가 있으면 로그인이 되었다/안되었다를 확인합니다.
				logger.info("로그인 프로세스 - 성공함. 세션 설정 session : {}",session.getAttribute("loginId"));
				
				if(remember !=null && remember.equals("1")){
					/*아이디를 기억한다 = 세션이라는 스코프는 서버에 존재하는 스코프입니다.(#서버에 ID가 임시저장된 셈)
					   세션이라는 것은 도서관의 책상처럼 사용자가 달라질수 있기에 DB처럼 고정되어 저장되는 것이 아니다.
					   즉, 컴퓨터에 계정을 저장시키기 위한 스코프로 "쿠키(특정사이트를 이용시 어떤 데이터를 사용자의 컴퓨터에 저장하는 것)"를 택한 것입니다.
					   
					   쿠키의 데이터 보관시간을 100년급으로 길게하면 평생보관하듯이 사용자 PC에 저장시킬 수 있는 것입니다. 
					   
					   사용자에게 뭘 받아온다 = 리퀘스트request
					   		뭘 쥐야한다 = 리스폰스response
					*/
					
					Cookie cookie = new Cookie("rId", member.getMember_id());
											//쿠키의 키값, 저장할 값
					
					//쿠키는 유지기간 설정을 해야 합니다.
					cookie.setMaxAge(60*60*24*365);//expiry 파라미터 : 초단위로 저장할 시간을 설정합니다.(int형으로 파라미터 입력받음)
					//60초*60분(1시간)*24시간(1일)*365일 = 1년동안 유지
					
					//이제 저장을 시켜야 합니다. response에게 저장할 값을 주어 사용자의 컴퓨터에게 저장하도록 합니다. 
					response.addCookie(cookie);
				}
				
			}
			else {
				//PW가 틀린경우 실시
				errMsg="비밀번호가 틀렸습니다";
				model.addAttribute("errMsg",errMsg);
				return "member/memberLoginForm";//이렇게 하는걸 포워드 방식이라고 한다!!
			}
		}else {
			//ID가 틀린경우 실시.
			errMsg="ID가 틀렸습니다";
			model.addAttribute("errMsg",errMsg);
			return "member/memberLoginForm";//이렇게 하는걸 포워드 방식이라고 한다!!

		}
				

		// [스텝1] 끝!!
		
		return "redirect:/";
		//리다이렉트를 해야하는 이유 : 세션을 만들고, 쿠키를 만드는 동작을 하고 있습니다. DB로 치면 insert이니까 중복저장되지 않도록 하기위해 리다이렉트이죠. 
		//forward는 select의 경우에만 쓰길 권합니다.
	}
	
	
	@RequestMapping(value="/memberLogout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session) {
	//세션에 로그읺 할 때 저장했던 값을 지우는 일.	
		logger.info("로그아웃 프로세스 시작");
		session.removeAttribute("loginId"); //뭘 지울거냐?
		logger.info("로그아웃 프로세스 - session의 loginId : {}",session.getAttribute("loginId"));
		
		/*				//[스텝2] 동일하다고 판단하면 로그인 처리
				session.setAttribute("loginId", member.getMember_id());//세션에게 로근했다고 판단할 수 있는 정보를 입력해주는 것이 로그인 처리입니다.

		 * */
		
		//리턴으로 돌아가면 메인의 "게시판" "로그아웃"이 뜨지 않아야 하죠.
		return "redirect:/";
	}	
}
