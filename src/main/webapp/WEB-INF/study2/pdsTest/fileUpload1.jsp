<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>파일 업로드 1번(COS라이브러리)</title>
		<script>
		 'use strict';
		 
		 function fCheck() {
			 let fName = $("#file").val();
			 let maxSize = 1024 * 1024 * 10; // 2바이트^10=1024바이트 *2=메가바이트
			 
			 let ext =fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			 
			 if(fName.trim() == "") {
				 alert("업로드할 파일을 선택하세요.");
				 return false;
			 }
			 let fileSize = $("#file")[0].files[0].size;
			 if(fileSize > maxSize) {
				 alert("업로드할 파일의 최대 용량은 10MB 이하로 선택해주세요.");
				 return false;
			 }
			 if(ext != "jpg" && ext != "jpeg" && ext != "gif" && ext != "png" && ext != "txt" && ext != "hwp" && ext != "doc" && ext != "ppt" && ext != "pptx" && ext != "pdf" && ext != "zip") {
				 alert("업로드 가능한 파일은 'jpg, jpeg, gif, png, txt, hwp, doc, ppt, pptx, pdf, zip'입니다.");
				 return false;
			 }
			 myform.submit();
		 }
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">파일 업로드 연습(싱글파일)</h2>
		<p><br/></p>
		<form name="myform" method="post" action="FileUploadOk1.study" enctype="multipart/form-data">
			<div>분류
				<select name="part">
					<option>학습</option>
					<option>여행</option>
					<option>음식</option>
					<option>기타</option>
				</select>
			</div>
			<div class="input-group">
				<input type="file" name="fName" id="file" class="form-control" />
				<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success" />
			</div>
		</form>
		<hr/>
		<div class="row">
			<div class="col"><a href="FileList.study" class="btn btn-primary form-control">파일목록 보기</a></div>
			<div class="col"><a href="FileUpload.study" class="btn btn-warning form-control">돌아가기</a></div>
		</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>