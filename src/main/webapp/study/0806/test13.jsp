<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test13</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>로그인</h2>
    <form name="myform" method="post" action="test13Ok.jsp">
    	<div class="mb-3">아이디
    		<input type="text" id="mid" name="mid" value="hkd1234" autofocus required class="form-control" />
    	</div>
    	<div class="mb-3">비밀번호
    		<input type="password" id="pwd" name="pwd" value="1234" required class="form-control" />
    	</div>
    	<div class="mb-3">부서명
    		<select name="buseo">
    			<option value="1">인사과</option>
    			<option value="2">영업과</option>
    			<option value="3">총무과</option>
    		</select>
    	</div>
    	<div class="mb-3">
    		<input type="submit" value="로그인" class="form-control btn btn-success" />
    	</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>