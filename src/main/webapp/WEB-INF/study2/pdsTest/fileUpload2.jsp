<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>파일 업로드 2번(COS라이브러리)</title>
		<script>
		 'use strict';
		 
		 function fCheck() {
			 let fName1 = $("#file1").val();
			 let fName2 = $("#file2").val();
			 let fName3 = $("#file3").val();
			 let maxSize = 1024 * 1024 * 10; // 2바이트^10=1024바이트 *2=메가바이트
			 
			 let ext1 =fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
			 let ext2 =fName2.substring(fName2.lastIndexOf(".")+1).toLowerCase();
			 let ext3 =fName3.substring(fName3.lastIndexOf(".")+1).toLowerCase();
			 
			 if(fName1.trim() == "" || fName2.trim() == "" || fName3.trim() == "") {
				 alert("업로드할 파일을 선택하세요.");
				 return false;
			 }
			 let fileSize1 = $("#file1")[0].files[0].size;
			 let fileSize2 = $("#file2")[0].files[0].size;
			 let fileSize3 = $("#file3")[0].files[0].size;
			 if(fileSize1 > maxSize || fileSize2 > maxSize || fileSize3 > maxSize) {
				 alert("업로드할 파일의 최대 용량은 10MB 이하로 선택해주세요.");
				 return false;
			 }
			 else if(ext1 != "jpg" && ext1 != "jpeg" && ext1 != "gif" && ext1 != "png" && ext1 != "txt" && ext1 != "hwp" && ext1 != "doc" && ext1 != "ppt" && ext1 != "pptx" && ext1 != "pdf" && ext1 != "zip") {
				 alert("업로드 가능한 파일은 'jpg, jpeg, gif, png, txt, hwp, doc, ppt, pptx, pdf, zip'입니다.");
				 return false;
			 }
			 else if(ext2 != "jpg" && ext2 != "jpeg" && ext2 != "gif" && ext2 != "png" && ext2 != "txt" && ext2 != "hwp" && ext2 != "doc" && ext2 != "ppt" && ext2 != "pptx" && ext2 != "pdf" && ext2 != "zip") {
				 alert("업로드 가능한 파일은 'jpg, jpeg, gif, png, txt, hwp, doc, ppt, pptx, pdf, zip'입니다.");
				 return false;
			 }
			 else if(ext3 != "jpg" && ext3 != "jpeg" && ext3 != "gif" && ext3 != "png" && ext3 != "txt" && ext3 != "hwp" && ext3 != "doc" && ext3 != "ppt" && ext3 != "pptx" && ext3 != "pdf" && ext3 != "zip") {
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
		<h2 class="text-center">파일 업로드 연습(멀티파일)</h2>
		<p><br/></p>
		<form name="myform" method="post" action="FileUploadOk2.study" enctype="multipart/form-data">
			<div>
				<input type="file" name="fName1" id="file1" class="form-control mb-2" />
				<input type="file" name="fName2" id="file2" class="form-control mb-2" />
				<input type="file" name="fName3" id="file3" class="form-control mb-2" />
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