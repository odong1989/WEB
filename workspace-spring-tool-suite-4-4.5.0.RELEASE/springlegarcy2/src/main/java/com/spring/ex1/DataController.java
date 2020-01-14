package com.spring.ex1;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.ex1.vo.TestData;

@Controller
public class DataController {
	 @RequestMapping(value="formData", method=RequestMethod.POST)//POST방식으로 보낸다 했으니까.
	 public String formData(String str,String password, String[] hobby) {
	//formData1.jsp로부터 전달받은 데이터가 3개이니 파라미터도 3개가 됩니다 
	// id인 str, password인 password, 체크박스값들을 받는 String형배열 hobby
		 System.out.println(str);	
		 System.out.println(password);			 
		 for(String s : hobby) {
		 System.out.println(s);			 
		 } 
		 return "formData1";//기존화면으로 리턴됩니다.
	 }
	
	 
	 //vo객체 관련 처리하는 문장을 만들어봅시다.
	 @RequestMapping(value = "formDataVo",method=RequestMethod.POST )
	 public String formDataVo(TestData td) {
		 //submit통해 온 데이터가 vo패키지로 생성 및 저장하도록 한다.
		 /*public String formDataVo(TestData td) {
		 	라고만 했는데 왜 생성됫는가??
		 	스프링이 기본생성자를 통하여 생성한 것이지.(#의존성개념주입)
		 	파라미터에 TestData td를 선언한 순간
		 	스프링은 TestData.java에서 설정한 기본생성자등을 따라서
		 	자동으로 생성해준다.
		 	그래서 프로그래머는 new등 생성자를 일일이 선언할 필요가 없다!
		 	(#번거로운 생성자는 스프링에게 맡기라구!)		 	
		 */

		 System.out.println(td);
		 return "formData1";
		 //스프링은 싱글톤패턴이라고 하는 디자인패턴을 활용합니다.
		 //그래서 프로그래머가 번거롭게 생성할 필요가 없는 것입니다.
		 //	 
	 
	 }
	 @RequestMapping(value = "formDataLB",method=RequestMethod.POST )
	 public String formDataLB(TestData td) {
		 System.out.println(td);
		 return "formData1";
	 }
	 
}
