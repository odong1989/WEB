<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<title>회원 로그인 폼</title>
<script type="text/javascript">
$(document).ready(function(){
	var message = $('#message').val();
	if(message != "" || message.length != 0){
		alert(message);
	}
});
</script>
</head>
<body>

<section>
	<form action="login"  method="post">
	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" id="message" value="${SPRING_SECURITY_LAST_EXCEPTION.message}" /><br />
		
			<h2>로그인</h2>
				<input class="login_id" name="user_id" type="text" placeholder="아이디" />
				<input type="password"  name="user_pw" placeholder="비밀번호" />
			<input  class="login_btn" type="submit" value="로그인">
	
	</form>
</section>

</body>
</html>