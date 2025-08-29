<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>파일 업로드</title>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">파일 업로드 연습(COS라이브러리)</h2>
		<pre>
  COS라이브러리
  -MultipartRequest() / DefaultFileRenamePolicy()
  -MultipartRequest()
    -서버저장소명, 서버에 저장될 파일의 경로, 서버에 저장될 파일의 최대용량, 코드변환 방식, 기타옵션(파일명 중복방지 처리 등)
  -서버 파일시스템의 저장경로
    -getRealPath()
      -홈디렉토리(webapp) 기준으로 설정
      -ServletContext application = request.getServletContext();
		   application.getRealPath("");
		</pre>
		<p><br/></p>
		<div class="row">
			<div class="col"><a href="FileUpload1.study" class="btn btn-success">파일 업로드1(싱글파일)</a></div>
			<div class="col"><a href="FileUpload2.study" class="btn btn-primary">파일 업로드2(멀티파일)</a></div>
			<div class="col"><a href="FileUpload3.study" class="btn btn-info">파일 업로드3(멀티파일)</a></div>
			<div class="col"><a href="FileUpload4.study" class="btn btn-warning">파일 업로드4(멀티파일)</a></div>
		</div>
		<p><br/></p>
		<div class="row">
			<div class="col"><a href="FileList.study" class="btn btn-primary form-control">파일목록 보기</a></div>
		</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>