<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>ajaxMenu</title>
		<script>
			'use strict';
			
			function idCheck() {
				let mid = myform.mid.value.trim();
				location.href = "${ctp}/study2/ajax/IdCheck1?mid="+mid;
			}
			function idCheck2() {
				let mid = myform.mid.value.trim();

				let xhr = new XMLHttpRequest();
				xhr.open("GET", "${ctp}/study2/ajax/IdCheck2?mid="+mid);
				xhr.send();
				
				xhr.onreadystatechange = function() {
					if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
						document.getElementById("demo").innerHTML = xhr.responseText;
					}
					else {
						document.getElementById("demo").innerHTML = "전송오류.";
					}
				}
			}
			function idCheck3() {
				let mid = myform.mid.value.trim();
				fetch("${ctp}/study2/ajax/IdCheck2?mid="+mid)
					.then((res) => res.text())
					.then((res) => document.getElementById("demo").innerHTML = res)
					.catch((error) => document.getElementById("demo").innerHTML = "전송오류.");
			}
			function idCheck4() {
				let mid = myform.mid.value.trim();
				$.ajax({
					url : "${ctp}/study2/ajax/IdCheck2",
					type : "GET",
					data : {"mid" : mid},
					// dataType : "json" // 기본 설정이기 때문에 생략 가능.
					// contextType : "application/json" // json이 기본 설정이기 때문에 생략 가능.
					// charset : "utf-8" // 기본 설정이기 때문에 생략 가능.
					timeout : 10000, // 기본 3분. 초단위.
					beforeSend : () => console.log("처리전"), // 위에 alert쓰는 거랑 다를 게 없어서 둘 중 하나만 쓴다.
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류"),
					complete : () => console.log("처리 후") // 아래에 alert쓰는 거랑 다를 게 없어서 둘 중 하나만 쓴다.
				});
			}
			function idCheck5() {
				let mid = myform.mid.value.trim();
				if(mid == "") {
					alert("아이디를 입력하세요.");
					return false;
				}
				let query = {
						mid : mid
				}
				
				$.ajax({
					url : "${ctp}/study2/ajax/IdCheck5",
					type : "GET",
					data : query,
					success : (res) => {
						let str = "닉네임: <font color='red'>"+res+"</font>";
						$("#demo").html(str);
					},
					error : () => alert("전송오류")
				});
			}
		</script>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">AJAX 연습.</h2>
		<p><br/></p>
		<form name="myform">
			<div class="input-goup">
				<div class="input-group-text">아이디</div>
				<input type="text" name="mid" id="mid" value="admin" class="form-control" />
			</div>
			<hr/>
			<div class="text-center">
				<input type="button" value="동기식" onclick="idCheck()" class="btn btn-success me-2" />
				<input type="button" value="비동기식(XML)" onclick="idCheck2()" class="btn btn-primary me-2" />
				<input type="button" value="비동기식(fetch)" onclick="idCheck3()" class="btn btn-info me-2" />
				<input type="button" value="비동기식(AJAX1)" onclick="idCheck4()" class="btn btn-secondary me-2" />
				<input type="button" value="비동기식(AJAX2)" onclick="idCheck5()" class="btn btn-success me-2" />
			</div>
		</form>
		<hr/>
		<div id="demo"></div>
		<hr/>
	</div>
	<p><br/></p>
	<h2 class="text-center">HTTP통신</h2>
	<p><br/></p>
	<pre>
	# 동기식
	## 먼저 시작된 프로세스(작업)의 처리가 끝날 때까지 다른 작업들은 시작하지 않고 기다렸다가
	   앞의 작업이 모두 끝난 후, 새로운 작업을 시작하는 방식.
	# 비동기식
	## 먼저 시작된 프로세스(작업)의 수행완료 여부와 관계없이 새로운 작업을 시작하는 방식.
	
	# 프론트 프로그램에서의 비동기식
	## 바닐라 자바스크립트의 비동기식
	### 브라우저의 XMLHttpRequest
	## ECMA6 자바스크립트의 비동기식
	### 콜백함수(setTime...등), Promise, promise를 활용한 async/await, fetch()
	
	# AJAX
	## Asynchronous Javascript And XML
	## 자바스크립트 라이브러리 중 하나이며, 브라우저객체인 XMLHttpRequest를 이용해,
	   전체 페이지를 고치지 않아도 부분적인 페이지의 일부만을 처리할 수 있도록 해주는 기술.
	## 자바스크립트를 이용해 서버에 데이터를 요청할 때, 비동기식으로 통신하게 해주는 방식.
	## 과거에는 SML방식을 많이 사용했으나, 프로그램 로직과 헤더의 변수를 사용하는 복잡한 방식이었기 때문에
	   지금은 JSON방식을 많이 사용할 수 있는 AJAX방식을 많이 사용하고 있다.
	   
	# AJAX의 전송방식(method)
	## GET: 데이터를 읽거나 검색할 때 사용.
	## POST: 새로운 리소스를 생성할 때 사용.
	## PUT: 변경된 리소스를 생성, 갱신할 때 사용.
	## DELETE: 지정된 리소스를 삭제할 때 사용.
	</pre>
</body>
</html>