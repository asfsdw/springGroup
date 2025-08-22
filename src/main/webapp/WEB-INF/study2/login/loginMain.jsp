<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>main</title>
		<script>
			'use strict'
			
			function logOut() {
				let ans = confirm("로그아웃하시겠습니까?");
				if(ans) {
					// location.href = "${ctp}/study2/login/Login"; // 원래는 로그아웃 서블렛으로 보내, 셋션 등, 정보들 삭제시킨 후, 로그아웃해야한다.
					location.href = "${ctp}/study2/login/Logout";
				}
			}
			/* function loginList2() {
				$.ajax({
					url : "${ctp}/study2/login/LoginList2",
					type : "GET",
					success : (res) => {
						console.log(res);
						$("#demo").html(res);
						
						let js = JSON.parse(res);
						console.log(js);
						
						let tMid = "아이디: ", tNickName = "닉네임: ", tName = "이름: ", tAge = "나이: ", tGender = "성별: ", tAddress = "주소: ";
						for(let j of js) {
							tMid += j.mid+"/";
							tNickName += j.nickName+"/";
							tName += j.name+"/";
							tAge += j.age+"/";
							tGender += j.gender+"/";
							tAddress += j.address+"/";
						}
						let str = tMid + "<br/>";
						str += tNickName + "<br/>";
						str += tName + "<br/>";
						str += tAge + "<br/>";
						str += tGender + "<br/>";
						str += tAddress + "<br/>";
						
						$("#demo2").html(str);
					},
					error : () => alert("전송오류")
				});
			} */
			function loginList2() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
				$.ajax({
					url : "${ctp}/study2/login/LoginList2",
					type : "GET",
					success : (res) => {
						$("#demo").html(res);
						
						let js = JSON.parse(res);
						
						let tMid = "", tNickName = "", tName = "", tAge = "", tGender = "", tAddress = "";
						for(let j of js) {
							tMid += j.mid+"/";
							tNickName += j.nickName+"/";
							tName += j.name+"/";
							tAge += j.age+"/";
							tGender += j.gender+"/";
							tAddress += j.address+"/";
						}
						let str = tMid + "<br/>";
						str += tNickName + "<br/>";
						str += tName + "<br/>";
						str += tAge + "<br/>";
						str += tGender + "<br/>";
						str += tAddress + "<br/>";
						
						$("#demo2").html(str);
						
						str = '<h4 class="text-center">회원 리스트</h4>';
						str += '<table class="table table-hover text-center">';
						str += '<tr class="table-secondary">';
						str += '<th>아이디</th>';
						str += '<th>닉네임</th>';
						str += '<th>이름</th>';
						str += '<th>나이</th>';
						str += '<th>성별</th>';
						str += '<th>주소</th>';
						str += '</tr>';
						for(let j of js) {
							str += '<tr>';
							str += '<td>'+j.mid+'</td>';
							str += '<td>'+j.nickName+'</td>';
							str += '<td>'+j.name+'</td>';
							str += '<td>'+j.age+'</td>';
							str += '<td>'+j.gender+'</td>';
							str += '<td>'+j.address+'</td>';
							str += '</tr>';
						}
						str += '</table>';
						$("#demo3").html(str);
					},
					error : () => alert("전송오류")
				});
			}
			function loginList3() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
				$.ajax({
					url : "${ctp}/study2/login/LoginList3",
					type : "GET",
					success : (res) => {
						$("#demo").html(res);
						
						let js = JSON.parse(res);
						
						let tMid = "", tNickName = "", tName = "", tAge = "", tGender = "", tAddress = "";
						for(let j of js) {
							tMid += j.mid+"/";
							tNickName += j.nickName+"/";
							tName += j.name+"/";
							tAge += j.age+"/";
							tGender += j.gender+"/";
							tAddress += j.address+"/";
						}
						let str = tMid + "<br/>";
						str += tNickName + "<br/>";
						str += tName + "<br/>";
						str += tAge + "<br/>";
						str += tGender + "<br/>";
						str += tAddress + "<br/>";
						
						$("#demo2").html(str);
						
						str = '<h4 class="text-center">회원 리스트</h4>';
						str += '<table class="table table-hover text-center">';
						str += '<tr class="table-secondary">';
						str += '<th>아이디</th>';
						str += '<th>닉네임</th>';
						str += '<th>이름</th>';
						str += '<th>나이</th>';
						str += '<th>성별</th>';
						str += '<th>주소</th>';
						str += '</tr>';
						for(let j of js) {
							str += '<tr>';
							str += '<td>'+j.mid+'</td>';
							str += '<td>'+j.nickName+'</td>';
							str += '<td>'+j.name+'</td>';
							str += '<td>'+j.age+'</td>';
							str += '<td>'+j.gender+'</td>';
							str += '<td>'+j.address+'</td>';
							str += '</tr>';
						}
						str += '</table>';
						$("#demo3").html(str);
					},
					error : () => alert("전송오류")
				});
			}
			function loginList4() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
				$.ajax({
					url : "${ctp}/study2/login/LoginList4",
					type : "GET",
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
			function loginSearch1() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
				$.ajax({
					url : "${ctp}/study2/login/LoginSearch1",
					type : "GET",
					data : {"mid" : "admin"},
					success : (res) => $("#demo").html(res),
					error : () => alert("전송오류")
				});
			}
			// 검색 폼 생성.
			function loginSearch2() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
	    	let str = '<div class="input-group">';
	    	str += '<div class="input-group-text">검색할 아이디</div>';
	    	str += '<input type="text" name="mid" id="mid" value="admin" class="form-control"/>';
	    	str += '<input type="button" value="아이디검색" onclick="midSearch()" class="btn btn-secondary"/>';
	    	str += '</div>';
	    	str += '<hr/><div id="subDemo"></div>';
	    	demo.innerHTML = str;
	    }
			// 생성한 폼에서 검색을 클릭했을 때, 실행하는 실제 회원 검색.
			function midSearch() {
	    	let mid = document.getElementById("mid").value;
	    	
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch1',
	    		type : 'get',
	    		data : {mid : mid},
	    		success:function(res) {
	    			subDemo.innerHTML = res;
	    		},
	    		error : function() { alert("전송오류!"); }
	    	});
	    	
	    	subDemo = str;
	    }
			// 수정하기 위한 폼 생성.
			function updateCheck() {
				$("#demo").html("");
				$("#demo2").html("");
				$("#demo3").html("");
	    	let mid = prompt("갱신할 아이디를 입력하세요!");
	    	if(mid.trim() == "") {
	    		alert("갱신할 아이디를 입력하셔야 합니다. 다시 시도해 주세요.");
	    		return false;
	    	}
	    	
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch2',
	    		type : 'get',
	    		data : {mid : mid},
	    		success:function(res) {
	    			if(res.indexOf("/") != -1) {
	    				let temp = res.split("/");
	    				let str = "";
	    				str += '<form name="myform" method="post" action="${ctp}/study2/login/LoginSearch2Ok">';
	    				str += '<table class="table table-borderd">';
	    				str += '<tr>';
	    				str += '<th>아이디</th>';
	    				str += '<td>'+temp[1]+'</td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<th>닉네임</th>';
	    				str += '<td>'+temp[2]+'</td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<th>성명</th>';
	    				str += '<td><input type="text" name="name" value='+temp[3]+' class="form-contol" /></td>';
	    				str += '</tr>';
	    				str += '<th>나이</th>';
	    				str += '<td><input type="number" name="age" value='+temp[4]+' class="form-contol" /></td>';
	    				str += '</tr>';
	    				str += '<th>성별</th>';
	    				str += '<td><input type="radio" name="gender" value="남자" />남자 ';
	    				str += '<input type="radio" name="gender" value="여자" />여자</td>';
	    				str += '</tr>';
	    				str += '<th>주소</th>';
	    				str += '<td><input type="text" name="address" value='+temp[6]+' class="form-contol" /></td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<td colspan="2" class="text-center"><input type="submit" value="정보수정" class="btn btn-primary" /></td>';
	    				str += '</tr>';
	    				str += '</table>';
	    				str += '<input type="hidden" name="idx" value="'+temp[0]+'" />';
	    				str += '<input type="hidden" name="mid" value="'+temp[1]+'" />';
	    				str += '</form>';
		    			demo.innerHTML = str;
	    			}
	    		},
	    		error : function() { alert('전송오류!'); }
	    	});
	    }
		</script>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회원전용방</h2>
		<hr/>
		<div class="row text-center">
			<div class="col"><a href="LoginList" class="btn btn-dark btn-sm">회원리스트 비동기식</a></div>
			<div class="col"><a href="javascript:loginList2()" class="btn btn-success btn-sm">회원리스트 동기식(연습)</a></div>
			<div class="col"><a href="javascript:loginList3()" class="btn btn-success btn-sm">회원리스트 동기식</a></div>
			<div class="col"><a href="javascript:loginList4()" class="btn btn-success btn-sm">회원리스트 vector</a></div>
			<div class="col"><a href="javascript:loginSearch1()" class="btn btn-primary btn-sm">회원검색(admin)</a></div>
			<div class="col"><a href="javascript:loginSearch2()" class="btn btn-primary btn-sm">회원검색(동적form)</a></div> <!-- 아이디를 입력해주세요 -->
			<div class="col"><a href="javascript:updateCheck()" class="btn btn-info btn-sm">회원수정</a></div>
			<div class="col"><a href="javascript:location.reload()" class="btn btn-warning btn-sm">새로고침</a></div>
			<div class="col"><a href="${ctp}/study2/TestMenu" class="btn btn-warning btn-sm">돌아가기</a></div>
		</div>
		<hr/>
		<div>이곳은 회원전용 서비스 구역입니다.</div>
		<hr/>
		<div>현재 로그인 중인 사용자.
			<p>${sMid} / ${sNickName}</p>
		</div>
		<hr/>
		<div id="demo"></div>
		<hr/>
		<div id="demo2"></div>
		<hr/>
		<div id="demo3"></div>
		<hr/>
		<div class="text-center">
			<button type="button" onclick="logOut()" class="btn btn-warning">로그아웃</button>
		</div>
	</div>
	<p><br/></p>
</body>
</html>