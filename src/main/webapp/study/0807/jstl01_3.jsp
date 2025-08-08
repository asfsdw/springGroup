<%@page import="java.util.Date"%>
<%@page import="study.j0806.Test12VO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<title>jstl01_3</title>
	</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>JSTL Formatting</h2>
		<div>
			<c:set var="won1" value="7654321" />
			<c:set var="won2" value="7654.567" />
			won1: ${won1} / won2: ${won2}<br/>
			<hr>
			1.천단위 쉼표<br/>
			<fmt:formatNumber value="${won1}" /> : <fmt:formatNumber value="${won2}" /><br/>
			<fmt:formatNumber value="${won1}" pattern="0,000" /> : <fmt:formatNumber value="${won2}" pattern="0,000" /><br/>
			<fmt:formatNumber value="${won1}" pattern="0,000.0" /> : <fmt:formatNumber value="${won2}" pattern="0,000.0" /><br/>
			<fmt:formatNumber value="123" pattern="0,000.0" /> : <fmt:formatNumber value="123" pattern="0,000.0" /><br/>
			<fmt:formatNumber value="123" pattern="#,##0.0" /> : <fmt:formatNumber value="123" pattern="#,##0.0" /><br/>
			2.화패단위<br/>
			<fmt:formatNumber value="${won1}" type="currency" /><br/>
			<fmt:formatNumber value="${won1}" type="currency" currencyCode="USD" /><br/>
			<fmt:formatNumber value="${won2}" type="currency" currencyCode="USD" pattern="#,##0.00" /><br/>
			<hr/>
			3.백분율<br/>
			<c:set var="per" value="0.954567" />
			원본: ${per}<br/>
			백분율1: <fmt:formatNumber value="${per}" type="percent" /><br/>
			백분율2: <fmt:formatNumber value="${per}" type="percent" pattern="#.#%" /><br/>
			<hr/>
			4.날짜<br/>
			오늘 날짜1<br/>
			<c:set var="today" value="<%=new Date()%>" />
			${today}<br/>
			오늘 날짜2<br/>
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /><br/>
			오늘 날짜3<br/>
			<fmt:formatDate value="${today}" pattern="yyyy-MMM-dd" /><br/>
			오늘 날짜4<br/>
			<fmt:formatDate value="${today}" pattern="yyyy년-MM월-dd일" /><br/>
			현재 시간<br/>
			<fmt:formatDate value="${today}" pattern="hh : mm : ss" /><br/>
			<hr/>
			5.국가별 설정(로케일)<br/>
			톰캣 서버의 기본 로케일: <%=response.getLocale()%><br/>
			<fmt:formatNumber value="${won1}" type="currency" /><br/>
			톰캣 서버의 로케일 변경: en_US<fmt:setLocale value="en_US" /><br/>
			<fmt:formatNumber value="${won1}" type="currency" /><br/>
			<hr/>
		</div>
	</div>
	<p><br/></p>
</body>
</html>