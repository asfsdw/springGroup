<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="vo" class="study.j0806.Test15VO" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp" />
    <title>test15Ok_1</title>
    <%-- <jsp:setProperty property="name" name="vo" />
    <jsp:setProperty property="hakbun" name="vo" />
    <jsp:setProperty property="kor" name="vo" />
    <jsp:setProperty property="eng" name="vo" />
    <jsp:setProperty property="mat" name="vo" />
    <jsp:setProperty property="sci" name="vo" />
    <jsp:setProperty property="soc" name="vo" />
    <jsp:setProperty property="hostIp" name="vo" /> --%>
    <jsp:setProperty property="*" name="vo"/>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>vo에 담겨있는 값들</h2>
    <p>이름: <jsp:getProperty property="name" name="vo" /></p>
    <p>학번: <jsp:getProperty property="hakbun" name="vo" /></p>
    <p>국어: <jsp:getProperty property="kor" name="vo" /></p>
    <p>영어: <jsp:getProperty property="eng" name="vo" /></p>
    <p>수학: <jsp:getProperty property="mat" name="vo" /></p>
    <p>과학: <jsp:getProperty property="sci" name="vo" /></p>
    <p>사회: <jsp:getProperty property="soc" name="vo" /></p>
    <p>사용자IP: <jsp:getProperty property="hostIp" name="vo" /></p>
    <hr/>
    <div><a href="test15_main.jsp" class="btn btn-primary">돌아가기</a></div>
  </div>
  <p><br/></p>
</body>
</html>