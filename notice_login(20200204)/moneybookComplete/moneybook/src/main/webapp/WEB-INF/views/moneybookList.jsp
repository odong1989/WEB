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

		$("[type=date]").on("change", printList);
		$("select").on("change", printList);

		function printList() {
			$.ajax({
				url : "list",
				type : "get",
				data : {"type" : $("select").val(), "inputdate" : $("[type=date]").val()},
				success : function(result) {
					var output = "";
					output += "<tr>";
					output += "<th>메모</th>";
					output += "<th>금액</th>";
					output += "<th>삭제</th>";
					output += "<th></th>";
					output += "</tr>";

					$(result).each(function(index, item) {
						output += "<tr>";
						output += "<td class='center'>" + item.memo + "</td>";
						output += "<td class='center'>" + item.amount + "</td>";
						output += "<td class='center'><input type='radio' name='remove' value='"+ item.infonum + "'></td>";
						output += "</tr>"
					});

					$("#printTable").html(output);
				}
			})
		}

		$("#removeBtn").on("click", function() {
			var infonum = $(":radio:checked").val();

			if(infonum == undefined) {
				alert("삭제할 항목을 선택해주세요");
				return;
			}

			$.ajax({
				url : "remove",
				type : "get",
				data : {"infonum" : infonum},
				success : printList,
				error : function() {alert("에러 발생")}
			});
		});

		
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

			$.ajax({
				url : "write",
				type : "get",
				data : $("#inputForm").serialize(),
				success : printList,
				error : function() { alert("실패")}
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
