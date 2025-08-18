<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int sCount = session.getAttribute("sCount") == null ? 0 : (int)session.getAttribute("sCount");
	int aCount = application.getAttribute("aCount") == null ? 0 : (int)application.getAttribute("aCount");
	
	sCount++;
	aCount++;
	
	session.setAttribute("sCount", sCount);
	application.setAttribute("aCount", aCount);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>test04_storageTest</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>방문자 수를 session, application 비교</h2>
		<hr/>
		<p>세션 카운트: ${sCount}</p>
		<p>어플리케이션 카운트: ${aCount}</p>
		<hr/>
		<p><a href="test04_storageTest.jsp" class="btn btn-success">방문자 수 증가</a></p>
	</div>
	<p><br/></p>
</body>
</html>