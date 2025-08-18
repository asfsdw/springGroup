<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sessionSW = request.getParameter("sessionSW");

	session.removeAttribute(sessionSW);

	pageContext.setAttribute("sessionSW", sessionSW);
%>
<script>
	alert("선택하신 ${sessionSW} 항목이 삭제되었습니다.");
	location.href = "test02_Session.jsp";
</script>