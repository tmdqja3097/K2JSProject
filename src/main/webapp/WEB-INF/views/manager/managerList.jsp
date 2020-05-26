<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
#myUL {
	list-style-type: none;
	padding: 0;
}

#myUL li a {
	border-bottom: 2px solid #ddd;
	border-collapse margin-top: -1px; /* Prevent double borders */
	background-color: white;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}

.manager_img img {
	margin-top: -15px;
	margin-left: 25px;
	width: 64px;
	height: 64px;
	border-radius: 100px;
	object-fit: cover;
	vertical-align: middle;
	border: 1px solid black;
	margin-left: 25px;
}

table tr td {
	height: 80px;
	margin: 0 auto;
	font-size: 15px;
}

input {
	line-height: 80px;
}

.title {
	text-align: center;
	margin: 8% 0%;
}

h2{
	font-size: 30px;
	font-weight: 300;
	border-bottom: 3px solid #FFC645;
	display: inline-block;
	margin-bottom: 8px;
	margin-left: 15px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="title">
		<h2>MANAGERS</h2>
	</div>
	<form action="./managerDelete" id="frm" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>Manager</th>
					<th>No</th>
					<th>이름</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>거주지</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="manager" varStatus="i">
				<tr>
					<td><input type="checkbox" class="check_input" name="num"
						value="${manager.num}">
						<div class="manager_img">
							<img alt=""
								src="../resources/uploadmanager/${manager.managerFileVO.fileName}"></td>
					<td style="line-height: 80px;">${manager.num}</td>
					<td style="line-height: 80px;">${manager.name}</td>
					<td style="line-height: 80px;"><c:if test="${manager.gender eq 1}">남성</c:if><c:if test="${manager.gender eq 2}">여성</c:if></td>
					<td style="line-height: 80px;">${manager.phone}</td>
					<td style="line-height: 80px;">${manager.home}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="매니저 삭제" id="btn" class="btn btn-default"
			style="float: right;">
	</form>




	<div id="page_num" style="text-align: center;">
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li><a href="./managerList?curPage=${pager.startNum-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./managerList?curPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li><a href="./managerList?curPage=${pager.lastNum+1}">다음</a></li>
			</c:if>
		</ul>
	</div>


	<script type="text/javascript">
	

		$("#btn").click(function() {
			var check1 = false;
			
			$(".check_input").each(function() {
				if ($(this).prop("checked") == true) {
					check1 = true;
				}
			});

			if (check1) {
				var check2 = confirm("정말 해당 매니저에 대한 정보를 삭제하시겠습니까?");
				if (check2) {
					$("#frm").submit();
				}
			}
		});
	</script>



</body>
</html>