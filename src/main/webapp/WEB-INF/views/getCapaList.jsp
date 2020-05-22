<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="./template/boot.jsp"></c:import>
<style>
.notice_head a {
	color: white;
}

#date {
	font-size: x-small;
	color: gray;
}

.myUL {
	list-style-type: none;
	width: 100%;
}

.myUL li a {
	height: 80px;
	border-bottom: 2px solid #ddd;
	border-collapse margin-top: -1px; /* Prevent double borders */
	background-color: white;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block;
}

#p {
	font-size: small;
	color: gray;
}

.div_time {
	width: 300px;
	display: inline;
	font-weight: bold;
	font-size: large;
}

.div_time p {
	margin: 0 auto;
}

* .div_title {
	margin-left: 150px;
	display: inline-block;
	width: 500px;
}

.div_gender {
	font-size: small;
	color: gray;
	/* display: inline; */
}

.div_status {
	display: inline;
	background-color: blue;
	/* margin-right: 10%; */
	width: 150px;
	height: 50px;
	padding: 5 30 5 30px;
	margin-bottom: 10px;
	margin-left: 85%;
	position: absolute;
	text-align: center;
	line-height: 3;
	box-sizing: border-box;
	margin-top: 13px;
	border-radius: 5px;
}

.statusFull {
	display: inline;
}

.div_title h4 {
	margin-bottom: 10px;
}

#h4 {
	display: inline;
	margin: 0;
}

.statusFull p {
	margin: 0 0 0 0;
	display: inline;
	position: relative;
	font-size: small;
	color: white;
}
</style>
</head>
	<div class="search result">
		<c:if test="${i eq 0}">
			<p style="text-align: center;">참여 경기가 없습니다.</p>
		</c:if>
		<c:if test="${i gt 0}">
			<c:forEach items="">
				
			</c:forEach>
		</c:if>
	</div>
</html>