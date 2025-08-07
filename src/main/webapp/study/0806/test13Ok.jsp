<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String buseo = request.getParameter("buseo");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test13Ok</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>중간 경유지입니다.</h2>
    <p>forward == dispatch.forward(request, response)</p>
    <p>jsp: == 액션태그 == < jsp:명령어></ jsp:명령어></p>
    <%if(mid.equals("admin") || mid.equals("hkd1234") || mid.equals("kms1234") && pwd.equals("1234")) {%>
    <jsp:forward page="test13Res.jsp">
    	<jsp:param name="mid" value="<%=mid%>" />
    	<jsp:param name="buseo" value="<%=buseo%>" />
    </jsp:forward>
    <%} else {%>
    <script>
    	alert("로그인 실패");
    	location.href = "test13.jsp";
    </script>
    <%}%>
  </div>
  <p><br/></p>
</body>
</html>