<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test05</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원가입</h2>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/j0806/Test05">
    	<div class="mb-3">성명
    		<input type="text" id="name" name="name" value="홍길동" autofocus required class="form-control" />
    	</div>
    	<div class="mb-3">나이
    		<input type="number" id="age" name="age" value="20" required class="form-control" />
    	</div>
    	<div class="mb-3">
    		<input type="submit" value="전송(submit)" class="form-control btn btn-success" />
    	</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>