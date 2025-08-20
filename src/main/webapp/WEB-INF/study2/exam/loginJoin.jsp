<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>loginJoin</title>
		<script>
			'use strict';
			const regMid = /^[a-zA-Z0-9_]{3,20}$/;
			const regPwd = /^(?=[a-zA-Z0-9]*[!@#$%^&*()\-_=+?][a-zA-Z0-9]*$)[a-zA-Z0-9!@#$%^&*()\-_=+?]{2,}$/;
			const regNickName = /^[a-zA-Z가-힣0-9-_]{2,10}$/;
			const regName = /^[가-힣]{2,10}$/;
			const regAddress = /^[가-힣]{2}$/;
			
			function fCheck() {
				if(!regMid.test($("[name='mid']").val().trim())) {
					alert("아이디는 영문, 숫자, _을 사용해 3~20자 이내로 설정해주세요.");
					return false;
				}
				if(!regPwd.test($("[name='pwd']").val().trim())) {
					alert("비밀번호는 특수문자를 반드시 한 개 이상 포함해서 영문, 숫자 2자리 이상으로 설정해주세요.");
					return false;
				}
				if(!regNickName.test($("[name='nickName']").val().trim())) {
					alert("닉네임은 영문, 한글, 숫자, _을 사용해 2~10자 이내로 설정해주세요.");
					return false;
				}
				if(!regName.test($("[name='name']").val().trim())) {
					alert("이름은 한글로 2~10자 이내로 입력해주세요.");
					return false;
				}
				if($("[name='age']").val() < 1 || $("[name='age']").val() > 100 || $("[name='age']").val() == null) {
					alert("나이는 숫자로 1이상 99이하로 적어주세요.");
					return false;
				}
				if(!regAddress.test($("[name='address']").val().trim())) {
					alert("주소는 서울, 청주, 경기처럼 2글자로 지역을 적어주세요.");
					return false;
				}
				myform.submit();
			}
		</script>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회원가입</h2>
		<p><br/></p>
		<form name="myform" method="post" action="${ctp}/study2/login/LoginJoinOk">
			<table class="table table-bordered text-center">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" autofocus class="form-control" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" class="form-control" /></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickName" class="form-control" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="form-control" /></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" class="form-control" /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td class="text-start">
						<input type="radio" name="gender" value="남자" checked />남자 &nbsp&nbsp
						<input type="radio" name="gender" value="여자" />여자
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" class="form-control" /></td>
				</tr>
			</table>
			<p><br/></p>
			<div class="row text-center">
				<input type="button" name="join" value="회원가입" onclick="fCheck()" class="col btn btn-success ms-3" />
				<span class="col"></span>
				<input type="reset" value="다시쓰기" class="col btn btn-warning" />
				<span class="col"></span>
				<input type="button" name="return" value="돌아가기" onclick="location.href='${ctp}/study2/login/Login'" class="col btn btn-primary ms-3" />
			</div>
		</form>
	</div>
	<p><br/></p>
</body>
</html>