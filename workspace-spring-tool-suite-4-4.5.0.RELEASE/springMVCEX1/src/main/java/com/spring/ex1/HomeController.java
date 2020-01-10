package com.spring.ex1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller //@ : 어너테이션이라고 읽습니다. '기술'이라는 의미를 갖습니다. 즉 기능을 호출하는 의미이미죠.//spring에서 미리 작성된 Controller 명령을 호출하여 써먹는거라고 할수 있습니다.(#진짜 컨트롤러가 되려면 @Controller가 붙어야지!)
public class HomeController {//파일명 뒤에다가 Controller를 붙였다는 것은 제어의 역할이 있다는 의미로 작명들이 되어있다.
//@Controller의 기능 : 클라이언트에게 요청을 받고, 응답(결과)를 리턴해주는 역할.
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	//@RequestMapping : 클라이언트가 요청을 하면 요청을 처리해주는 코드를 찾아서 자바코드를 연결해주는 역할.
	//"/"와 동일한 것을 찾아서 GET 방식이냐, POST 방식이냐를 구별한 다음 리턴을 준비합니다.
	//GET방식으로  "/"로 요청를 뜻합니다.
	
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//DATE가 갖고 있는 날짜를 내가 원하는 형식으로 바꾸는 것이라고 한다. 그정도만 알면 된다.
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//모델이라는 곳에다가 데이터를 넣는다.
		
		return "home"; //리턴 유형이 String형임을 알수 잇다.
		//"home"는 응답페이지를 뜻합니다.
		//index.html 대신에 home.jsp가 메인페이지로 보여지게 됩니다
	}
	
	//명령어 앞자를 조금만 치고 Crtl+Space 하면 자동완성기능이 실시됩니다.
	@RequestMapping(value="index", method = RequestMethod.GET) //A태그를 이용해서 보내는 방식은 GET밖에 안됩니다!
	public String index() {
		return "index";//index.jsp가 사용자에게 리턴됩니다 사용자는 index.jsp페이지를 보게됩니다ㅏ
	}
}
