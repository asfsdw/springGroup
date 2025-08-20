<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>main</title>
		<script>
			'use strict'
			
			function logOut() {
				let ans = confirm("로그아웃하시겠습니까?");
				if(ans) {
					// location.href = "${ctp}/study2/login/Login"; // 원래는 로그아웃 서블렛으로 보내, 셋션 등, 정보들 삭제시킨 후, 로그아웃해야한다.
					location.href = "${ctp}/study2/login/Logout";
				}
			}
			function loginList() {
				$.ajax({
					url : "${ctp}/study2/login/LoginList2",
					type : "GET",
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
			function loginSearch1() {
				$.ajax({
					url : "${ctp}/study2/login/LoginSearch1",
					type : "GET",
					data : {"mid" : "admin"},
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
			// 검색 폼 생성.
			function loginSearch2() {
				let searchForm = `
					<div class="input-group">
						<div class="input-group-text">검색할 회원의 아이디를 입력해주세요.</div>
						<input type="text" id="mid" class="form-control" />
						<input type="button" name="sBtn" value="검색" onclick="memberSearch()" class="btn btn-success" />
						<input type="button" name="sCloseBtn" value="닫기" onclick="searchClose()" class="btn btn-danger" />
					</div>
					<hr/>
				`;
				$("#searchDemo").html(searchForm);
			}
			// 생성한 폼에서 검색을 클릭했을 때, 실행하는 실제 회원 검색.
			function memberSearch() {
				let mid = $("#mid").val();
				$.ajax({
					url : "${ctp}/study2/login/LoginSearch2",
					type : "GET",
					data : {"mid" : mid},
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
			// 닫기 둘렀을 때, 검색 폼 삭제(없애기).
			function searchClose() {
				$("#searchDemo").html("");
				$("#updateDemo").html("");
			}
			// 수정하기 위한 폼 생성.
			function loginUpdate() {
				// 수정 전 회원 검색 폼.
				let searchForm = `
					<div class="input-group">
						<div class="input-group-text">수정할 회원의 아이디를 입력해주세요.</div>
						<input type="text" id="mid" class="form-control" />
						<input type="button" name="sBtn" value="검색" onclick="memberSearch()" class="btn btn-success" />
						<input type="button" name="sCloseBtn" value="닫기" onclick="searchClose()" class="btn btn-danger" />
					</div>
					<hr/>
				`;
				$("#searchDemo").html(searchForm);
				// 수정할 내용 입력 폼.
				let updateForm = `
					<div class="input-group">
						<select id="selectUpdate" class="form-select" style="flex: 0 0 150px;">
							<option selected>선택</option>
							<option value="mid">아이디</option>
							<option value="nickName">닉네임</option>
							<option value="name">이름</option>
							<option value="age">나이</option>
							<option value="gender">성별</option>
							<option value="address">주소</option>
						</select>
						<input type="text" id="updateValue" class="form-control" />
						<input type="button" id="updateBtn" value="수정" onclick="memberSearchUpdate()" class="btn btn-warning" />
					</div>
				`;
				$("#updateDemo").html(updateForm);
			}
			// 생성한 폼에서 수정을 클릭했을 때, 실행하는 실제 회원 수정.
			function memberSearchUpdate() {
				let mid = $("#mid").val();
				let update = $("#selectUpdate").val();
				let updateValue = $("#updateValue").val();
				let query = {
						mid : mid,
						update : update,
						updateValue : updateValue
				}
				$.ajax({
					url : "${ctp}/study2/login/LoginUpdate",
					type : "GET",
					data : query,
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
		</script>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회원전용방</h2>
		<hr/>
		<div class="row text-center">
			<div class="col"><a href="LoginList" class="btn btn-success btn-sm">회원리스트 비동기식</a></div>
			<div class="col"><a href="javascript:loginList()" class="btn btn-success btn-sm">회원리스트 동기식</a></div>
			<div class="col"><a href="javascript:loginSearch1()" class="btn btn-primary btn-sm">회원검색(admin)</a></div>
			<div class="col"><a href="javascript:loginSearch2()" class="btn btn-primary btn-sm">회원검색(동적form)</a></div> <!-- 아이디를 입력해주세요 -->
			<div class="col"><a href="javascript:loginUpdate()" class="btn btn-info btn-sm">회원수정</a></div>
			<div class="col"><a href="${ctp}/study2/TestMenu" class="btn btn-warning btn-sm">돌아가기</a></div>
		</div>
		<hr/>
		<div>이곳은 회원전용 서비스 구역입니다.</div>
		<hr/>
		<div>현재 로그인 중인 사용자.
			<p>${sMid} / ${sNickName}</p>
		</div>
		<hr/>
		<div id="searchDemo"></div>
		<div id="demo"></div>
		<hr/>
		<div id="updateDemo"></div>
		<hr/>
		<div class="text-center">
			<button type="button" onclick="logOut()" class="btn btn-warning">로그아웃</button>
		</div>
	</div>
	<p><br/></p>
</body>
</html>