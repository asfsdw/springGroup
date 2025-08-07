<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test09_img</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>정적 리소스(그림, css, js, template, font)</h2>
    <p>JSP 소스코드와는 별도로 webapp 폴더 아래 독립적으로 폴더를 만들어 관리.</p>
    <hr/>
    <div>
    	<p><img src="01.jpg" width="150px" />표시 안 됨</p>
    	<p><img src="../../images/01.jpg" width="150px" /></p>
    	<p><img src="/images/02.jpg" width="150px" /></p>	<!-- contextpath가 없다 -->
    	<p><img src="/springGroup/images/01.jpg" width="150px" /></p>
    	<p><img src="/<%=request.getContextPath()%>/images/01.jpg" width="150px" /></p>	<!-- 도메인이 사라진다 -->
    	<p><img src="<%=request.getContextPath()%>/images/06.jpg" width="150px" /></p>
	    <hr/>
    	<p>
    		<%for(int i=1; i<=7; i++) {
    			out.println("<div><img src='"+request.getContextPath()+"/images/0"+i+".jpg' width='100px' /></div>");
    		}
   			%>
    	</p>
    	<p></p>
    	<p></p>
    </div>
  </div>
  <p><br/></p>
</body>
</html>