<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp" />
    <title>test15_1</title>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>성적 자료</h2>
    <form name="myform" method="post" action="${pageContext.request.contextPath}/j0806/Test15_2Ok">
	    <p>성명: <input type="text" name="name" value="홍길동" autofocus required class="form-control" /></p>
	    <p>학번: <input type="text" name="hakbun" value="ms1234" required class="form-control" /></p>
	    <p>국어: <input type="number" name="kor" value="100" required class="form-control" /></p>
	    <p>영어: <input type="number" name="eng" value="90" required class="form-control" /></p>
	    <p>수학: <input type="number" name="mat" value="80" required class="form-control" /></p>
	    <p>과학: <input type="number" name="sci" value="70" required class="form-control" /></p>
	    <p>사회: <input type="number" name="soc" value="60" required class="form-control" /></p>
	    <p>
	    	<input type="submit" value="계산처리" class="btn btn-success me-2" />
	    	<input type="reset" value="다시입력" class="btn btn-warning" />
	    </p>
	    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
    </form>
  </div>
  <p><br/></p>
</body>
</html>