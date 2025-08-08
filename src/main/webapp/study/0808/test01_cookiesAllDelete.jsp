<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		/* if(cookies[i].getName().equals("cPwd")) 비밀번호만 삭제*/
		cookies[i].setMaxAge(0); // 삭제가 없기 때문에 수명을 0초로 준다.
		response.addCookie(cookies[i]);
	}
%>
<script>
	alert("쿠키가 삭제되었습니다.");
	location.href="test01_cookies.jsp"
</script>