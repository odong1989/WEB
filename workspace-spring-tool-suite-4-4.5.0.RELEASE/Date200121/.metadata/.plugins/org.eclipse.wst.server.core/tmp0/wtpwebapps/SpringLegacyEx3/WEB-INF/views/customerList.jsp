<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 목록 ]</title>
<script type="text/javascript">
/*
function deleteCustomer(pk){
	//컨트롤러의 삭제기능 요청주소로 연결
	//쿼리 스트링
	//요청을 보낼때 요청주소에 데이터를 연결하여 보내는 방식
	location.href = "deleteCustomer?custid="+pk;
}*/

function deleteCustomer(pk){
	//3번 JS에서 입력된 비번을 가져옵니다.
	/*컨트롤러의 
	*/
	alert("pk:"+pk);
	var pwCheck = document.getElementById('pwCheck'+pk);
	//pwCheck : 사용자가 입력한 비밀번호를 저장하는 변수.
	
	if(pwCheck.value.length == 0 ){
		alert("비밀번호를 입력해주세요!!");
		return false;
		}

	//히든폼 관련 처리-------------------------------------------------------------
	//보이지 않도록 보내기 위해 투명망토르 선어 및 로출!
	var hiddenForm =  document.getElementById("hiddenForm");
	var password = document.getElementById("password");
	// 히든폼에게 받은 비밀번호
	password.value = pwCheck.value;
	
	var custid = document.getElementById("custid");
	//id는 이미 function deleteCustomer(pk){에서 pk로 가져왔음!
	custid.value = pk;
	hiddenForm.submit();
}



</script>
</head>
<body>
	<!--히든폼2번( 20.01.22) -->
	<!-- [?] 히든폼은 HTML상에 안보이는데?
		 =>보이지 않는 공간에 숨겨졌다고 생각하면 됩니다.(#닥템같은 존재)
	 -->
	<form action="deleteCustomer2" method="post" id="hiddenForm">
	<!-- 삭제버튼 클릭시 비번입력창에 넣은 비번의 값을  -->
		<input type="hidden" id="password" name="password">
		<!-- 값은 갖되, 사용자에게 보여지면 안되니까 숨김 -->
		<input type="hidden" id="custid" name="custid">	
	</form>

	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>구분</th>
			<th>주소</th>
			<th>비밀번호</th>
			<th>버튼</th>
		</tr>
		<c:forEach items="${list }" var="cust">
			<tr>
				<td>
					<a href="updateCustomerForm?custid=${cust.custid }">${cust.custid }</a>
					<!--     |요청을 하러 가는 주소       | 데이터변수명 = 전송할 데이터     |   
						(1) 물음표(?)이후는 내가 전송하고자 하는 데이터 변수명과 전송값입니다.
						(2) 자바스크립트를 통해서도 가능해요. 방법들은 다양하지만 결론적으로 원리(primaryKey를 보낸다)는
						         같다는 것입니다.
						
						데이터가 들어가 있다 = 내가 수정하고자 하는 데이터를 DB로부터 셀렉트하여 가져온 것입니다.
						
						[주의]선생님의 답지 경우 PK인 유저ID만 보내버린 거지 본HTML페이지에 나오는 모든 값을 몽땅 싸서 보낸게 아니에요.
						main이유1)화면의 정보가 모두에게 보이기 떄문에 사용자가 임의로 수정할 수 있어요.
							 해커등이 임의로 변경하기 딱 좋다는 것이죠. 그래서 PK키만 가져와서 구별하여 갖고오는 것.
						main이유2)혹 데이터가 변경되었을 수도 있기 때문에 DB에 저장된 최신 정보를 갖고오고자 하는것
						sub이유)get방식으로 보내서(#이거는 Post방식으로 보내도 됩니다)
						
					-->
				</td>
				<td>${cust.name }</td>
				<td>${cust.email }</td>
				<td>
					<c:if test="${cust.division eq 'personal' }">
						개인
					</c:if>
					<c:if test="${cust.division == 'company' }">
						법인
					</c:if>
				</td>
				<td>${cust.address }</td>
				<td>
					 <!-- 히든 폼 (20.01.22 추가)-->
						<input type="password" id="pwCheck${cust.custid}">
						<!-- id에 ${cust.custid }를 붙이는 것인가요?
						=>그냥 단순히 id="pwCheck" 계정들의 개수만큼 pwCheck들이 있습니다.
						   그러면 컴이 엉뚱한 값 가져옵니다.(맨위의 계정을 수정하려 했더니 맨밑으로 오인하는 경우)
						-->

				</td>
				
				<td>
					<input type="button" value="삭제" onclick="deleteCustomer('${cust.custid}')">
					<!-- 20.01.22 이제는 POST방식으로 할겁니다(기존의 삭제는 GET방식으로 보냈지.)
						  이제는 pw가 일치하는지 따질거고 그를 위해 pw도 입력되어야 하는데
						  PW는 중요하니까 삭제하는 것이에요.
					 -->
					 
					 

				</td>
			</tr>
		</c:forEach>
	</table>
	







</body>
</html>