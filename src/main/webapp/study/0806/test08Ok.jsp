<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobbys = request.getParameter("hobbys");
	String job = request.getParameter("job");
	String mountains = request.getParameter("mountains");
	String content = request.getParameter("content");
	String fileName = request.getParameter("fileName");
	
	hobbys.replace("/", ",");
	mountains.replace("/", ",");
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
    <p>이름: <%=name%></p>
    <p>나이: <%=age%></p>
    <p>성별: <%=gender%></p>
    <p>취미: <%=hobbys%></p>
    <p>직업: <%=job%></p>
    <p>가본 산: <%=mountains%></p>
    <p>자기소개: <%=content%></p>
    <p>파일</p>
    <p><img src="../../images/<%=fileName%>" width="200px" /></p>
    <p><input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/study/0806/test08.jsp'" class="btn btn-warning" /></p>
  </div>
</body>
</html>