<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>SHA</title>
		<script>
			'use strict';
			let str = "";
			
			function shaCheck() {
				let pwd = myform.pwd.value;
				if(pwd.trim() == "") {
					alert("비밀번호를 입력해주세요.");
					myform.pwd.focus();
					return false;
				}
				$.ajax({
	    		url  : 'SHAOk.study',
	    		type : 'POST',
	    		data : {"pwd" : pwd},
	    		success : (res) => {
	    			if(res != '0') {
							str = res += "<br/><hr/>";
							demo.innerHTML += str;
	    			}
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
		<h2>비밀번호 암호화 연습(SHA).</h2>
		<hr/>
		<pre>
  <font size="3">SHA(Secure Hash Algorithm)</font>
    -SHA는 단방향식 암호화 기법으로, 암호학적 해시함수들의 모임이다.
    -일반적으로 복호화 할수 없도록 만든 알고리즘으로, SHA-2라고도 한다.
    -해시함수가 출력되는 암축된 문장을 다이제스트(Digest)라고 하는데,
     이때 SHA-2가 생성해주는 다이제스트의 출력길이는 256, 512Bit가 있다.
    -여기서 256Bit의 출력길이를 갖는 SHA-2암호화기법을 'SHA-256암호화 방식'이라고 한다.
		</pre>		
		<form name="myform" method="post">
			<div class="input-group">
				<div class="input-group-text">비밀번호</div>
				<input type="password" name="pwd" id="pwd" value="1234" class="form-control" />
				<input type="button" value="SHA암호화" onclick="shaCheck()" class="btn btn-success" />
			</div>
		</form>
		<div id="demo"></div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>