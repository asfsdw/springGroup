<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
	String msgFlag = request.getParameter("msgFlag") == null ? "" : request.getParameter("msgFlag");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test07_member</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	'use strict';
    	
    	if("<%=msgFlag%>" == "ok") alert("<%=mid%>님 방문을 환영합니다.");
    	
    	function logoutCheck() {
    		let ans = confirm("로그아웃하시겠습니까?");
    		if(ans) {
    			alert("<%=mid%>님 로그아웃되었습니다.");
    			location.href = "test07.jsp";
    		}
    	}
    	
    </script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>이곳은 회원 전용 방입니다.</h2>
    <hr/>
    <p>현재 로그인된 사용자: <%=mid%></p>
    <hr/>
    <p><a href="javascript:logoutCheck()" class="btn btn-warning">로그아웃</a></p>
  </div>
  <p><br/></p>
</body>
</html>