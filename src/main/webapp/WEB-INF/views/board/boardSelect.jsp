<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
#myUL {
	list-style-type: none;
	padding: 0;
	margin: 30px 50px;
}

#myUL li {
	border-bottom: 2px solid #ddd;
	border-collapse margin-top: -1px; /* Prevent double borders */
	background-color: white;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}

#myUL li a h3 {
	color: #3534AB;
}

#date {
	font-size: small;
	margin-bottom: 5px;
	margin-left: 85%;
	font-weight: bold;
}

#myInput {
	background-position: 10px 12px;
	background-repeat: no-repeat;
	width: 30%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.b1 {
	margin-left: 85%;
}
</style>
</head>
<body style="padding: 0%">
<div style="padding: 0 20%">
	<c:import url="../template/header.jsp"></c:import>
</div>
	<div class="container">
		<ul id="myUL">
			<li><a href="./${board}List" style="text-decoration: none;"><h3>공지사항</h3></a></li>
			<li>${vo.title}<br> <br>${vo.contents}<br>
				<p id="date">등록일 : ${vo.regDate}</p></li>
			<br>
			<div>
				<c:forEach items="${vo.boardFileVOs}" var="file">
					<div>
						<a
							href="../boardFile/fileDown?fileNum=${file.fileNum}&board=${file.board}">&nbsp;&nbsp;${file.oriName}</a>
					</div>
				</c:forEach>
			</div>
			
			
			
			
			<c:if test="${member.id eq 'admin'}">
			<div>
				<a href="./${board}Delete?num=${vo.num}" class="btn btn-default" style="float: right;">Delete</a>
				<a href="./${board}Update?num=${vo.num}" class="btn btn-default" style="float: right;">Update</a>
			</div>
			</c:if>
			<h4>다른 키워드로 찾아보세요</h4>
			<form action="./${board}List">
				<input type="text" id="myInput"
					onkeypress="JavaScript:press(this.form)" placeholder="키워드로 질문하기"
					title="Type in a name" name="search">
			</form>
		</ul>
	</div>
	<div style="height: 130px"></div>
	<footer></footer>

	<script>
		function press(f) {
			if (f.keyCode == 13) {
				formname.submit();
			}
		}
	</script>
</body>
</html>