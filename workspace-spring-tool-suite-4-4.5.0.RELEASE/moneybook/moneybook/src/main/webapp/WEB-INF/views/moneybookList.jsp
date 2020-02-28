<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css"/>" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
	$(function() {


		$("#removeBtn").on("click", function(){
			var type = $("select").val();
			var inputdate = $("[type=date]").val();
			var infonum = $(":radio:checked").val();
			//유효성 체크-1 라디오 버튼이 체크되었는가?
			if(infonum ==undefined ) //undefined는 체크된 라디오 버튼이 없다는 의미.
			{
				alert("삭제할 항목을 선택해주세요");
				return; //return false;로 해도 똑같이 실행을 멈춤.
			}

			$.ajax({
				url : "remove",
				type : "get",
				data : {"infonum": infonum} ,//삭제를 위해 필요한 정보는 총 2개(계정, 일련번호)인데 계정은 세션통해 알수 있으니 일련번호만 보내주면 됩니다.
				success : printList,
				error : function() {alert("삭제 에러")}
			});
			
		})
		
		//수입/지출 선택 및 날짜 변환시에 대한 대응 이벤트
		$("[type=date]").on("change",printList);
		$("select").on("change",printList);

		
		//저장한내역 로드 - ajax통해 수신받고 데이터를 table차트에 출력 메소드
		function printList(){
			$.ajax({
				url : "list",
				type : "get",
				data : {"type"      : $("select").val(),		//수입? 지출 선텍 (지금은 1개뿐이기에 자동으로 잘 선택되는 것임)
				        "inputdate" : $("[type=date]").val() },  //날짜를 선택
				success : function(result){
					//선생님의 경우 테이블 태그 내부를 싹다 깨긋하게 정리(삭제)한 다음에 새롭게 데이터를 삽입하는 방식ㅇ,로  
					/*result는 뭔가? 언제 리턴되는 것인가?
					  [답] 컨트롤러의 public ArrayList<MoneybookVO> list(MoneybookVO vo, HttpSession session) {}메소드의
						return dao.list(vo);가 리턴된 것이다.
					*/
					var output = "";
					output += "<tr>";
					output += "<th>메모</th>";					
					output += "<th>금액</th>";
					output += "<th>삭제</th>";
					output += "<th></th>";
					output += "</tr>";
					
					$(result).each(function(index, item){
						output += "<tr>";
						output += "<td class='center'>"+item.memo+"</td>";					
						output += "<td class='center'>"+item.amount+"</td>";						
						output += "<td class='center'><input type='radio' name='remove' value='" + item.infonum + "'></td>";
									//value='"   "'으로 하여 중간에 끊어주고 안에 + item.infonum + 입력하여 연결 잘되게 합시다.
						output += "</tr>";

						$("#printTable").html(output);		
					}) //arrayList 형태인 상황이다. each문을 통하여 1개씩 뽑아냅시다
				},
				error   : function (){alert("에러!! ㅠㅠ")}
			})
		}



		//수입/지출 내용 저장-----------------------------------------
		$("#writeBtn").on("click", function() {
			var memo = $("#memo").val();
			var amount = $("#amount").val();
			var inputdate = $("[type=date]").val();

			if(inputdate == "") {
				alert("날짜를 입력하세요");
				return false;
			}

			if(memo == "") {
				alert("메모를 입력하세요");
				return false;
			}

			if(amount == "") {
				alert("금액을 입력하세요");
				return false;
			}

			if(isNaN(Number(amount))) {
				alert("숫자를 입력하세요");
				return false;
			}

			//ajax 통해서 서버에 저장할 데이터를 보냅니다.
			$.ajax({
				url : "write",
				type : "get",
				data : $("#inputForm").serialize(),
				//success : printList,				//이름만 적어도 됩니다.function printList(){ 라고 선언되었기 때문이죠. / [주의!!!]printList()가 아님!!!
				success : function() {alert("writeBtn 성공")},
				error : function() {alert("printList 실패")}
			});

		});
	})
</script>
</head>
<body>
<div id="wrap">
	<div>
		<div class="menu">
			<form id="inputForm">
				<table>
					<tr>
						<td class="center">
							<select name="type">
								<option value="수입" selected="selected">수입</option>
								<option value="지출">지출</option>
							</select>
							<input type="date" name="inputdate">
						</td>
					</tr>
					<tr>
						<th class="center">메모</th>
						<th class="center">금액</th>
					</tr>
					<tr>
						<td class="center">
							<input type="text" id="memo" name="memo" placeholder="내용 입력"><br>
						</td>
						<td class="center">
							<input type="text" id="amount" name="amount" placeholder="금액 입력"><br>
						</td>
						<td>
							<input type="button" id="writeBtn" value="등록">
						</td>
						<td>
							<input type="button" id="removeBtn" value="삭제">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div> <!-- input form end -->
	<hr>
	<div> <!-- print form -->
		<table id="printTable">
			<tr>
				<th>메모</th>
				<th>금액</th>
				<th></th>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>
