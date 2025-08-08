<%@page import="study.j0806.Test12VO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String str = "Welcome to My Homepage!!!";
	pageContext.setAttribute("str", str);
	
	String[] hobbys = {"등산","낚시","수영","독서","바둑","승마","바이크","수집","영화감상"};
	pageContext.setAttribute("hobbys", hobbys);
	
	ArrayList<Test12VO> vos = new ArrayList<Test12VO>();
	Test12VO vo = null;
	
	vo = new Test12VO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	pageContext.setAttribute("vo", vo);
	
	vo = new Test12VO();
	vo.setName("김말숙");
	vo.setAge(33);
	vo.setGender("여자");
	vo.setJob("회사원");
	vo.setAddress("청주");
	vos.add(vo);
	
	vo = new Test12VO();
	vo.setName("이기자");
	vo.setAge(30);
	vo.setGender("남자");
	vo.setJob("공무원");
	vo.setAddress("제주");
	vos.add(vo);
	
	vo = new Test12VO();
	vo.setName("소나무");
	vo.setAge(53);
	vo.setGender("여자");
	vo.setJob("군인");
	vo.setAddress("인천");
	vos.add(vo);
	
	vo = new Test12VO();
	vo.setName("고인돌");
	vo.setAge(13);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/include/bs5.jsp" />
		<title>jstl01_2</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>JSTL Function</h2>
		<div>
			str 변수값: ${str}<br/>
			1.str 길이: ${str.length()} / ${fn:length(str)}<br/>
			2.vos 길이: ${vos.size()} / ${fn:length(vos)}<br/>
			3.대문자로 변경: ${str.toUpperCase()} / ${fn:toUpperCase(str)}<br/>
			4.소문자로 변경: ${str.toLowerCase()} / ${fn:toLowerCase(str)}<br/>
			5-1.문자열 추출: ${str.substring(0,5)} / ${fn:substring(str,0,5)}<br/>
			5-2.문자열 추출: ${str.substring(5)} / ${fn:substring(str,5,-1)}<br/>
			6-1.문자(열) 검색: ${str.indexOf("o")} / ${fn:indexOf(str,"o")}<br/>
			6-2.문자(열) 검색: ${str.lastIndexOf("o")} / indexOf는 두 개 까지 설정할 수 있기 때문에 -1로 찾을 수 없다.<br/>
			6-3.str 변수값 중, 'o' 문자가 들어있는 모든 위치:
			<c:set var="cnt" value="0" />
			<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
				<c:if test="${fn:substring(str,i,i+1) == 'o'}">
					<c:set var="cnt" value="${cnt+1}" />
					${i}번째 값: ${fn:substring(str,i,i+1)}
				</c:if>
			</c:forEach>
			<br/>
			6-4.str 변수값 중, 'o' 문자가 들어있는 마지막 위치(split, indexOf, substring, substringBefore, substringAfter로 검색처리)<br/>
			${fn:substringBefore(str,"o")}<br/>
			${fn:substringAfter(str,"o")}<br/>
			7.문자열 분리<br/>
			<c:set var="positions" value="${str.split('o')}" />
			<c:forEach var="p" items="${positions}" varStatus="st">
				${st.count}: ${p}
				${positions=p}
			</c:forEach>
			<br/>
			str 변수값 중, 'o'의 개수: ${positions.length()-1}<br/>
			<%-- <c:set var="positions" value="${fn:split(str,'o')}" />
			<c:forEach var="p" items="${positions}" varStatus="st">
				${st.count}: ${p}<br/>
			</c:forEach>
			str 변수값 중, 'o'의 개수: ${fn:length(positions)-1}<br/> --%>
			8.str 변수값 중, 'o'를 'O'로 변경: 
			${fn:replace(str,"o","O")}
		</div>
	</div>
	<p><br/></p>
</body>
</html>