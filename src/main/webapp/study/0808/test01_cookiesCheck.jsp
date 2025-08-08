<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Cookie[] cookies = request.getCookies();
	out.println("저장된 쿠키<br/>");
	for(int i=0; i<cookies.length; i++) {
		out.print("쿠키 이름: "+cookies[i].getName()+" ");
		out.print("쿠키 값: "+cookies[i].getValue()+" ");
		out.print("<br/>");
	}
%>
<p><a href="test01_cookies.jsp">돌아가기</a></p>
