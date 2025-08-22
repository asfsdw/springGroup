<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>main2</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container text-center">
    <h2>길동이네 집에 오신 것을 환영합니다.</h2>
    <hr/>
    <div>
    	<img src="images/03.jpg" width="400px" />
    </div>
    <hr/>
    <p>
    	<a href="${ctp}/study2/TestMenu" class="btn btn-success">테스트 메뉴로 이동</a>
    </p>
  </div>
  <p><br/></p>
</body>
</html>