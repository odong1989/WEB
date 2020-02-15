package security.co.kr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import security.co.kr.dao.SecurityDAO;
import security.co.kr.domain.SecurityUser;

@Controller
public class LoginController {
	
	@Autowired
	private SecurityDAO dao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping(value="user/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "user/joinForm";
	}
	
	@RequestMapping(value="user/join", method=RequestMethod.POST)
	public String join(SecurityUser user) {
		String encodePassword = encoder.encode(user.getUserPw());
		user.setUserPw(encodePassword);
		
		dao.insertUser(user);
		return "redirect:/";
	}
	
	@RequestMapping(value = "user/loginForm" , method = RequestMethod.GET)
	public String loginForm(){
		return "user/loginForm";
	}
	
	@RequestMapping(value = "user/user_login_success" , method = RequestMethod.GET)
	public String login_success(){
		return "redirect:/";
	}
	
	@RequestMapping(value = "user/userOnly" , method = RequestMethod.GET)
	public String userOnly(){
		return "user/userOnly";
	}
	
	@RequestMapping(value = "user/adminOnly" , method = RequestMethod.GET)
	public String adminOnly(){
		return "user/adminOnly";
	}

	@RequestMapping(value = "user/userAdmin" , method = RequestMethod.GET)
	public String userAdmin(){
		return "user/userAdmin";
	}
	
	@RequestMapping(value = "user/userAccessDenied" , method = RequestMethod.GET)
	public String userAccessDenied(){
		return "user/userAccessDenied";
	}
}
