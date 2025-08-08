<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	성적자료를 form 태그를 통해 입력받아서 '총점, 평균, 학점, 순위'를 구해서 출력하시오.
	추가 버튼(동적폼)을 통해 입력 폼을 추가해 복수의 점수를 입력받으시오.
 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>ex03_vos1</title>
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