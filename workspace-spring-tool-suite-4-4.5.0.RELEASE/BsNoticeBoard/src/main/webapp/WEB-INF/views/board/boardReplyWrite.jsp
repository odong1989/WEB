<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
	<form action="replyInsert" method="post" >
		<!-- onsubmit를 통해서 유효성 검사를 해주세요(시간관계상 스킵합니다) -->
		<input type="hidden" name="board_no" value="${board.BOARD_NO }">
		<input type="text" name="reply_content" placeholder="리플을 작성하세요.">
		<input type="submit" value="저장">
	</form>		
</body>
</html>