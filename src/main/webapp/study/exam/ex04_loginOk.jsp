<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>homePage</title>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>로그인 성공</h2>
		<p><br/></p>
		<div>
			<input type="button" id="logOutBtn" name="logOutBtn" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/study/exam/ex04_cookie.jsp'" class="btn btn-warning" />
		</div>
		<div id="demo"></div>
	</div>
	<p><br/></p>
</body>
</html>