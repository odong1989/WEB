<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
public class Moneybook {
	private int	infonum;
	private String userid;
	private String memo;
	private String type;
	private int	amount;
	private String inputdate;
}

} -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css"/>" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script type="text/javascript">
	function add(){
		var	memo = document.getElementById("memo"); 
		var amount = document.getElementById("amount");
		var type = document.getElementById("type");
		var inputdate= document.getElementById("inputdate");
	
		if(inputdate.value == ""){
			alert("날짜를 입력하세요");
		return false; 	
		}

		if(memo.value == "" ){
			alert("메모를 입력하세요");
		return false; 	
		}
		
		if(amount.value == "" ){
			alert("금액를 입력하세요");
		return false; 	

		}
		if(isNaN(amount.value)){
			alert("숫자요");
		}
	}


	function del(){
		alert("del()");

	}

	function dateSelect(){
		var inputdate= document.getElementById("inputdate");
		if(inputdate.value == ""){
			false;
		}
		else{
			alert("inputdate :"+inputdate.value);
		}


	}
</script>
</head>
<body>
<div id="wrap">
	<div>
		<div class="menu">
			<form>
				<table>
					<tr>
						<td class="center">
							<select>
								<option id="type" name="type" value="수입" selected="selected" >수입</option>
								<option id="type" name="type" value="지출" >지출</option>
							</select>
							<input id="inputdate" name="inputdate" type="date"  clickend="dateSelect()">
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
							<input type="button" value="등록" onclick=" add()">
						</td>
						<td>
							<input type="button" value="삭제" onclick="del()"> 
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
