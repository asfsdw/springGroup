<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>UUID</title>
		<script>
			'use strict';
			let str = "";
			
			function uuidCreate() {
				$.ajax({
					url : "UUIDProcess.study",
					type : "POST",
					data : {},
					success : (res) => {
						str = res += "<br/>";
						demo.innerHTML = str;
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
		<h2 class="text-center">UUID 사용 연습</h2>
		<p><br/></p>
		<pre>
 <font size="4"><b>Universally Unique IDentifier</b></font>
  =UUID
 -네트워크상에서 고유성이 보장되는 id를 만들기 위한 규약.
   -중복될 확률이 0%에 가깝다.
 -32자리의 16진수(128bit)로 표현된다. (8-4-4-4-12)
   -1234abdf-ad23-ff12-8823-43260fdabca3
		</pre>
		<hr/>
		<form name="myform">
			<input type="button" value="UUID생성" onclick="uuidCreate()" class="btn btn-success" />
			<input type="button" value="새로고침" onclick="location.reload()" class="btn btn-warning" />
		</form>
		<hr/>
		출력결과<br/>
		<div id="demo"></div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>