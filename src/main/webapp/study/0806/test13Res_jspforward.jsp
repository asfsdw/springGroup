<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String buseo = request.getParameter("buseo");
%>
<%if(buseo.equals("1")) {%>
	<jsp:forward page="test13Insa.jsp">
		<jsp:param value="<%=mid%>" name="mid"/>
	</jsp:forward>
<%} else if(buseo.equals("2")) {%>
	<jsp:forward page="test13service.jsp">
		<jsp:param value="<%=mid%>" name="mid"/>
	</jsp:forward>
<%} else if(buseo.equals("3")) {%>
	<jsp:forward page="test13money.jsp">
		<jsp:param value="<%=mid%>" name="mid"/>
	</jsp:forward>
<%} %>
