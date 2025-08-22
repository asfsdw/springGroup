<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>방명록</title>
		<script>
			'use strict';
			
			function guestDelete(idx) {
				let ans = confirm("정말로 삭제하시겠습니까?");
				
				if(!ans) return false;
				
				$.ajax({
					url : "GuestDelete.guest",
					type : "POST",
					data : {"idx" : idx},
					success : (res) => {
						if(res != "0") alert("방명록이 삭제되었습니다.");
						else alert("방명록 삭제에 실패했습니다.");
						location.reload();
					},
					error : () => alert("전송오류")
				});
			}
		</script>
		<style>
			th {
				background-color : #eee !important;
				text-align : center;
			}
		</style>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">방명록 리스트</h2>
		<p><br/></p>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td><a href="GuestInput.guest" class="btn btn-success btn-sm">글쓰기</a></td>
				<td class="text-end">
					<c:if test="${sAdmin != 'adminOK'}"><a href="Admin.guest" class="btn btn-primary btn-sm">관리자</a></c:if>
					<c:if test="${sAdmin == 'adminOK'}"><a href="LogOut.guest" class="btn btn-warning btn-sm">로그아웃</a></c:if>
				</td>
			</tr>
		</table>
		<hr/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<table class="table table-borderless m-0 p-0">
				<tr>
					<td>번호: ${vo.idx} &nbsp&nbsp<c:if test="${sAdmin == 'adminOK'}"><a href="javascript:guestDelete(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></c:if></td>
					<td class="text-end">방문IP: ${vo.hostIP}</td>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>
					<th>방문자</th>
					<td>${vo.name}</td>
					<th>방문일자</th>
					<td colspan="3">${vo.vDate}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3">
						<c:if test="${empty vo.email || fn:length(vo.email) < 6 || fn:indexOf(vo.email, '@') == -1 || fn:indexOf(vo.email, '.') == -1}"> - 없음 -</c:if>
						<c:if test="${!empty vo.email && fn:length(vo.email) >= 6 && fn:indexOf(vo.email, '@') != -1 && fn:indexOf(vo.email, '.') != -1}">${vo.email}</c:if>
					</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="3"><%-- <a href="${vo.homePage}" target="_black">${vo.homePage}</a> --%>
						<c:if test="${empty vo.homePage || fn:length(vo.homePage) < 11 || fn:indexOf(vo.homePage, '.') == -1}"> - 없음 -</c:if>
						<c:if test="${!empty vo.homePage && fn:length(vo.homePage) >= 11 && fn:indexOf(vo.homePage, '.') != -1 && fn:indexOf(vo.homePage, 'https://') == -1}"><a href="https://${vo.homePage}" target="_blank">https://${vo.homePage}</a></c:if>
						<c:if test="${!empty vo.homePage && fn:length(vo.homePage) >= 11 && fn:indexOf(vo.homePage, '.') != -1 && fn:indexOf(vo.homePage, 'https://') != -1}"><a href="${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
					</td>
				</tr>
				<tr>
					<th>방문소감</th>
					<td colspan="3" style="height:150px">${fn:replace(vo.content, newLine, "<br/>")}</td>
				</tr>
			</table>
			<br/>
		</c:forEach>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>