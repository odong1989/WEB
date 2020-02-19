package com.springlegacy.ex2;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="JstlCore", method=RequestMethod.GET)
	public String JstlCore(Model model) {
		int number = 1;
		String str = "abc";
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("aaa");
		list.add("bbb");
		list.add("ccc");
		
		String phone = "010-1111-2222";
		String data = "<marquee>문자열</marquee>";
		
		model.addAttribute("number", number);
		model.addAttribute("str", str);
		model.addAttribute("list", list);
		model.addAttribute("phone", phone);
		model.addAttribute("data", data);
		
		return "jstlCore";
	}
	
	@RequestMapping(value="Session1", method=RequestMethod.GET)
	public String Session1(HttpSession session ,Model model) {
		//아이디와 비밀번호에 대한 검사
		//아이디가 존재하는지 존재하는 아이디와 입력받은 비밀번호가 같은지.
		//SessionScope
		session.setAttribute("id", "admin");
		//RequestScope
		model.addAttribute("pw", "password");
		return "Session1";
	}
	
	@RequestMapping(value="SessionCheck", method=RequestMethod.GET)
	public String SessionCheck(HttpSession session) {
		//SessionCheck페이지는 로그인한 사람만 접속할 수 있다.
		//Session에 Id의 값이 있는지 확인
		String id = (String)session.getAttribute("id");
		if(id == null) {
			//로그인 안했다.
			//로그인 페이지로 이동시키면서 메세지를 출력
		}else {
			//로그인을 했다.
			//정상적으로 페이지 이동
		}
		
		return "SessionCheck";
	}
	
	@RequestMapping(value="SessionDelete",method=RequestMethod.GET)
	public String SessionDelete(HttpSession session) {
		session.removeAttribute("id");
		
		return "Session1";
	}
	
	@RequestMapping(value="resources", method=RequestMethod.GET)
	public String resources() {
		return "resources";
	}
	
	@RequestMapping(value="forward",method=RequestMethod.GET)
	public String forward(Model model) {
		String str = "abcd";
		System.out.println(str);
		model.addAttribute("str", str);
		
		return "redirect:ret";
	}
	
	@RequestMapping(value="ret", method=RequestMethod.GET)
	public String redirect() {
		
		return "forwardCheck";
	}
	
	
	
	
	
	
	
	
	
	
	
}
