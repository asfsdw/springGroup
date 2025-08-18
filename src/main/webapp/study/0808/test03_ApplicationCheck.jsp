<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>Application Check</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>어플리케이션 확인</h2>
		<p><br/></p>
		<p>아이디: ${aMid}</p>
		<p>닉네임: ${aNickName}</p>
		<p>성명: ${aName}</p>
		<hr/>
		<p><a href="test03_Application.jsp" class="btn btn-success">돌아가기</a></p>
	</div>
	<p><br/></p>
</body>
</html>