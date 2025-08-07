<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("age", age);
	pageContext.setAttribute("gender", gender);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>title</title>
</head>
<body>
  <div class="container">
    <%-- <p>이름: <%=name%>/${name}</p>
    <p>나이: <%=age%>/${age}</p>
    <p>성별: <%=gender%>/${gender}</p> --%>
    <p>이름: ${name}</p>
    <p>나이: ${age}</p>
    <p>성별: ${gender}</p>
    <p>취미: ${hobby}</p>
    <p>직업: ${job}</p>
    <p>가본 산: ${mountain}</p>
    <p>자기소개<br/>${content}</p>
    <p>파일</p>
    <p><img src="${pageContext.request.contextPath}/images/${fileName}" width="200px" /></p>
    <p><input type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/study/0806/test11.jsp'" class="btn btn-warning" /></p>
  </div>
</body>
</html>