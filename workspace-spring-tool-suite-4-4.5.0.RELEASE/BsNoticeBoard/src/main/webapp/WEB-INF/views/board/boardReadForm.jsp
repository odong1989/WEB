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
		}
	}
	function replyUpdateForm(reply_no, board_no, reply_content){
		console.log("reply_no :" + reply_no, 
					"board_no :" + board_no,
					"reply_content :" + reply_content); 
		var updateForm = document.getElementById("updateForm"+reply_no);
		console.log(updateForm); 
		var str = ''; 
		    str += '<form action="replyUpdate" method="post">';								
			str += '<input type="hidden" name="reply_no" value="'+reply_no+'">';		
			str += '<input type="hidden" name="board_no" value="'+board_no+'">';			
			str += '<input type="text" name="reply_content" value="'+reply_content+'">';	
			str += '<input type="submit", value="수정">';									
			str += '<input type="button", value="취소", onclick="updateCancel(\''+reply_no+'\')">';

			str += '</form>';														
			updateForm.innerHTML = str;
	}


	//선생님의 방식
	function updateCancel(reply_no){
	var updateForm = document.getElementById("updateForm"+reply_no);
	if(confirm("리플 수정을 취소합니까?")){		
		updateForm.innerHTML = '';	
		}

	}

</script>
</head>

<body>
	글 제목 : ${board.BOARD_TITLE } <br/>
	글 내용 : ${board.BOARD_CONTENT } <br/>
	글쓴이  : ${board.MEMBER_NM }<br/>
	조회수  : ${board.BOARD_HITS }<br/>
	작성일  : ${board.BOARD_INDATE } <br/>
	
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>			
	
	<c:if test="${board.MEMBER_ID==sessionScope.loginId}">
		<input type="button" value="수정" onclick="boardUpdateForm('${board.BOARD_NO}')"> <br/>
		<input type="button" value="삭제" onclick="boardDelete('${board.BOARD_NO}')"> <br/>		
	</c:if>
			
	<br/>		
			
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
		
				</td>
			</tr>	
		</c:forEach>
	</table>		
				
</body>
</html>