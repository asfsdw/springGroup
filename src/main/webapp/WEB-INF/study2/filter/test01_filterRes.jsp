<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>test01_filterRes</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>이곳은 test01_filterRes.jsp 입니다.</h2>
		<p><br/></p>
		<div>메시지: ${message}</div>
		<hr/>
		<div><a href="${ctp}/study2/filter/Test01_filter" class="btn btn-success">돌아가기</a></div>
	</div>
	<p><br/></p>
</body>
</html>