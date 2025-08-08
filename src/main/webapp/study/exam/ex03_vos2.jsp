<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	성적자료를 form 태그를 통해 입력받아서 '총점, 평균, 학점, 순위'를 구해서 출력하시오.
	자바스크립트 배열을 이용해서 배열명을 서버로 넘겨 처리 후, 결과를 출력.
 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>ex03_vos2</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>성적 출력 프로그램</h2>
		<form name="myform" method="post" action="">
		</form>
		<div id="demo"></div>
	</div>
	<p><br/></p>
</body>
</html>