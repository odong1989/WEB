<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	pre {
		font-size: 33px;
		font-weight: bold;
	}
	
	input[type='button'] {
		font-size: 20px;
	}
	
	#desc {
		background-color: yellow;
	}
	
	#here {
		background-color: aqua;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		printHtml();
	});
	
	function printHtml() {
		var ElementNode = $('#desc').html();
		$('pre').text(ElementNode);
	}
	
	function appendFunc() {
		$('#here').append('<h1>append추가</h1>');
		printHtml();
	}
	
	function prependFunc() {
		$('#here').prepend('<h1>prepend추가</h1>');
		printHtml();
	}
	
	function afterFunc() {
		$('#here').after('<h1>after추가</h1>');
		printHtml();
	}
	
	function beforeFunc() {
		$('#here').before('<h1>before추가</h1>');
		printHtml();
	}
	
	function emptyFunc() {
		$('#here').empty();
		printHtml();
	}
	
	function removeFunc() {
		$('#here').remove();
		printHtml();
	}
	
</script>
</head>
<body>
	<pre></pre>
	<hr>
	<input type="button" value="$('#here').append('<h2>append추가</h2>')" onclick="appendFunc()"><br>
	<input type="button" value="$('#here').prepend('<h2>prepend추가</h2>')" onclick="prependFunc()"><br>
	<input type="button" value="$('#here').after('<h2>after추가</h2>')" onclick="afterFunc()"><br>
	<input type="button" value="$('#here').before('<h2>before추가</h2>')" onclick="beforeFunc()"><br>
	<br>
	<input type="button" value="$('#here').empty()" onclick="emptyFunc()"><br>
	<input type="button" value="$('#here').remove()" onclick="removeFunc()"><br>
	
	<div id="desc">
		<div id="here">
			<h1>a</h1>
		</div>
	</div>
</body>
</html>
