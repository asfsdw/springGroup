<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>idCheck1</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">아이디로 회원검색한 결과</h2>
		<p><br/></p>
		<div>
			번호: ${vo.idx}<br/>
			아이디: ${vo.mid}<br/>
			비밀번호: ${vo.pwd}<br/>
			닉네임: ${vo.nickName}<br/>
			성명: ${vo.name}<br/>
			나이: ${vo.age}<br/>
			성별: ${vo.gender}<br/>
			주소: ${vo.address}<br/>
		</div>
		<p><br/></p>
		<p>
			<a href="${ctp}/study2/ajax/AjaxMenu" class="btn btn-warning">돌아가기</a>
		</p>
	</div>
	<p><br/></p>
</body>
</html>