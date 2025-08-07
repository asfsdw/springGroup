<%@page import="org.apache.jasper.compiler.Node.GetProperty"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msgFlag = request.getParameter("msgFlag") == null ? "" : request.getParameter("msgFlag");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test10</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	'use strict';
    	
    	function fCheck() {
    		let mid = $("#mid").val();
    		let pwd = $("#pwd").val();
    		let regMid = /^[\w]+$/;
    		let regPwd = /^[\w]+$/;
    		
    		if(!regMid.test(mid)) alert("아이디를 확인해주세요.");
    		else if(!regPwd.test(pwd)) alert("비밀번호를 확인해주세요.");
    		else myform.submit();
    	}
    	
    	if("<%=msgFlag%>" == "no") alert("로그인에 실패했습니다.");
    </script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>로그인</h2>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/j0806/Test10">
    	<div class="mb-3">아이디
    		<input type="text" id="mid" name="mid" value="hkd1234" autofocus required class="form-control" />
    	</div>
    	<div class="mb-3">비밀번호
    		<input type="password" id="pwd" name="pwd" value="1234" required class="form-control" />
    	</div>
    	<div class="mb-3">
    		<input type="button" value="로그인" onclick="fCheck()" class="form-control btn btn-success" />
    	</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>