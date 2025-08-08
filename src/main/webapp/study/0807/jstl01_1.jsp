<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp" />
    <title>jstl01_1</title>
		<script>
			'use strict';
	
			let cnt = 0;
			let member = new Array();
	
			function fCheck() {
				let name = $('#name').val();
				let age = $('#age').val();
				let gender = myform.gender.value;
				let job = $('#job').val();
				let str = name + "/" + age + "/" + gender + "/" + job;
				member[cnt] = str;
		
				let ans = confirm("값을 전송할까요?");
				if(ans) {
					location.href = "${pageContext.request.contextPath}/j0807/JSTLtest1_2?member="+member;
				}
		
				cnt++;
			}
		</script>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>JSTL(Java Standard Tag Library)</h2>
    <table class="table table-bordered">
	    <tr>
	    	<th>Library</th>
	    	<th>주소(URL)</th>
	    	<th>접두어</th>
	    	<th>기본문법</th>
	    </tr>
	    <tr>
	    	<td>Core</td>
	    	<td>http://java.sun.com/jsp/jstl/core</td>
	    	<td>c</td>
	    	<td>< 태그명 ></td>
	    </tr>
	    <tr>
	    	<td>Function</td>
	    	<td>http://java.sun.com/jsp/jstl/functions</td>
	    	<td>fn</td>
	    	<td>$ { fn:태그명 }</td>
	    </tr>
	    <tr>
	    	<td>Formatting</td>
	    	<td>http://java.sun.com/jsp/jstl/fmt</td>
	    	<td>fmt</td>
	    	<td>< fmt:태그명 ></td>
	    </tr>
	    <tr>
	    	<td>SQL</td>
	    	<td>http://java.sun.com/jsp/jstl/sql</td>
	    	<td>sql</td>
	    	<td>< sql:태그명 ></td>
	    </tr>
    </table>
    <hr/>
    
    <div>
    	JSTL 다운로드 주소: <a href="https://archive.apache.org/dist/jakarta/taglibs/standard/binaries/jakarta-taglibs-standard-1.1.2.zip">다운로드</a><br/>
    	lib폴더 안에 jstl.jar, standard.jar를 WEB-INF/lib 안에 넣어준다.<br/>
	    <hr/>
    	정의된 라이브러리를 사용할 경우에는 jsp지시자 중, 'taglib'를 이용해 먼저 선언 후, 사용(2번 Line 참조).<br/>
    </div>
    <hr/>
    
    <h2>Core Library 사용예</h2>
  	<h4>용도: 변수제어(선언, 값할당, 객체, 출력, 제거)</h4>
    <pre>
    	변수선언: < c : set var = "변수명" value = "값">< /c : set >
    	변수출력: < c : out value = "값, 변수, 수식" />
    	변수제거: < c : remove var = "변수명" />
    </pre>
    <hr/>
    
    su1 변수를 선언 후, 초기값으로 100을 할당.
    <c:set var="su1" value="100" /><br/>
    su1 변수값 출력1<br/>
    <c:out value="su1: ${su1}" /><br/>
    su1 변수값 출력2<br/>
    su1: ${su1}<br/>
    su1 변수 제거<br/>
    <c:remove var="su1" />
    su1 변수값 출력3<br/>
    su1: ${su1}<br/>
    <%String name = "홍길동";%>
    성명1: <%=name%><br/>
    <%pageContext.setAttribute("name", "김말숙");%>
    성명2: ${name}<br/>
    <hr/>
    
		<h4>JSTL 제어문(조건문(if), 반복문(forEach))</h4>
		<p>사용법: < c : if test="${조건식}">조건식에 따른 처리내용< / c : if></p>
		<p>단점: else문이 없다. 숫자비교를 문자처럼 비교한다(300<40).</p>
		<p>사용예1: su1=300, su2=400</p>
		<c:set var="su3" value="300" />
		<c:set var="su4" value="40" />
		<div>1.su3 == su4 : <c:if test="${su3 == su4+'0'}">su3과 su4는 같다.</c:if></div>
		<div>2.su3 != su4 : <c:if test="${su3 != su4+'0'}">su3과 su4는 다르다.</c:if></div>
		<div>3.su3 > su4 : <c:if test="${su3 > su4}">su3이 su4보다 크다.</c:if></div>
		<div>4.su3 <= su4 : <c:if test="${su3 <= su4}">su3이 su4보다 작거나 같다.</c:if></div>
		<div>5.su3 < su4 : <c:if test="${su3 < su4+'0'}">su4가 su3보다 크다.</c:if></div>
		<div>6.su3 >= su4 : <c:if test="${su3 >= su4+'0'}">su4가 su3보다 작거나 같다.</c:if></div>
		<div>7.su3 gt su4: <c:if test="${su3 gt su4+'0'}">su3이 su4보다 크다.</c:if> </div>
		<div>8.su3 le su4: <c:if test="${su3 le su4+'0'}">su3이 su4보다 작거나 같다.</c:if> </div>
		<div>9.su3 ge su4: <c:if test="${su3 ge su4+'0'}">su3이 su4보다 크거나 같다.</c:if> </div>
		<div>10.su3 lt su4: <c:if test="${su3 lt su4+'0'}">su3이 su4보다 작다.</c:if> </div>
    <hr/>
    
		<h4>다중조건비교: choose ~when ~otherwise</h4>
		<pre>
    	사용법
    	< c : choose >
	    	< c : when test = "조건식1" > 처리할 내용1 < / c : when >
	    	< c : when test = "조건식2" > 처리할 내용2 < / c : when >
	    	< c : when test = "조건식3" > 처리할 내용3 < / c : when >
	    	< c : otherwise > 기타 처리할 내용 < / otherwise >
    	< / c : choose>
		</pre>
		<c:set var="score" value="85" />
		<div>점수가 85점인 학생의 학점:
			<c:choose>
				<c:when test="${score >= 90}">A</c:when>
				<c:when test="${score >= 80}">B</c:when>
				<c:when test="${score >= 70}">C</c:when>
				<c:when test="${score >= 60}">D</c:when>
				<c:otherwise>F</c:otherwise>
			</c:choose>
		</div>
		<hr/>
		
		<h4>반복문: forEach</h4>
		<%for(int i=1; i<=10; i++) {%>
				값1: <%=i%>/
		<%}%>
		<br/>
		
		<c:forEach var="i" begin="1" end="10">
			값2: ${i}/
		</c:forEach>
		<br/>
		
		<%String[] cards = {"국민","BC","LG","현대","삼성","농협"};
		for(String card : cards) {
			out.println(card+"/");
		}
		pageContext.setAttribute("cards", cards);%>
		<br/>
		
		<c:forEach var="card" items="${cards}">
			${card}/
		</c:forEach>
		<br/>
		
		<c:set var="cards2" value="국민/BC/LG/현대/삼성/농협" />
		${cards2}<br/>
		<c:forTokens var="card" items="${cards2}" delims="/">${card}:</c:forTokens>
		<br/>
		<hr/>
		
		<h4>상태변수 사용(varStatus)</h4>
		<pre>
			예약어: index, count, current, first, last
		</pre>
		
		<c:forEach var="card" items="${cards}" varStatus="st">
			${st.index} / ${st.count} : ${st.current} : ${st.first} : ${st.last}<br>
		</c:forEach>
		<br/>
		
		<c:forEach var="card" items="${cards2}" varStatus="st">
			${st.index} / ${st.count} : ${st.current} : ${st.first} : ${st.last}<br>
		</c:forEach>
		<hr/>
		
		<h4>images폴더에 저장된 그림 5장을 출력하시오.</h4>
		<c:forEach var="i" begin="1" end="5">
			<img src="${pageContext.request.contextPath}/images/0${i}.jpg" width=100px height=80px />
		</c:forEach>
		<hr/>
		
		<c:set var="images" value="01,02,03,04,05" />
		<c:forTokens var="image" items="${images}" delims=",">
			<img src="${pageContext.request.contextPath}/images/${image}.jpg" width=100px height=80px />
		</c:forTokens>
		<hr/>
		
		<c:forTokens var="image" items="${images}" delims="," varStatus="st">
			<img src="${pageContext.request.contextPath}/images/${image}.jpg" width=100px height=80px />
			<c:if test="${st.count %2 == 0}"><br/></c:if>
		</c:forTokens>
		<%
			String[][] members = {
					{"홍길동","25","서울"},
					{"김말숙","33","청주"},
					{"이기자","19","제주"},
					{"강감찬","55","광주"},
					{"김연아","19","서울"}
			};
			pageContext.setAttribute("members", members);
		%>
		<hr/>
		
		<c:forEach var="member" items="${members}">
			<c:forEach var="m" items="${member}">
				${m}/
			</c:forEach>
			<br/>
		</c:forEach>
		<hr/>
		<div class="border p-3">
			<form name="myform" method="post" action="${pageContext.request.contextPath}/j0807/JSTLtest1_1">
				<div>성명
					<input type="text" id="name" name="name" value="이기자" class="form-control" />
				</div>
				<div>나이
					<input type="number" id="age" name="age" value="22" class="form-control" />
				</div>
				<div>성별
					<input type="radio" name="gender" value="남자" class="me-1" />남자 &nbsp;
					<input type="radio" name="gender" value="여자" class="me-1" checked />여자
				</div>
				<div class="mb-3">직업
					<select id="job" name="job" class="form-control">
						<option value="">선택</option>
						<option>회사원</option>
						<option>공무원</option>
						<option>군인</option>
						<option>의사</option>
						<option>자영업</option>
						<option>가사</option>
					</select>
				</div>
				<div>
					<input type="submit" value="전송1" class="btn btn-success" />
					<input type="button" value="전송2" onclick="fCheck()" class="btn btn-primary" />
				</div>
				<hr/>
			</form>
		</div>
		<div id="demo">
			성명: ${vo.name}<br/>
			나이: ${vo.age}<br/>
			성별: ${vo.gender}<br/>
			직업: ${vo.job}<br/>
		</div>
		<hr/>
		<table class="table table-hover">
			<tr class="table-secondary">
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>직업</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<th>${st.count}</th>
					<th>${vo.name}</th>
					<th>${vo.age}</th>
					<th>${vo.gender}</th>
					<th>${vo.job}</th>
				</tr>
			</c:forEach>
		</table>
		<hr/>
		6.URL이동: 자바스크립트(location.href=""; JSTL(redirect url)
		바로 이동한다.
		<%-- <c:redirect url="https://www.naver.com">
			<c:param name="name" value="홍길동"></c:param>
		</c:redirect> --%>
  </div>
  <p><br/></p>
</body>
</html>