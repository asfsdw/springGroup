<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String[][] members = {
		{"홍길동","25","서울"},
		{"김말숙","33","청주"},
		{"이기자","19","제주"},
		{"강감찬","55","광주"},
		{"김연아","19","서울"}
	};
	pageContext.setAttribute("members", members);
	
	String[] cards = {"국민","BC","LG","현대","삼성","농협"};
	pageContext.setAttribute("cards", cards);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>ex02_jstl</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2></h2>
		<pre>
      과제
      1.구구단 5단을 출력하세요.
      2.구구단 3~5단까지 출력하시오(2중 for)
      3.members 배열의 주소가 '서울'단어에는 빨간색으로 표시해서 출력하시오.
      4.members 배열의 나이가 25세 미만은 굴고 파란색 표시.
      5.cards 배열의 내용 중, 첫 번째 카드의 배경색은 노란색,
        마지막 카드의 배경색은 하늘색으로 출력.
      6.cards 배열의 내용 중, '국민카드'는 파란색, '삼성카드'는 빨간색,
        첫 번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색으로 출력. 
		</pre>
		<hr/>
		구구단 5단<br/>
		<c:forEach var="i" begin="1" end="9">
			5 * ${i} = ${5*i}<br/>
		</c:forEach>
		<hr/>
		
		구구단 3~5단<br/>
		<div class="row border text-center">
			<c:forEach var="i" begin="3" end="5">
				<div class="col border">
					<c:forEach var="j" begin="1" end="9">
						${i} * ${j} = ${i*j}<br/>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<hr/>
		
		members 배열의 '서울' 단어를 빨간색으로 표시해서 출력.<br/>
		<c:forEach var="i" begin="0" end="${fn:length(members)-1}">
			<c:forEach var="j" begin="0" end="${fn:length(members[0])-1}">
				<c:if test="${j == 2 && fn:indexOf(members[i][2],'서울') != -1}">
					<font color="red">${members[i][j]}</font>
				</c:if>
				<c:if test="${j != 2 or fn:indexOf(members[i][2],'서울') == -1}">
					${members[i][j]}
				</c:if>
			</c:forEach>
			<br/>
		</c:forEach>
		<hr/>
		
		members의 나이가 25세 미만은 굵은 파란색으로 표시.<br/>
		<c:forEach var="i" begin="0" end="${fn:length(members)-1}">
			<c:forEach var="j" begin="0" end="${fn: length(members[0])-1}">
				<c:if test="${j == 1 && members[i][1] < 25}">
					<font color="blue"><b>${members[i][j]}</b></font>
				</c:if>
				<c:if test="${j != 1 || members[i][1] >= 25}">
					${members[i][j]}
				</c:if>
			</c:forEach>
			<br/>
		</c:forEach>
		<hr/>
		cards 배열의 내용 중,<br/>
		첫 번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색으로 출력.<br/>
		<c:forEach var="card" items="${cards}" varStatus="st">
			<c:if test="${st.first}">
				<span style="background-color:yellow;">${card}</span>
			</c:if>
			<c:if test="${st.last}">
				<span style="background-color:skyblue;">${card}</span>
			</c:if>
			<c:if test="${!st.first && !st.last}">
				${card}
			</c:if>
		</c:forEach>
		<br/>
		<hr/>
		cards 배열의 내용 중, '국민카드'는 파란색, '삼성카드'는 빨간색,<br/>
    첫 번째 카드의 배경색은 노란색, 마지막 카드의 배경색은 하늘색으로 출력. <br/>
    <c:forEach var="card" items="${cards}" varStatus="st">
			<c:if test="${st.first || card == ('국민')}">
				<span style="background-color:yellow; color:blue;">${card}</span>
			</c:if>
			<c:if test="${card == ('삼성')}">
				<span style="color:red;">${card}</span>
			</c:if>
			<c:if test="${st.last}">
				<span style="background-color:skyblue;">${card}</span>
			</c:if>
			<c:if test="${!st.first && !st.last && card != '삼성' && card != '국민'}">
				${card}
			</c:if>
		</c:forEach>
		<br/>
		<hr/>
	</div>
	<p><br/></p>
</body>
</html>