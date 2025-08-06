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
    <p>get방식: <a href="<%=request.getContextPath()%>/j0805/Test07Ok_1?flag=3" class="btn btn-primary">Test07Ok_1 호출</a></p>
    <div>
    	<hr/>
    	<form name="yourform" method="post" action="<%=request.getContextPath()%>/j0805/Test07Ok_2">
    		<input type="hidden" name="flag" value="4" />
    		<input type="submit" value="전송(post)" class="btn btn-secondary" />
    	</form>
    </div>
  </div>
  <p><br/></p>
</body>
</html>