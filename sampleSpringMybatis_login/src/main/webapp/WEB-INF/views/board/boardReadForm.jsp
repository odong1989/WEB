<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 첨부파일을 조건부처리 하기 위해 사용합니다. -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기(boardReadForm)</title>
<script type="text/javascript">
	function fileDownLoad(board_no){
		location.href = "download?board_no="+board_no;
			//board_no값도 전달하기 위해 ?를 활용 쿼리스트링
		//다운로드라는 요청을 보내는데,이때 board_no값을 보냅니다. (#컨트롤러가 수신함.)
	}

	function boardDelete(board_no){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "boardDelete?board_no="+board_no;	
			}
		 /*confirm()함수 : 컨펌받는다의 컨펌 맞음. 휴지통 완전삭제 전에 예/아니오 묻는 것과 같은 이치. 
		      컨펌함수는 true/false 값을 리턴한다. 이를 활용한 조건문이다.*/
	}

	function boardUpdateForm(board_no){
		location.href ="boardUpdateForm?board_no="+board_no;	
	}

	function replyDelete(reply_no,board_no){
		if(confirm("정말 삭제하시겠습니까?")){		
		location.href ="replyDelete?reply_no="+reply_no+"&board_no="+board_no;
		//2개 이상의 값을 보내려면 &를 활용하여 묶습니다	
		//reply_no : 특정 리플만 지우기 위해(구분을 위해) 리플의 PK를 넘겨주는 것이다.
		//board_no : 삭제 후 정상적으로 되었는지 사용자에게 보여주려면 해당 글의 번호를 알아야 한다
		}
	}
	function replyUpdateForm(reply_no, board_no, reply_content){
		console.log("reply_no :" + reply_no, 
					"board_no :" + board_no,
					"reply_content :" + reply_content); 

		//스텝1. 리플번호를 받습니다.
		var updateForm = document.getElementById("updateForm"+reply_no);

		//id는 복붙이 낫다. 어제 에러이유보니 updateForm이 아니라 UpdateForm이라서 대문자하나달라서 인식못했음...
		console.log(updateForm); 
		//온 클릭하면 실행할 폼내용을 넣습니다
		var str = ''; 
		    str += '<form action="replyUpdate" method="post">';								//console.log(str); 
			str += '<input type="hidden" name="reply_no" value="'+reply_no+'">';			//console.log(str);//20.2.13 추가/해당 리플만 삭제위해 필요
			str += '<input type="hidden" name="board_no" value="'+board_no+'">';			//console.log(str);//20.2.13추가/삭제후 본 페이지로 리턴위해 필요/
			str += '<input type="text" name="reply_content" value="'+reply_content+'">';	//console.log(str);
			str += '<input type="submit", value="수정">';										//console.log(str);
			str += '<input type="button", value="취소", onclick="updateCancel(\''+reply_no+'\')">';
			/*[Q]이스케이프 문자(\')로 감싸는 이유는 뭔가요?
			  [A]전달되는 값이 문자열인 경우 ''으로 감싸여야 제대로 전송 받을 수 있씁니다.
			  	 지금의 경우는 숫자값인 덕분에 에러가 없지만 문자열을 보낼 경우 이스케이프를 통하여 제대로 포장하여 보내지 않을 경우에는
			  	 값을 전송시 에러의 위험이 있습니다.

			  	<input type="button" , value="수정" onclick="replyUpdateForm('5','41','zasxcdewq')">
			  	
			*/
			
//[내가 생각한 수정 str += '<input type="button", value="취소", onclick="cancleUpdateForm(${updateForm})">';	console.log(str);
//			<input type="button", value="삭제	", onclick="replyDelete('${reply.reply_no}','${reply.board_no}')">
			str += '</form>';																//console.log(str);
			updateForm.innerHTML = str;
			//"reply_content"이면 걍 문자열이니 ''를 통해 구분, +를 통해 계속 붙여 쓸수 있도록 한다.			
			
			//해당 리플에 수정하기 위해서는 리플의 PK인 reply_no를 적어야 합니다.
			//수정이 끝나고 리다이렉트를 할 페이지도 정해야 하죠(#글번호 board_no를 전송해줘야 하는 이유 )

			//이제 컨트롤러에서 replyUpdate라는 메소드가 받아서 실시.
	}


	//선생님의 방식
	function updateCancel(reply_no){
		//핵심은 네가 선택한 영역을 취소해야 되죠.
		//그래서 리플번호를 넣어줍니다.		alert(reply_no); 를 통해여 제대로 해당 폼의 번호값이 오는지 확인합니다.
	var updateForm = document.getElementById("updateForm"+reply_no);
	if(confirm("리플 수정을 취소합니까?")){		
		updateForm.innerHTML = '';	//혹시 remove라는 함수를 알고 있다면 그걸 써도 도비니다. 여기서는 우리가 배운 방식이 위의 1개 뿐이니 그걸 활용한거임
		}

	}

	//내가 생각한 방식
	/*
	function cancleUpdateForm(updateForm){
		var updateForm = document.getElementById("updateForm"+reply_no);
		console.log("cancleUpdateForm 시작");
		console.log(updateForm);
		if(confirm("리플 수정을 취소합니까?")){		
			updateForm.innerHTML ='';
			}
	}
	*/
	
</script>
</head>

<body>
	글 제목 : ${board.BOARD_TITLE } <br/>
	글 내용 : ${board.BOARD_CONTENT } <br/>
	글쓴이  : ${board.MEMBER_NM }<br/>
	조회수  : ${board.BOARD_HITS }<br/>
	작성일  : ${board.BOARD_INDATE } <br/>
	
	 
	 <!-- 클릭하면 다운로드 되도록 합니다. -->
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>			
			
			
	<!--20.02.11
		 본인의 글이면 수정/삭제 버튼이 노출되도록 한다.
		[?]본인인지 아닌지 어떻게 압니까?
		[!]세션의 id와 글의 	member_id (primary key)가 동일하다면 본인의 글로 인정합니다.
		
		[?]세션의 id는 언제까지 보관됩니까?
		[!]브라우저가 종료되기 전까지 유지됩니다.
		   
		   
		글 읽기 폼으로 이동했을 경우   
		해당 글의  모든 정보를 DB를 통해서 가져오는데 
		글을 작성한 사람의 ID도 가져온다 
		selectBoardOne SQL을 통해서 가져온다.
		아래의 코드처럼 모조리 가져옴을 알 수 있씁니다.

	[?]세션의 정보는 어떻게 압니까?
	[!]${sessionScope.loginId } 라고 하면 세션스코프의가 저장한 계정값을 알 수 있씁니다.
	
		@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
		public String memberLogin(Member member, String remember,HttpSession session, HttpServletResponse response,Model model) {	
			//....이전부분들은 생략...//
				//[스텝2] 동일하다고 판단하면 로그인 처리
				session.setAttribute("loginId", member.getMember_id());//세션에게 로근했다고 판단할 수 있는 정보를 입력해주는 것이 로그인 처리입니다.
				//세션의 로그인id가 있으면 로그인이 되었다/안되었다를 확인합니다.
				logger.info("로그인 프로세스 - 성공함. 세션 설정 session : {}",session.getAttribute("loginId"));
			//...이후 부분들도 생략...//			
	 -->		

	<!-- 로그인 정보를 비교할 값
	${board.MEMBER_ID } 		 리퀘스트 스코프(사용자에게 받는 종류의 스코프/값이 그때 그때 달라요)		
	${sessionScope.loginId }	 세션스코프(값의 유지는 브라우저의 종료여부만이 관건이다.) 		
		이렇게 총 2개입니다.
	-->		
	
	<c:if test="${board.MEMBER_ID==sessionScope.loginId}">
		<input type="button" value="수정" onclick="boardUpdateForm('${board.BOARD_NO}')"> <br/>
		<input type="button" value="삭제" onclick="boardDelete('${board.BOARD_NO}')"> <br/>		
	</c:if>
	<!-- 선생님의 팁 : 추가->삭제->수정 순으로 만드는게 좋아요. 수정은 고려할 사항이 많거든요. -->
			
	<br/>		
			
			
	<form action="replyInsert" method="post" >
		<!-- onsubmit를 통해서 유효성 검사를 해주세요(시간관계상 스킵합니다) -->
		<input type="hidden" name="board_no" value="${board.BOARD_NO }">
		<input type="text" name="reply_content" placeholder="리플을 작성하세요.">
		<input type="submit" value="저장">
	</form>		
	
	<table>
			<tr>
				<td>리플번호</td>
				<td>작성자</td>
				<td>리플내용</td>
				<td>작성일</td>
			</tr>
		<c:forEach items="${replyList}" var="reply">
			<tr>
				<td>${reply.reply_no }</td>
				<td>${reply.member_id }</td>
				<td>${reply.reply_content }</td>
				<td>${reply.reply_indate }</td>
					<!-- 아래의 JSTL 조건문은 리플도 자신이 작성한 것만 삭제버튼이 가능토록 숨김설정 함. -->
				<td>
					<c:if test="${reply.member_id == sessionScope.loginId }">
					
						<input type="button", value="수정", onclick="replyUpdateForm('${reply.reply_no}','${reply.board_no}','${reply.reply_content}')">
					</c:if>
				</td>
				<td>
					<c:if test="${reply.member_id == sessionScope.loginId }">
						<input type="button", value="삭제", onclick="replyDelete('${reply.reply_no}','${reply.board_no}')">
															<!-- 삭제를 위해 파라미터로 2개(리플의 번호,해당 리플과 관련된글의 번호)를 넘긴다. -->
					</c:if>	
				</td>
			</tr>	
			<tr>
				<td id="updateForm${reply.reply_no}" colspan="6">
				<!-- 사이 사이에 (얼핏 보이지않는) 공간을 생성하였다. 크롬f12으로 UpdateForm1, UpdateForm2,... 식으로 나오는 것을 확인하자 
					자바스크립트로 innerhtml을 통해 내용을 삽입합니다.-->

				</td>
			</tr>	
		</c:forEach>
	</table>		
				<!--
				<td colspan="6"></td>
				하는 이유는? 리플 수정 폼이 생성될 공간을 만들기 위해서 크게 만들었다.
				  -->
				
</body>
</html>