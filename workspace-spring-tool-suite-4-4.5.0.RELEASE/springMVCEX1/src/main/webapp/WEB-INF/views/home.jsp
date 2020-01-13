<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>


<!--  <a href="index.jsp">index.jsp로 이동</a> 
	처럼 바로 직접 다이렉트로 연결가는 ㅂ것은 불가능합니다.
	스프링에서 컨트롤러를 통해서만 갈수 있도록 막아둔 것이죠.
-->
	<a href="index">index.jsp로 이동</a> 
	<!-- HomeController.java에서 아래와 같은 내용을 같이 작성해줍니다.
		@RequestMapping(value="index", method = RequestMethod.GET) //A태그를 이용해서 보내는 방식은 GET밖에 안됩니다!
		public String index() {
		return "index";//index.jsp가 사용자에게 리턴됩니다 사용자는 index.jsp페이지를 보게됩니다ㅏ
	}
	 -->
	 
	 <!-- 20.01.13 추가분 -->
	 <!-- 
			 동일해야 할것
			 1)home.jsp
			 	 <a href="formData1">formData이동 1</a>
			 2)HomeControllerd.java
			 	 @RequestMapping(value="formData1", method=RequestMethod.GET)
				public String formData1() {
				return "formData1";//index.jsp가 사용자에게 리턴됩니다 사용자는 index.jsp페이지를 보게됩니다ㅏ
				}
				
				[1] 1),2)는 GET방식으로 보내지는 것으로 같아야 합니다.
				[2] formData1으로
			 3)
			 4)
	  -->

	 <a href="formData1">formData이동 1</a>
</body>
</html>
