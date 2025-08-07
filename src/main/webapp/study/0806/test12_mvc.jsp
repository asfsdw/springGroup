<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String reg = request.getParameter("reg") == null ? "" : request.getParameter("reg");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test12_mvc</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	'use strict';
    	let cnt1 = 0, cnt2 = 0;
    	let reg = "";
    	
    	if("<%=reg%>" == "fail") alert("회원가입에 실패했습니다.");
    	
    	function fCheck() {
    		let name = $("#name").val();
    		let age = $("#age").val();
    		let regName = /^[가-힣]{2,10}$/;
    		let regAge = /^[0-9]+$/;
    		// 취미 선택 걸러내기
    		for(let i=0; i<document.getElementsByName("hobby").length; i++) {
    			if(document.getElementsByName("hobby")[i].checked) cnt1++;
    		}
    		// 가본 산 선택 걸러내기
    		for(let i=0; i<document.getElementsByName("mountain")[0].options.length; i++) {
    			if(document.getElementsByName("mountain")[0].options[i].selected) cnt2++;
    		}
    		
    		if(!regName.test(name)) {
    			alert("이름을 확인해주세요.");
    			return false;
    		}
    		else if(!regAge.test(age)) {
    			alert("나이를 확인해주세요.");
    			return false;
    		}
    		else if(cnt1 == 0) {
    			alert("취미를 한 개 이상 선택해주세요.");
    			return false;
    		}
    		else if(document.getElementsByName("job")[0].value == "") {
    			alert("직업을 선택해주세요.");
    			return false;
    		}
    		else if(cnt2 == 0) {
    			alert("가본 산을 한 개 이상 선택해주세요.");
    			return false;
    		}
    		// textarea는 배열취급인듯...?
    		else if(document.getElementsByName("content")[0].value == "") {
    			alert("자기소개를 한 글자 이상 써주세요.");
    			return false;
    		}
    		// 파일도 여러개 선택 가능하기 때문에 배열 취급인듯...?
    		else if(document.getElementsByName("fileName")[0].files.length <= 0) {
    			alert("파일을 업로드해주세요.");
    			return false;
    		}
    		else myform.submit();
    	}
    	
    </script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>값 전송 연습</h2>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/j0806/Test12">
    	<div class="mb-3">성명
	  	  <input type="text" id="name" name="name" value="홍길동" class="form-control mb-3" autofocus required />
	  	</div>
	  	<div class="mb-3">나이
	  	  <input type="number" id="age" name="age" value="20" class="form-control mb-3" />
	  	</div>
	  	<div class="mb-3">성별 &nbsp;&nbsp;
	  	  <input type="radio" name="gender" value="남자" class="me-1" />남자 &nbsp;
	  	  <input type="radio" name="gender" value="여자" class="me-1" checked />여자
	  	</div>
	  	<div class="mb-3"> 취미 &nbsp;&nbsp;
	  	  <input type="checkbox" name="hobby" value="등산" class="me-1" />등산 &nbsp;
	  	  <input type="checkbox" name="hobby" value="낚시" class="me-1" />낚시 &nbsp;
	  	  <input type="checkbox" name="hobby" value="바둑" class="me-1" />바둑 &nbsp;
	  	  <input type="checkbox" name="hobby" value="수영" class="me-1" />수영 &nbsp;
	  	  <input type="checkbox" name="hobby" value="배드민턴" class="me-1" />배드민턴 &nbsp;
	  	  <input type="checkbox" name="hobby" value="바이크" class="me-1" />바이크 &nbsp;
	  	  <input type="checkbox" name="hobby" value="기타" class="me-1" />기타
	  	</div>
	  	<div class="mb-3">직업
	  	  <select name="job" class="form-control">
	  	    <option value="">선택</option>
	  	    <option>회사원</option>
	  	    <option>공무원</option>
	  	    <option>군인</option>
	  	    <option>의사</option>
	  	    <option>자영업</option>
	  	    <option>가사</option>
	  	  </select>
	  	</div>
	  	<div class="mb-3">가본 산
	  	  <select name="mountain" size="5" multiple class="form-control">
	  	    <option>백두산</option>
	  	    <option>한라산</option>
	  	    <option>태백산</option>
	  	    <option>소백산</option>
	  	    <option>금강산</option>
	  	    <option>우암산</option>
	  	    <option>속리산</option>
	  	    <option>대둔산</option>
	  	  </select>
	  	</div>
	  	<div class="mb-3">자기소개
	  	  <textarea rows="6" name="content" class="form-control"></textarea>
	  	</div>
	  	<div class="mb-3">첨부파일
	  	  <input type="file" name="fileName" class="form-control"/>
	  	</div>
	  	<div class="row">
	  	  <div class="col"><input type="button" value="전송(button)" onclick="fCheck()" class="btn btn-success"/></div>
	  	  <div class="col text-end"><input type="reset" value="다시입력" class="btn btn-warning"/></div>
  		</div>
    </form>
  </div>
  <p><br/></p>
</body>
</html>