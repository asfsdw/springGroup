<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	성적자료를 form 태그를 통해 입력받아서 '총점, 평균, 학점, 순위'를 구해서 출력하시오.
	추가 버튼(동적폼)을 통해 입력 폼을 추가해 복수의 점수를 입력받으시오.
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>ex03_vos1</title>
	<script>
	let cnt = 0;
	let member = [];
	// 폼 추가용
	let newForm = `
		<div class="input-group mb-2">
			<span class="input-group-text">학번</span>
			<input type="number" name="hakbun" min="0" class="form-control mb" />
			<span class="input-group-text">번</span>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">국어</span>
			<input type="number" name="kor" min="0" max="100" class="form-control" />
			<span class="input-group-text">점</span>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">영어</span>
			<input type="number" name="eng" min="0" max="100" class="form-control" />
			<span class="input-group-text">점</span>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">수학</span>
			<input type="number" name="mat" min="0" max="100" class="form-control" />
			<span class="input-group-text">점</span>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">과학</span>
			<input type="number" name="sci" min="0" max="100" class="form-control" />
			<span class="input-group-text">점</span>
		</div>
		<div class="input-group mb-2">
			<span class="input-group-text">사회</span>
			<input type="number" name="soc" min="0" max="100" class="form-control" />
			<span class="input-group-text">점</span>
		</div>
		<hr/>
	`;
	
	// 입력 정보 저장, 입력폼 추가
	let hakbunList = [];
	function addStudent() {
		let inputCheck = true;
		let hakbunCheck = true;
		
		// 공백 체크.
		$("[name='hakbun']", "[name='kor']", "[name='eng']", "[name='mat']",
				"[name='sci']", "[name='soc']").each(function() {
			if($(this).val() == "") inputCheck = false;
		});
		if(!inputCheck) {
			alert("전부 입력해주세요.");
			return false;
		};
		
		for(let i=0; i<hakbunList.length; i++) {
			// 이번에 입력한 학번만 비교.
			if(hakbunList[i] == $("[name='hakbun']").last().val()) hakbunCheck = false;
		}
		if(!hakbunCheck) {
			alert("이미 입력한 학생입니다.");
			return false;
		};
		// 이번에 입력한 학번 배열에 추가.
		hakbunList[cnt] = $("[name='hakbun']").last().val();
		
		let hakbun = $("[name='hakbun']").last().val();
		let kor = $("[name='kor']").last().val();
		let eng = $("[name='eng']").last().val();
		let mat = $("[name='mat']").last().val();
		let sci = $("[name='sci']").last().val();
		let soc = $("[name='soc']").last().val();
		member[cnt] = hakbun+"/"+kor+"/"+eng+"/"+mat+"/"+sci+"/"+soc;
		cnt++;
		
		// 입력폼 추가.
		let studentDiv = document.getElementById("student");
		let addForm = document.createElement("div");
		addForm.innerHTML = newForm;
		studentDiv.appendChild(addForm);
	}
	
	// 입력폼 삭제.
	function delStudent() {
		// div id="student"를 기준으로 잡는다.
		let studentDiv = document.getElementById("student");
		
		// 첫 번째 폼은 무조건 남기기 위한 조건.
		if (cnt > 0) {
			// 입력폼 삭제하면서 추가한 내용도 함께 삭제.
			hakbunList.pop();
			member.pop();
			cnt--;
			// div id="student" 삭제 
			studentDiv.removeChild(studentDiv.lastElementChild);
		}
		else {
			alert("첫 번째 입력폼은 삭제할 수 없습니다.");
		}
	}
	
	// 전송.
	function fCheck() {
		// 학생을 한 명도 입력하지 않으면.
		if(cnt == 0) {
			alert("학생을 입력해주세요.");
			return false;
		}
		else {
			$("[name='member']").val(member);
			myform.submit();
		}
		
	}
	</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>성적 출력 프로그램</h2>
		<p><br/></p>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/exam/Ex03Ok">
			<div id="student">
				<div class="input-group mb-2">
					<span class="input-group-text">학번</span>
					<input type="number" name="hakbun" min="0" class="form-control mb" />
					<span class="input-group-text">번</span>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text">국어</span>
					<input type="number" name="kor" min="0" max="100" class="form-control" />
					<span class="input-group-text">점</span>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text">영어</span>
					<input type="number" name="eng" min="0" max="100" class="form-control" />
					<span class="input-group-text">점</span>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text">수학</span>
					<input type="number" name="mat" min="0" max="100" class="form-control" />
					<span class="input-group-text">점</span>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text">과학</span>
					<input type="number" name="sci" min="0" max="100" class="form-control" />
					<span class="input-group-text">점</span>
				</div>
				<div class="input-group mb-2">
					<span class="input-group-text">사회</span>
					<input type="number" name="soc" min="0" max="100" class="form-control" />
					<span class="input-group-text">점</span>
				</div>
				<hr/>
			</div>
			<p><br/></p>
			<div class="mb-2 row">
				<input type="button" name="add" value="학생추가" onclick="addStudent()" class="btn btn-primary col" />
				<div class="col"></div>
				<input type="button" name="del" value="입력창 삭제" onclick="delStudent()" class="btn btn-danger col" />
				<div class="col"></div>
				<input type="button" name="res" value="학점계산" onclick="fCheck()" class="btn btn-success col" />
				<div class="col"></div>
				<input type="reset" name="reset" value="다시입력" class="btn btn-warning col" />
			</div>
				<input type="hidden" name="member" value="" />
		</form>
		<div id="demo"></div>
	</div>
	<p><br/></p>
</body>
</html>