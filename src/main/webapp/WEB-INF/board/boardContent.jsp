<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>${vo.title}</title>
		<style>
			th {
				background-color: #eee !important;
				text-align: center;
			}
		</style>
		<script>
			'use strict';
			// 좋아요 처리.
			function goodCheck() {
				$.ajax({
					url : "BoardGoodCheck.board",
					type : "POST",
					data : {"idx" : ${vo.idx}},
					success : (res) => {
						if(res != "0") {
							location.reload();
						}
					},
					error : () => alert("전송오류")
				});
			}
			function goodCheckPlus() {
				$.ajax({
					url : "BoardGoodCheckPlusMinus.board",
					type : "POST",
					data : {
						"idx" : ${vo.idx},
						"goodCnt" : 1
					},
					success : (res) => {
						if(res != "0") location.reload();
					},
					error : () => alert("전송오류")
				});
			}
			function goodCheckMinus() {
				$.ajax({
					url : "BoardGoodCheckPlusMinus.board",
					type : "POST",
					data : {
						"idx" : ${vo.idx},
						"goodCnt" : -1
					},
					success : (res) => {
						if(res != "0") location.reload();
					},
					error : () => alert("전송오류")
				});
			}
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">
			${vo.title}
			/
			<a href="javascript:goodCheckPlus()" title="좋아요" class="text-decoration-none text-dark link-primary">👍</a>
			<a href="javascript:goodCheckMinus()" title="싫어요" class="text-decoration-none text-dark link-primary">👎</a>
		</h2>
		<p><br/></p>
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td>${vo.nickName}</td>
				<th>글쓴날짜</th>
				<td colspan="3">${vo.wDate}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.readNum}</td>
				<th>좋아요</th>
				<td>${vo.good}</td>
				<th>접속IP</th>
				<td>${vo.hostIP}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5" style="height:230px">${fn:replace(vo.content, newLine, "<br/>")}</td>
			</tr>
			<tr>
				<td colspan="6" class="text-center">
					<input type="button" value="돌아가기" onclick="location.href='BoardList.board';" class="btn btn-warning" />
				</td>
			</tr>
		</table>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>