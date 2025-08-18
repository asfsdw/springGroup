<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String mid = request.getParameter("mid") == null ? "guest" : request.getParameter("mid");
	String nickName = request.getParameter("nickName") == null ? "손님" : request.getParameter("nickName");
	String name = request.getParameter("name") == null ? "방문자" : request.getParameter("name");
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickName", nickName);
	session.setAttribute("sName", name);
%>
<script>
	alert("세션이 저장되었습니다.");
	location.href = "test02_Session.jsp"
</script>