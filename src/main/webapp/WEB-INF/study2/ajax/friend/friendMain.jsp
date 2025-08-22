<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>friendMain</title>
		<script>
			'use strict';
			// 전체 회원 리스트.
			function friendList() {
				$("#demo").html("");
				
				let str = "";
				
				$.ajax({
					url : "${ctp}/study2/ajax/friend/FriendList",
					type : "GET",
					success : (res) => {
						let js = JSON.parse(res);
						// 회원이 존재하면 출력.
						if(js != null) {
							str += '<h4 class="text-center">회원 리스트</h4>';
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
							$("#demo").html(str);
						}
						// 회원이 존재하지 않으면.
						else {
							str = '회원이 없습니다.';
							$("#demo").html(str);
						}
					},
					error : () => alert("전송오류")
				});
			}
			// 회원가입용 새창 띄우기.
			function friendInput() {
				$("#demo").html("");
	      
				let url = "${ctp}/study2/ajax/friend/FriendInput";
				let x = (window.screen.width/2.2)-(500/2);
				let y = (window.screen.height/2.2)-(570/2);
				window.open(url, "회원가입", "width=500px, height=570px, left="+x+"px, top="+y+"px");
			}
			// 회원 검색용 동적폼.
			function friendSearch() {
				$("#demo").html("");
				
				let str = '<div class="input-group">';
				str += '<div class="input-group-text">검색할 아이디</div>';
				str += '<input type="text" name="mid" id="mid" value="admin" class="form-control"/>';
				str += '<input type="button" value="아이디검색" onclick="midSearch()" class="btn btn-secondary"/>';
				str += '</div>';
				str += '<hr/><div id="subDemo"></div>';
				demo.innerHTML = str;
			}
			// 실제 회원 검색.
			function midSearch() {
	    	let mid = document.getElementById("mid").value;
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch2',
	    		type : 'get',
	    		data : {mid : mid},
	    		success:function(res) {
	    			let temp = res.split("/");
	    			let str = "";
	    			str += '<form name="myform" method="post" action="${ctp}/study2/login/MidSearch">';
	    			str += '<table class="table table-hover text-center"';
	    			str += '<tr>';
	    			str += '<th>아이디</th>';
	    			str += '<td>'+temp[1]+'</td>';
	    			str += '</tr>';
	    			str += '<th>닉네임</th>';
	    			str += '<td>'+temp[2]+'</td>';
	    			str += '</tr>';
	    			str += '<th>이름</th>';
	    			str += '<td><input type="text" name="name" value="'+temp[3]+'" class="form-control text-center" /></td>';
	    			str += '</tr>';
	    			str += '<th>나이</th>';
	    			str += '<td><input type="number" name="age" value="'+temp[4]+'" class="form-control text-center"/></td>';
	    			str += '</tr>';
	    			str += '<th>성별</th>';
	    			// 성별 체크용 if문
	    			if(temp[5] == "남자") {
		    			str += '<td><input type="radio" name="gender" value="남자" checked />남자 &nbsp';
		    			str += '<input type="radio" name="gender" value="여자" />여자</td>';
	    			}
	    			else {
		    			str += '<td><input type="radio" name="gender" value="남자" />남자 &nbsp';
		    			str += '<input type="radio" name="gender" value="여자" checked />여자</td>';
	    			}
	    			str += '</tr>';
	    			str += '<th>주소</th>';
	    			str += '<td><input type="text" name="address" value="'+temp[6]+'" class="form-control text-center" /></td>';
	    			str += '</tr>';
	    			str += '</tr>';
	    			str += '<td><input type="submit" value="정보수정" class="btn btn-success"</td>';
	    			str += '<td><input type="button" value="회원삭제" onclick="midDelete()" class="btn btn-danger"</td>';
	    			str += '</tr>';
	    			str += '</table>';
	    			str += '<input type="hidden" name="mid" value="'+temp[1]+'" />';
	    			str += '</form>';
	    			subDemo.innerHTML = str;
	    		},
	    		error : function() { alert("전송오류!"); }
	    	});
	    }
			// 회원삭제.
			function midDelete() {
				let mid = document.getElementById("mid").value;
				$.ajax({
					url : "${ctp}/study2/ajax/friend/FriendDelete",
					type : "GET",
					data : {"mid" : mid},
					success : (res) => {
						if(res == "1") {
							alert("성공적으로 삭제되었습니다.");
							friendSearch();
						}
						else alert("삭제에 실패했습니다.");
					},
					error : () => alert("전송오류")
				});
			}
		</script>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">AJAX 연습(Friend)</h2>
		<p><br/></p>
		<div class="row text-center">
			<div class="col"><a href="javascript:friendList()" class="btn btn-success">전체 리스트</a></div>
			<div class="col"><a href="javascript:friendInput()" class="btn btn-primary">회원가입</a></div>
			<div class="col"><a href="javascript:friendSearch()" class="btn btn-info">개별 조회(수정, 삭제)</a></div>
			<div class="col"><a href="javascript:location.reload()" class="btn btn-warning">새로고침</a></div>
		</div>
		<hr/>
		<div id="demo"></div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>