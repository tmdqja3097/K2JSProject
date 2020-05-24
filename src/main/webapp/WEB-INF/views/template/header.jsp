<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	
</script>

<style>
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: white;
	border-color: white;
}

.navbar-inverse .navbar-toggle {
	border-color: #333;
	background-color: #333;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 500px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: white;
	height: 100%;
}

.right_sidenav {
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

.right_sidenav a {
	padding: 8px 8px 8px 32px; 
	text-decoration: none;
	font-size: 25px;
	color: gray;
	display: block;
	transition: 0.3s;
}

.right_sidenav a:hover {
	color: #f1f1f1;
}

.right_sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.navbar-inverse .navbar-nav>li>a:hover {
	color: #333;
	background-color: transparent;
}

.navbar-inverse .navbar-brand:hover {
	color: #333;
	/* background-color: transparent; */
}

/* Set black background color, white text and some padding */
footer {
	background-color: #333333;
	color: white;
	padding: 15px;
	height: 300px;
}

""
/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		/* padding: 15px;  */
		
	}
	.row.content {
		height: auto;
	}
}
}
</style>


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
			id="logo" alt="logo"
			src="${pageContext.request.contextPath}/resources/images/k2.jpg"></a>
		<!-- <button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar"> -->
		<!-- <a class="navbar-brand" href="#"></a><span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span></a>
			</button> -->
	</div>

	<div>
		<ul class="nav navbar-nav navbar-right collapse navbar-collapse" style="margin-right: 0px;">
			<li><a href="#"> <span
					style="font-size: 30px; color: gray; margin-top: 0px; float: float; cursor: pointer;"
					onclick="openNav()">&#9776; </span>
			</a></li>
		</ul>
	</div>

	<c:if test="${ empty member.email}">
		<ul class="nav navbar-nav navbar-right ">
			<li><a
				href="${pageContext.request.contextPath}/member/MemberNew"><span
					class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			<li><a
				href="${pageContext.request.contextPath}/member/MemberLogin"><span
					class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		</ul>
	</c:if>
	<c:if test="${ not empty member.email}">
		<ul class="nav navbar-nav navbar-right ">
			<li><a
				href="${pageContext.request.contextPath}/member/MemberPage"><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a
				href="${pageContext.request.contextPath}/member/MemberLogout"><span
					class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
		</ul>
	</c:if>
	<div id="mySidenav" class="right_sidenav" style="z-index: 3;">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#" style="text-decoration: none;">K2JS 소개</a> <a href="#" style="text-decoration: none;">매니저 지원</a> <a
			href="${pageContext.request.contextPath}/notice/noticeList" style="text-decoration: none;">공지사항</a>
		<a href="${pageContext.request.contextPath}/qna/qnaList" style="text-decoration: none;">자주 묻는 질문</a>
	</div>
</nav>





