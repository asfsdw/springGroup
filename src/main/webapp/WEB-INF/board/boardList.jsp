<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>게시판</title>
		<script>
			'use strict';
			
			// 게시글 x개 표시하기.
			$(() => {
				$("#viewPageCnt").on("change", () => {
					let startIndexNo = ${startIndexNo};
					let pageSize = $("#viewPageCnt").val();
					// 페이지 도중에 바꿨을 때, 가장 위에 글이 포함된 페이지로 이동.
					let pag = Math.floor(startIndexNo / pageSize) + 1;
					location.href="BoardList.board?pag="+pag+"&pageSize="+pageSize;
				});
			});
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">게시글 리스트</h2>
		<table class="table table-bordeless m-0 p-0">
			<tr>
				<td class="text-start"><a href="BoardInput.board" class="btn btn-success btn-sm">글쓰기</a></td>
				<td class="text-end"></td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-secondary">
				<th>번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>올린날짜</th>
				<th>조회수(👍)</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${curScrStartNo}</td>
					<td class="text-start">
						<c:if test="${vo.openSW == 'NO'}">
							<c:if test="${vo.mid == sMid || sAdmin == 'adminOK'}">
								<a href="BoardContent.board?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}"
									class="text-primary link-secondary link-underline-opacity-0 link-underline-opacity-100-hover">
									<c:if test="${sAdmin == 'adminOK'}"><font color="red">(비밀글) </font></c:if>${vo.title}
								</a>
							</c:if>
							<c:if test="${vo.mid != sMid && sAdmin != 'adminOK'}">비밀글입니다.</c:if>
						</c:if>
						<c:if test="${vo.openSW != 'NO'}">
							<a href="BoardContent.board?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}"
								class="text-primary link-secondary link-underline-opacity-0 link-underline-opacity-100-hover">${vo.title}</a>
						</c:if>
						<c:if test="${vo.hourDiff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
					</td>
					<td>${vo.nickName}</td>
					<td>
						<%-- <c:if test="${vo.dateDiff == 0}">${fn:substring(vo.wDate,11,19)}</c:if>
						<c:if test="${vo.dateDiff == 1}">${fn:substring(vo.wDate,5,19)}</c:if>
						<c:if test="${vo.dateDiff >= 2}">${fn:substring(vo.wDate,0,10)}</c:if> --%>
						${vo.dateDiff == 0 ? fn:substring(vo.wDate,11,19) : vo.dateDiff == 1 ? fn:substring(vo.wDate,5,19) : fn:substring(vo.wDate,0,10)}
					</td>
					<td>
						${vo.readNum}<c:if test="${vo.good != 0}">(${vo.good})</c:if>
					</td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
			</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		<div class="input-group justify-content-center">
			<select name="viewPageCnt" id="viewPageCnt" class="form-select" style="flex: 0 0 200px;">
				<option value="5" ${pageSize==5 ? 'selected' : ''}>5개씩 보기</option>
				<option value="10"<c:if test="${pageSize == 10}">selected</c:if>>10개씩 보기</option>
				<option value="15"<c:if test="${pageSize == 15}">selected</c:if>>15개씩 보기</option>
				<option value="20"<c:if test="${pageSize == 20}">selected</c:if>>20개씩 보기</option>
				<option value="30"<c:if test="${pageSize == 30}">selected</c:if>>30개씩 보기</option>
			</select>
			<div class="pagination">
				<!-- pag와 pageSize를 BoardList에 보내준다. -->
				<c:if test="${pag > 1}"><a href="BoardList.board?pag=1&pageSize=${pageSize}" class="page-item page-link text-dark">첫 페이지</a></c:if>
				<c:if test="${curBlock > 0}">
					<a href="BoardList.board?pag=${(curBlock - 1) * blockSize + 1}&pageSize=${pageSize}" class="page-item page-link text-dark">이전 블록</a>
				</c:if>
				<c:forEach var="i" begin="${(curBlock * blockSize) + 1}" end="${(curBlock * blockSize) + blockSize}" varStatus="st">
					<c:if test="${i <= totPage && i == pag}">
						<span class="page-item active page-link bg-secondary border-secondary">${i}</span>
					</c:if>
					<c:if test="${i <= totPage && i != pag}">
						<a href="BoardList.board?pag=${i}&pageSize=${pageSize}" class="page-item page-link text-dark">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<a href="BoardList.board?pag=${(curBlock + 1) * blockSize + 1}&pageSize=${pageSize}" class="page-item page-link text-dark">다음 블록</a>
				</c:if>
				<c:if test="${pag < totPage}">
					<a href="BoardList.board?pag=${totPage}&pageSize=${pageSize}&pageSize=${pageSize}" class="page-item page-link text-dark">마지막 페이지</a>
				</c:if>
			</div>
		</div>
		<p></p>
		<!-- 블록페이지 끝 -->
		<!-- 검색기 시작 -->
		<div class="text-center">
			<form name="searchForm" method="post" action="BoardSearchList.board">
				<b>검색:</b>
				<select name="search" id="search">
					<option value="title">글제목</option>
					<option value="nickName">글쓴이</option>
					<option value="content">글내용</option>
				</select>
				<input type="text" name="searchString" id="searchString" required />
				<input type="submit" value="검색버튼" class="btn btn-info btn-sm" />
			</form>
		</div>
		<!-- 갬식기 끝 -->
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>