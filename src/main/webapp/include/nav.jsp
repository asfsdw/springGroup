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
        <a class="nav-link" href="${ctp}/guest/GuestList.guest">방명록(Guest)</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">게시판(Board)</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">자료실(PDS)</a>
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
				  </ul>
				</div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">선택불가메뉴</a>
      </li>
    </ul>
  </div>
</nav>