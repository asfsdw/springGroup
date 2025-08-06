<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test03</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	'use strict';
    	
    	function fCheck() {
    		let name = $("#name").val();
    		let age = $("#age").val();
    		let regName = /^[가-힣]+$/;
    		let regAge = /^[0-9]+$/;
    		
    		if(!regName.test(name)) alert("이름은 한글로 한 글자 이상 입력해주세요.");
    		else if(!regAge.test(age)) alert("나이는 숫자로 입력해주세요.");
    		else myform.submit();
    	}
    </script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>회원가입</h2>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/j0806/Test03">
    	<div class="mb-3">성명
    		<input type="text" id="name" name="name" value="홍길동" autofocus required class="form-control" />
    	</div>
    	<div class="mb-3">나이
    		<input type="number" id="age" name="age" value="20" required class="form-control" />
    	</div>
    	<div class="mb-3">
    		<input type="button" value="전송(post)" onclick="fCheck()" class="form-control btn btn-success" />
    	</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>