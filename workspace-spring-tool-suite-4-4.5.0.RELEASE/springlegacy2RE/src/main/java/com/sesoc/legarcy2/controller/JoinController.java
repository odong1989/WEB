package com.sesoc.legarcy2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.legarcy2.vo.Member;

@Controller
public class JoinController {
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member,Model model){
		System.out.println(member);
		
		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		//모델은 에코백처럼 어떤 값을 갖고 이동하는 페이지로 가져갈수 있따.
		//addAttribute 속성을 활용하면됩니다.
		//id라는 이름으로 멤버변수의 id를 갖고오겠다! 이런식이죠.
		
		//[중요] 모델의 사용법
		//[중요] ${}(${}) EL문법($표현식) 사용하기
		//      ${id}(${name}) //()는 없어도 됩니다 계정명(실제성명) 식으로 표현식
		
		return"index"; //return 통해 돌아갈 jsp파일을 설정할 수 있습니다.
		//index.jsp파일로 이동합니다.
		//model.addAttribute();메
	}
}
