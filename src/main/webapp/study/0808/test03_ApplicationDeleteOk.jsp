<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String applicationSW = request.getParameter("ApplicationSW");

	application.removeAttribute(applicationSW);

	pageContext.setAttribute("ApplicationSW", applicationSW);
%>
<script>
	alert("선택하신 ${ApplicationSW} 항목이 삭제되었습니다.");
	location.href = "test03_Application.jsp";
</script>