<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String loginSF = request.getParameter("loginSF");
	Cookie[] cookies = request.getCookies();
	String reMid = "";
	String rePwd = "";
	
	// 쿠키에 저장되어있는 아이디, 비밀번호 저장.
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) reMid = cookies[i].getValue();
			if(cookies[i].getName().equals("cPwd")) rePwd = cookies[i].getValue();
		}
	}
%>
<%--
로그인 화면
아이디:
비밀번호:
로그인, 아이디 저장(cookie)

아이디 저장을 체크하면
쿠키 저장 경유
회원방
로그아웃
로그아웃 후에도 아이디 저장.

아이디 저장을 체크하지 않으면
회원방
로그아웃
로그아웃 후에는 아이디 빈칸.
--%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>login</title>
		<script>
			'use strict'
			let str = "";
			let loginSF = "";
			
			const regMid = /^[a-zA-Z0-9_]{3,20}$/;
			const regPwd = /^(?=[a-zA-Z0-9]*[!@#$%^&*()\-_=+?][a-zA-Z0-9]*$)[a-zA-Z0-9!@#$%^&*()\-_=+?]{2,}$/;
			
			// 페이지에 올 때마다 동작해야 하므로 DOM 처리.
			$(() => {
				if("<%=loginSF%>" == "fail") alert("로그인에 실패했습니다.");
				
				// 저장된 아이디 불러오기, 체크박스 체크.
				if("<%=reMid%>" != "") {
					$("#mid").val("<%=reMid%>");
					$("#rememberMid").prop("checked", true);
				}
				// 저장된 비밀번호 불러오기 체크박스 체크.
				if("<%=rePwd%>" != "") {
					$("#pwd").val("<%=rePwd%>");
					$("#rememberPwd").prop("checked", true);
				}
			});
			
			function login() {
				if(!regMid.test(mid.value)) {
					alert("아이디는 영문, 숫자, _로 3~20글자 이내로 입력해주세요.");
					return false;
				}
				if(!regPwd.test(pwd.value)) {
					alert("비밀번호는 영문, 숫자, 특수문자 1글자 이상으로 입력해주세요.");
					return false;
				}
				myform.submit();
			}
		</script>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>로그인</h2>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/exam/Ex04Ok">
			<div class="m-4 border">
				<div class="m-4">
					<span>아이디 &nbsp;&nbsp;</span>
					<input type="text" id="mid" name="mid" required autofocus />
					<input type="checkbox" id="rememberMid" name="rememberMid" value="아이디 기억" />아이디 기억
					<p></p>
					<span>비밀번호</span>
					<input type="password" id="pwd" name="pwd" required autofocus />
					<input type="checkbox" id="rememberPwd" name="rememberPwd" value="비밀번호 기억" />비밀번호 기억
					<p></p>
					<input type="button" id="loginBtn" name="loginBtn" value="로그인" onclick="login()" class="btn btn-success" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>