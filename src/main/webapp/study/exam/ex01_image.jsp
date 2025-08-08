<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex01_image</title>
</head>
<script>
'use strict';
let str = "";

$(function() {
	$("[name='images']").on("change", function() {
		str = "";
		$("[name='images']:checked").each(function() {
			let name = $(this).val();
			str += "<img src='${pageContext.request.contextPath}/images/"+name+".jpg'
				width='200px' height='160px' class='mb-2' /> &nbsp;";
		});
		$("#demo").html(str);
	});
	
	$("#comboBox").on("change", function() {
		str = "";
		let name = $(this).val();
		if (name !== "") {
			str += "<img src='${pageContext.request.contextPath}/images/"+name+".jpg'
				width='200px' height='160px' class='mb-2' />&nbsp;";
		}
		$("#demo").html(str);
	});
	
	$("#listBox").on("change", function() {
		str = "";
		$("#listBox option:selected").each(function() {
			let name = $(this).val();
			str += "<img src='${pageContext.request.contextPath}/images/"+name+".jpg'
				width='200px' height='160px' class='mb-2' /> &nbsp;";
		});
		$("#demo").html(str);
	});
	
	$("[name='selectAll']").on("click",function() {
		for(let i=0; i<$("[name='images']").length; i++) {
			$("[name='images']")[i].checked = true;
		}
		$("[name='images']").trigger("change");
		});
	$("[name='cancleAll']").on("click",function() {
		for(let i=0; i<$("[name='images']").length; i++) {
			$("[name='images']")[i].checked = false;
		}
		$("[name='images']").trigger("change");
	});
	
	$("[name='listSelectAll']").on("click",function() {
		for(let i=0; i<$("#listBox option").length; i++) {
			$("#listBox option")[i].selected = true;
		}
		$("#listBox").trigger("change");
	});
	$("[name='listCancleAll']").on("click",function() {
		for(let i=0; i<$("#listBox option").length; i++) {
			$("#listBox option")[i].selected = false;
		}
		$("#listBox").trigger("change");
	});
});

</script>
<body>
<p><br/></p>
<div class="container">
	<h2>그림을 선택해주세요.</h2>
	<div>
 	  <input type="checkbox" name="images" value="01" /><img src="${pageContext.request.contextPath}/images/01.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="02" /><img src="${pageContext.request.contextPath}/images/02.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="03" /><img src="${pageContext.request.contextPath}/images/03.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="04" /><img src="${pageContext.request.contextPath}/images/04.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="05" /><img src="${pageContext.request.contextPath}/images/05.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="06" /><img src="${pageContext.request.contextPath}/images/06.jpg"
 	  	width="100px" height="80px" class="mb-2" /> &nbsp;
 	  <input type="checkbox" name="images" value="07" /><img src="${pageContext.request.contextPath}/images/07.jpg"
 	  	width="100px" height="80px" class="mb-2" />
 	</div>
 	<p></p>
  <div>
		<input type="button" value="모두 선택" name="selectAll" class="btn btn-primary me-3" />
		<input type="button" value="모두 취소" name="cancleAll" class="btn btn-danger me-3" />
  </div>
	<p><br/></p>
	<div>
		<select id="comboBox" class="form-select w-auto">
			<option value="">-- 그림 선택 --</option>
			<option value="01">01.jpg</option>
			<option value="02">02.jpg</option>
			<option value="03">03.jpg</option>
			<option value="04">04.jpg</option>
			<option value="05">05.jpg</option>
			<option value="06">06.jpg</option>
			<option value="07">07.jpg</option>
		</select>
	</div>
	<p><br/></p>
	<div>
		<select id="listBox" multiple style="height: 180px" class="form-select w-auto">
			<option value="01">01.jpg</option>
			<option value="02">02.jpg</option>
			<option value="03">03.jpg</option>
			<option value="04">04.jpg</option>
			<option value="05">05.jpg</option>
			<option value="06">06.jpg</option>
			<option value="07">07.jpg</option>
		</select>
		<p></p>
		<div>
			<input type="button" value="모두 선택" name="listSelectAll" class="btn btn-primary me-3" />
			<input type="button" value="모두 취소" name="listCancleAll" class="btn btn-danger me-3" />
		</div>
	</div>
	<p><br/></p>
	<div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>