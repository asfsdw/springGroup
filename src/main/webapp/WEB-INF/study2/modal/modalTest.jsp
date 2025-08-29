<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="/include/bs5.jsp" />
		<title>Modal</title>
	</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">Modal 연습</h2>
		<p><br/></p>
		<p>
			<input type="button" value="모달창" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal" />
			<input type="button" value="모달창2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal2" />
			<input type="button" value="모달창3" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal3" />
			<input type="button" value="모달창4" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal4" />
		</p>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal4">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
				<h5>이곳은 본문입니다.</h5>
				<div>정보1: ____</div>
				<div><input type="text" name="msg" value="반갑습니다." class="form-control" /></div>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>