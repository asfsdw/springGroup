<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title></title>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">시험 결과</h2>
		<p><br/></p>
		<div id="demo">
			<table class="table table-bordered text-center">
				<tr>
					<th>학번</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>과학</th>
					<th>사회</th>
					<th>총점</th>
					<th>평균</th>
					<th>학점</th>
					<th>등수</th>
				</tr>
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>${vo.hakbun}</td>
						<td>${vo.kor}</td>
						<td>${vo.eng}</td>
						<td>${vo.mat}</td>
						<td>${vo.sci}</td>
						<td>${vo.soc}</td>
						<td>${vo.tot}</td>
						<td>${vo.avr}</td>
						<td>${vo.grade}</td>
						<td>${vo.ranking}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>