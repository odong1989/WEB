<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function useId(checkId){
	opener.document.getElementById("member_id").value=checkId; 
	//오픈한 창 memberJoinForm.jsp을의미합니다. 
	this.close();
}
</script>

</head>
<body>
<h1>[ID중복체크(팝업창)]</h1>
<form action="memberIdCheck" method="post">
	ID : <input type="text" name="checkId" id="checkId"> <br/>
	<input type="submit" value="ID중복체크" onclick="">
</form>

<!-- 컨틀로러의 checkflag를 통해 출력할거냐 말거냐를 설정할 수 있씁니다. -->

<c:if test="${checkFlag}">
	<c:choose>
		<c:when test="${member == null}">
			"${checkId}는 사용할 수 있습니다."
		<input type="submit" value="전송하기" onclick="useId('${checkId}')">
		</c:when>
		<c:otherwise>
			"${checkId}는 사용할 수 없습니다. 다른계정을 넣어주세요"		
		</c:otherwise>
	</c:choose>
</c:if>	

</body>
</html>