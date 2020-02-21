<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 힌트 최초 추가 이후 추가커맨드 안되는 것
	방법1 : on(,,) on을 파라미터3개 받게하여 사용
	방법2 : onclick=""을 활용하기
 -->
<script>
//20.02.21 선생님의 풀이
		//방법2 별도의 함수 생성
		var str2  = "<tr>";
			str2 += "<td><input type='text'></td>" ;
			str2 += "<td><input type='text'></td>";
			str2 += "<td><input type='date'></td>";
			str2 += "<td><input class='add' type='button' onclick='addFunc(this)' value='+'>";
			str2 += "<input class='delete' type='button' onclick='delFunc(this)' value='-'>";
			str2 += "</td>";
			str2 += "</tr>";
				
		function addFunc(item){
			var temp = $(item).parent();
			temp.parent().after(str2);
			
		};

		function delFunc(item){
			$(item).parent().parent().remove();
		};

	$(function(){
		var str  = "<tr>"
			str += "<td><input type='text'></td>" 
			str += "<td><input type='text'></td>"
			str += "<td><input type='date'></td>"
			str += "<td><input class='add' type='button' value='+'>"
			str += "<input class='delete' type='button' value='-'>"
			str += "</td>"
			str += "</tr>"

		//NG사례-----------------------------------------------------------------------
		//최초의 버튼에게만 적용된다.(#이후 생성된 버튼들에게는 먹히지 않는 명령이다.)
		//이미 생성된 html태그 중에서는 최초의 라인만 타켓팅이 된 것이다.
		//$(".add").on("click",function(){
		//	$(this).parent().parent().after(str);
		//})
		//NG사례-----------------------------------------------------------------------

		//방법[1] .on(,,)를 활용하기 ======================================================================
		//table 태그내부에서 클릭이벤트 발생했다 -> 클래스값이 add인 녀석에게 함수를 실행한다.
		//테이블은 처음부터 생성되었고 세부조건으로 클래스명 add를 활용한 덕에 모두에게 먹히게 되었다.
		/*
		$("table").on("click",".add",function(){
			$(this).parent().parent().after(str);
		});
		
		$("table").on("click",".delete",function(){
			$(this).parent().parent().remove(); //
		});
		*/
		//방법[1] .on(,,)를 활용하기 ======================================================================

				
	});


	

</script>

</head>
<body>
<h2>[ 자격증 정보 관리 ]</h2>

<table border="1" id="certificateTable" >
	<tr>
		<th>자격증 명</th>
		<th>시행처</th>
		<th>취득 날짜</th>
		<th></th>
	</tr>
	<tr>
		<td><input type="text" /></td>
		<td><input type="text" /></td>
		<td><input type="date" /></td>
		<td>
			<!-- 방법1 <input class="add" type="button" value="+" /> -->
			<!-- 방법2 --><input class="add" type="button" onclick='addFunc(this)'  value="+" />
		</td>  
	</tr>
</table>
</body>
</html>