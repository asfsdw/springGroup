<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>extension5</title>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">확장자패턴 연습5</h2>
		<p><br/></p>
		<hr/>
		<div>
			<a href="${ctp}/study2/mapping/Home5.test5" class="btn btn-success me-3">HOME5</a>
			<a href="${ctp}/study2/mapping/Guest5.test5" class="btn btn-primary me-3">Guest5</a>
			<a href="${ctp}/study2/mapping/Board5.test5" class="btn btn-secondary me-3">Board5</a>
			<a href="${ctp}/study2/mapping/PDS5.test5" class="btn btn-info me-3">PDS5</a>
		</div>
		<hr/>
		<div id="msg">${msg}</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>