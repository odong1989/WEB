<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function idCheck(){
 window.open("memberidCheckForm","newWin","left=300, top=300, width=500, height=300, resizeable=no");
	
function formCheck(){//id체크만 하는 함수.
	var member_id = document.getElementById("member_id");
	
	if(member_id.value == "" || member.id.value.length ){
		alert("ID 중복체크를 해야 회원가입이 가능합니다.");
	}
	
}

</script>
</head>


<body>
<h1>회원가입 제작</h1>
<form action="memberJoin" method="post" onsubmit="return formCheck();">
	ID : <input type="text" name="member_id" id="member_id" readonly="readonly">
		<!-- id중복체크 팝업창을 띄워서 id의 중복여부를 확인하고 ㅇㅋ해야 원하는 계쩡입력되도록할거야 
		결과를 띄울거고, 사용자가 임의로 변경못하게 하려고 readonly로 설정. -->
	<input type="button" value="중복체크" onclick="idCheck()"> <br/>
	<!-- 중복확인을 하고 ㅇㅋ해야 비로소 member_id에 등록된다. -->
	
	PW : <input type="text" name="member_pw" id="member_pw"> <br/>
	이름 :  <input type="text" name="member_nm" > <br/>
	주소 : <input type="text" name="member_addr"><br/>
	<input type="submit" value="회원가입"> <br/>
</form>
</body>
</html>