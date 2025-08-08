<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp" />
    <title>el</title>
  </head>
<body>
  <p><br/></p>
  <div class="container">
    <h2>Expression Language</h2>
    <p>저장소(서버 저장소: ServerContextContainer에 저장되어있는 자료 처리를 담당)</p>
    <pre>
    	사용법: $ {변수, 값, 객체, 수식}
    	용도: 사용자(Client)가 '변수, 값, 객체, 수식'등을 서버로부터 전송받은 후,
    			해당 자료를 '저장, 계산, 선언'등의 처리 용도로 사용.
    	서버 저장소: Application / Session / PageContext / Request
    </pre>
    <hr/>
    <%
    	String name = "홍길동";
    	String address = "서울";
    	int su1 = 100, su2 = 200;
    	String su3 = "300", su4 = "400";
    	
    	out.println("<h4>스크립틀릿을 이용한 출력</h4>");
    	out.println("이름: "+name);
    	out.println("<br/>주소: "+address);
    	out.println("<br/>su1: "+su1);
    	out.println("<br/>su1+su2: "+(su1+su2));
    	out.println("<br/>su3+su4: "+(su3+su4));
    %>
    <hr/>
    <h4>표현식을 이용한 출력</h4>
    <p>이름: <%=name%></p>
    <p>주소: <%=address%></p>
    <p>su1: <%=su1%></p>
    <p>su1+su2: <%=(su1+su2)%></p>
    <p>su3+su4: <%=(su3+su4)%></p>
    <hr/>
    <%
	    pageContext.setAttribute("name", name);
	  	pageContext.setAttribute("address", address);
	  	pageContext.setAttribute("su1", su1);
	  	pageContext.setAttribute("su2", su2);
	  	pageContext.setAttribute("res1", (su1+su2));
	  	pageContext.setAttribute("res2", (su3+su4));
    %>
    <h4>EL표기법을 이용한 출력</h4>
    <p>이름: ${name}</p>
    <p>주소: ${address}</p>
    <p>su1: ${su1}</p>
    <p>su1+su2: ${res1}</p>
    <p>su3+su4: ${res2}</p>
    <p>su1+su2: ${(su1+su2)}</p>
    <p>su1*su2: ${(su1*su2)}</p>
    <p>{su1}+{su2}: ${su1}+${su2}</p>
    <hr/>
    <h4>parameter를 통해 넘어온 값 처리(QueryString)</h4>
    <p>get 방식을 통해 넘어온 값에 대한 처리를 할 수 있다(주소?변수1=값1&변수2=값2)</p>
    <div>주소창 끝에 '?mbc=20&kbs=50'을 입력 후, 확인하시오.</div>
    <p>mbc = ${param.mbc}</p>
    <p>kbs = ${param.kbs}</p>
    <p>mbc-kbs = ${(param.mbc-param.kbs)}</p>
    <p>mbc+kbs = ${(param.mbc+param.kbs)}</p>
    <hr/>
    <h4>form의 post를 통해 넘어온 값의 처리</h4>
    <div>
    	<form name="myform" method="post" action="${pageContext.request.contextPath}/j0807/EL">
    		<div>성명
    			<input type="text" name="name2" value="이기자" class="form-control" />
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
		  	<div>
		  		<input type="submit" value="전송" class="btn btn-success" />
		  	</div>
		  	<hr/>
		  	<p>성명: ${name2}</p>
		  	<p>직업: ${job}</p>
    	</form>
    </div>
  </div>
  <p><br/></p>
</body>
</html>