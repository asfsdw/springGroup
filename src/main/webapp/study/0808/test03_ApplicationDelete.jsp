<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>Application Delete</title>
	</head>
	<script>
		'use strict';
		
		function ApplicationDelete() {
			let ApplicationSW = document.getElementById("ApplicationSW").value;
			
			if(ApplicationSW == "") {
				alert("삭제할 항목을 선택해주세요.");
				return false;
			}
			
			location.href = "test03_ApplicationDeleteOk.jsp?ApplicationSW="+ApplicationSW;
		}
	</script>
<body>
	<p><br/></p>
	<div class="container">
		<h2>어플리케이션 삭제</h2>
		<p><br/></p>
		<select name="ApplicationSW" id="ApplicationSW" onchange="ApplicationDelete()">
			<option value="">선택</option>
			<option value="aMid">아이디</option>
			<option value="aNickName">닉네임</option>
			<option value="aName">성명</option>
		</select>
	</div>
	<p><br/></p>
</body>
</html>