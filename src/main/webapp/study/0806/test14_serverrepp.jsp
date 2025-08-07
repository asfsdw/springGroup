<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test14_server</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>서버 환경변수 값 확인</h2>
    <div>호스트 컴퓨터의 IP: <%=request.getRemoteAddr()%>/${pageContext.request.remoteAddr}</div>
    <div>전송방식: <%=request.getMethod()%></div>
    <div>접속 프로토콜: <%=request.getProtocol()%></div>
    <div>서버포트: <%=request.getServerPort()%></div>
    <div>서버이름: <%=request.getServerName()%></div>
    <div>context명: <%=request.getContextPath()%></div>
    <div>URL: <%=request.getRequestURL()%></div>
    <div>URI: <%=request.getRequestURI()%></div>
  </div>
  <p><br/></p>
</body>
</html>