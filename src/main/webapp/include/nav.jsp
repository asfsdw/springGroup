<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
			<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link active" href="http://192.168.50.53:9090/springGroup">HOME</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="GuestList.guest">방명록(Guest)</a>
			</li>
			<c:if test="${!empty sMid}">
				<li class="nav-item">
					<a class="nav-link" href="BoardList.board">게시판(Board)</a>
				</li>
				<li class="nav-item">
					<!-- Posting Data System -->
					<a class="nav-link" href="PDSList.pds">자료실(PDS)</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${ctp}/study2/login/LoginInfo">회원정보</a>
				</li>
				<li class="nav-item">
					<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown">공부(Study)</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${ctp}/study2/ajax/friend/FriendMain">AJAX 연습</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Directory">디렉토리매핑 연습</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension.do">확장자매핑 연습1</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension2.test1">확장자매핑 연습2</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension3.test3">확장자매핑 연습3</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension4.test4">확장자매핑 연습4</a></li>
							<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension5.test5">확장자매핑 연습5</a></li>
							<li><a class="dropdown-item" href="UUID.study">UUID연습</a></li>
							<li><a class="dropdown-item" href="FileUpload.study">파일 업로드 연습(COS라이브러리)</a></li>
							<li><a class="dropdown-item" href="SHA.study">SHA암호화</a></li>
							<li><a class="dropdown-item" href="ModalTest.study">Modal 연습</a></li>
						</ul>
					</div>
				</li>
			</c:if>
			<li class="nav-item">
				<a class="nav-link disabled" href="#">선택불가메뉴</a>
			</li>
			<li class="nav-item">
				<c:if test="${empty sMid}"><a class="nav-link" href="${ctp}/study2/login/Login">로그인</a></c:if>
				<c:if test="${!empty sMid}"><a class="nav-link" href="${ctp}/study2/login/Logout?mid=${sMid}">로그아웃</a></c:if>
			</li>
		</ul>
	</div>
</nav>