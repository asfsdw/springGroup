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
		<title>현재 업로드된 파일 목록</title>
		<script>
			'use strict';
			// 파일삭제.
			function fileDelete(fName) {
				let ans = confirm("파일을 정말로 삭제하시겠습니까?");
				if(ans) {
					$.ajax({
						url : "FileDelete.study",
						type : "POST",
						data : {"fName" : fName},
						success : (res) => {
							if(res != 0) {
								alert("파일이 삭제되었습니다.");
								location.reload();
							}
							else alert("파일 삭제에 실패했습니다.");
						},
						error : () => alert("전송오류")
					});
				}
			}
			// 전체선택
			function selectAll() {
				for(let i=0; i<document.getElementsByName("fileCheck").length; i++) {
					document.getElementsByName("fileCheck")[i].checked = true;
				}
			}
			// 전체해제
			function deSelectAll() {
				for(let i=0; i<document.getElementsByName("fileCheck").length; i++) {
					if(document.getElementsByName("fileCheck")[i].checked) document.getElementsByName("fileCheck")[i].checked = false;
					else document.getElementsByName("fileCheck")[i].checked = true;
				}
			}
			// 전체삭제
			function allDelete() {
				let ans = confirm("파일을 정말로 삭제하시겠습니까?");
				if(ans) {
					let fNames = [];
					for(let i=0; i<document.getElementsByName("fileCheck").length; i++) {
						if(document.getElementsByName("fileCheck")[i].checked) fNames.push(document.getElementsByName("fileCheck")[i].value);
					}
					$.ajax({
						url : "FileDelete.study",
						type : "POST",
						// 배열 보낼 때, 써줘야 한다.
						traditional : true,
						data : {"fNames" : fNames},
						success : (res) => {
							if(res != 0) {
								alert("파일이 삭제되었습니다.");
								location.reload();
							}
							else alert("파일 삭제에 실패했습니다.");
						},
						error : () => alert("전송오류")
					});
				}
			}
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">파일목록</h2>
		<h4 class="text-center">(경로:/images/pdsTest)</h4>
		<div class="text-center">
			<a href="FileUpload.study" class="btn btn-warning">돌아가기</a>
			<a href="javascript:selectAll()" class="btn btn-info">전체선택</a>
			<a href="javascript:deSelectAll()" class="btn btn-info">전체해제</a>
			<a href="javascript:allDelete()" class="btn btn-danger">선택삭제</a>
		</div>
		<p><br/></p>
		<c:forEach var="file" items="${files}" varStatus="st">
			${st.count} &nbsp;
			<input type="checkbox" name="fileCheck" value="${file}" />
			<c:set var="fNameArr" value="${fn:split(file, '.')}"/>
			<c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}" />
			<c:if test="${extName == 'jpg' || extName == 'jpeg' || extName == 'gif' || extName == 'png'}">
				<p><img src="${ctp}/images/pds/${file}" width="150" /></p>
			</c:if>
			<c:if test="${extName != 'jpg' && extName != 'jpeg' && extName != 'gif' && extName != 'png'}">
				<p>${file}</p>
			</c:if>
			<a href="${ctp}/images/pds/${file}" download="${file}">다운로드</a> &nbsp;&nbsp;
			<a href="javascript:fileDelete('${file}')">삭제</a>
			<hr/>
		</c:forEach>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>