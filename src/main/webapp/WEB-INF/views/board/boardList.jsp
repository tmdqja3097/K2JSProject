<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="UTF-8">
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.6s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: gray;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

* {
	box-sizing: border-box;
}

#myInput {
	background-image: url("");
	background-position: 10px 12px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myUL {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myUL li a {
	border: 1px solid #ddd;
	margin-top: -1px; /* Prevent double borders */
	background-color: #f6f6f6;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}

#myUL li a:hover:not (.header ) {
	background-color: #eee;
}

#date {
	font-size: x-small;
}
</style>

<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	<h1>${board}ListPage</h1>

	<form action="./${board}List" class="form-inline">
		<div class="input-group input-group-sm col-xs-2">
			<select class="form-control" id="sel1" name="kind">
				<option value="bt">Title</option>
				<option value="bc">Contents</option>
			</select>
		</div>
		<div class="input-group input-group-sm col-xs-4">

			<input type="text" class="form-control" placeholder="Search"
				name="search">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
	
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="키워드로 질문하기" 
		title="Type in a name">

	<ul id="myUL">
		<c:forEach items="${list}" var="vo">
			<li><a href="./${board}Select?num=${vo.num}"><p id="date">${vo.regDate}</p>${vo.title}</a></li>
		</c:forEach>
	</ul>
	
	<a href="./${board}Write" class="btn btn-danger">WRITE</a>





	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}

		function myFunction() {
			var input, filter, ul, li, a, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("myUL");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				txtValue = a.textContent || a.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		}
	</script>
</body>
</html>