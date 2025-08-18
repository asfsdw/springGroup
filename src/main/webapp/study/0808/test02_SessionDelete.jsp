<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>Session Delete</title>
	</head>
	<script>
		'use strict';
		
		function sessionDelete() {
			let sessionSW = document.getElementById("sessionSW").value;
			
			if(sessionSW == "") {
				alert("삭제할 항목을 선택해주세요.");
				return false;
			}
			
			location.href = "test02_SessionDeleteOk.jsp?sessionSW="+sessionSW;
		}
	</script>
<body>
	<p><br/></p>
	<div class="container">
		<h2>세션 삭제</h2>
		<p><br/></p>
		<select name="sessionSW" id="sessionSW" onchange="sessionDelete()">
			<option value="">선택</option>
			<option value="sMid">아이디</option>
			<option value="sNickName">닉네임</option>
			<option value="sName">성명</option>
		</select>
	</div>
	<p><br/></p>
</body>
</html>