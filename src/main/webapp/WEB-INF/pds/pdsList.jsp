<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>자료실(PDS)</title>
		<script>
			'use strict';
			
			// 분류 별.
			$(() => {
				$("#part").on("change", () => {
					let part = $("#part").val();
					location.href="PDSList.pds?part="+part
				});
			});
			
			// 모달 출력.
			function fCheck(title, part, nickName, fDate) {
				$("#modal-title").text(title);
				$("#modal-part").text(part);
				$("#modal-nickName").text(nickName);
				$("#modal-fDate").text(fDate);
			}
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">자료실(${part})</h2>
		<p><br/></p>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>
					<form name="partForm">
						<select name="part" id="part" onchange="partCheck()">
							<option ${part=="전체" ? "selected" : ""}>전체</option>
							<option ${part=="학습" ? "selected" : ""}>학습</option>
							<option ${part=="여행" ? "selected" : ""}>여행</option>
							<option ${part=="음식" ? "selected" : ""}>음식</option>
							<option ${part=="기타" ? "selected" : ""}>기타</option>
						</select>
					</form>
				</td>
				<td class="text-end">
					<a href="PDSInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>자료제목</th>
				<th>올린이</th>
				<th>올린날짜</th>
				<th>분류</th>
				<th>파일명(크기)</th>
				<th>다운수</th>
				<th>비고</th>
			</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${fn:length(vos) - st.index}</td>
				<td>
					<%-- <a href="PDSContent.pds?idx=${vo.idx}&part=${vo.part}">${vo.title}</a> --%>
					<a href="#" onclick="fCheck('${vo.title}','${vo.part}','${vo.nickName}','${vo.fDate}')" data-bs-toggle="modal" data-bs-target="#myModal1">${vo.title}</a>
					<c:if test="${vo.hourDiff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
				</td>
				<td>${vo.nickName}</td>
				<td>
					${vo.fDate}
				</td>
				<td>${vo.part}</td>
				<c:set var="fNames" value="${fn:split(vo.fName, '/')}"></c:set>
				<c:set var="fSizes" value="${fn:split(vo.fSize, '/')}"></c:set>
				<td>
					<c:forEach var="i" begin="0" end="${fn:length(fNames)-1}">
						${fNames[i]}(<fmt:formatNumber value="${fSizes[i]/10000}" maxFractionDigits="1"/>MB)<br/>
					</c:forEach>
				</td>
				<td>${vo.downNum}</td>
				<td><!-- 올린이와 관리자만 삭제가능 -->
					<a href="javascript:pdsDeleteCheck(${vo.idx})" title="삭제">🗑️</a>
					<a href="#" title="전체다운">💽</a>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<p><br/></p>
	<!-- The Modal -->
	<div class="modal fade" id="myModal1">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 id="modal-title" class="modal-title"></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<div>분류:<span id="modal-part"></span></div>
				<div>올린이:<span id="modal-nickName"></span></div>
				<div>올린날짜:<span id="modal-fDate"></span></div>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 id="modal-title" class="modal-title"></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div id="modal-body" class="modal-body">
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>