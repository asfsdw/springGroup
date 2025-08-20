<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>testMenu</title>
	</head>
<body>
	<p><br/></p>
	<p>어플리케이션 테스트: ${aTest}</p>
	<div class="container">
		<p><a href="${ctp}/study2/Test1">Test1</a></p>
		<p><a href="${ctp}/study2/Test2">Test2</a></p>
		<p><a href="${ctp}/study2/T3">Test3</a></p>
		<p><a href="${ctp}/study2/Test4">Test4</a></p>
		<p><a href="${ctp}/study2/filter/Test01_filter">Test01_filter</a></p>
		<p><a href="${ctp}/study2/init/login">login 테스트</a></p>
		<p><a href="${ctp}/springGroup">login 테스트2</a></p>
		<p><a href="${ctp}/javaGroup">login 테스트3</a></p>
		<p><a href="${ctp}/study2/login/Login">웹사이트 테스트</a></p>
		<p><a href="${ctp}/study2/password/PassForm">비밀번호 암호화 테스트</a></p>
		<p><a href="${ctp}/study2/ajax/AjaxMenu">AJAX 테스트</a></p>
	</div>
	<p><br/></p>
</body>
</html>