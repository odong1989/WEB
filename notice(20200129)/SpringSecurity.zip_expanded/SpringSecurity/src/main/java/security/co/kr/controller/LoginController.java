package security.co.kr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
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
