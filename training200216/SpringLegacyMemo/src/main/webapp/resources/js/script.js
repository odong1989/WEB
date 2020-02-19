/**
 * 
 */

function memoList(){
	//메모 확인 페이지 보여주는 요청
	location.href = "/selectMemoList";
}

function insertMemoForm(){
	//메모 등록폼 페이지 보여주는 요청
	location.href = "/insertMemoForm";
}

function formCheck(){
	//유효성 검사
	var memo_content = document.getElementById("memo_content").value;
	var memo_pw = document.getElementById("memo_pw").value;
	
	if(memo_content.length == 0){
		alert("내용을 입력해 주세요");
		return false;
	}
	
	if(memo_pw.length == 0){
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	
	return true;
}











