<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>get, post</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>전송방식(get, post)</h2>
    <p>get방식1: <a href="/springGroup/j0805/Test05_1?flag=1" class="btn btn-success">Test5_1 호출</a></p>
    <p>get방식2: <a href="<%=request.getContextPath() %>/j0805/Test05_2?flag=2" class="btn btn-primary">Test5_2 호출</a></p>
    <div>
    	<form name="myform" method="post" action="test05Ok.jsp">
    		<input type="submit" value="전송(post)" class="btn btn-info" />
    	</form>
    	<hr/>
    	<form name="yourform" method="post" action="<%=request.getContextPath()%>/j0805/test05Ok">
    		<!-- <input type="text" name="flag" value="3" /> -->
    		<input type="hidden" name="flag" value="3" />
    		<input type="submit" value="전송(post)" class="btn btn-secondary" />
    	</form>
    </div>
  </div>
  <p><br/></p>
</body>
</html>