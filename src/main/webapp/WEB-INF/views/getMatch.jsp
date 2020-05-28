<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
<style type="text/css">
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

<div class="match-wrapper" style="display: inline;">
	<button class="btn-all-area" data-target="#layerpop1"
		data-toggle="modal"
		style="border: hidden; background-color: white; padding-top: 3px;">모든지역</button>
	<button class="btn-all-match" data-target="#layerpop2"
		data-toggle="modal"
		style="border: hidden; background-color: white; padding-top: 3px;">모든
		매치</button>
</div>
<p>${i}개의매치</p>


<div id="search_result">
	<c:if test="${i eq 0}">
		<p style="text-align: center;">경기가 없습니다.</p>
	</c:if>
</div>
<div style="position: relative; line-height: 100%;">
	<c:forEach items="${matchs}" var="vo">
		<li><a href="./match/matchSelect?num=${vo.num}">
				<div class="div_time" style="position: absolute;">
					<p style="line-height: 4">${vo.time}</p>
				</div>
				<div class="div_title" style="position: absolute;">
					<h4 style="line-height: 2.7" id="h4">${vo.title}</h4>
					<div class="div_gender" id="p">
						<c:if test="${vo.gender eq 1}">남성 매치</c:if>
						<c:if test="${vo.gender eq 2}">여성 매치</c:if>
						<c:if test="${vo.gender eq 3}">혼성 매치</c:if>
					</div>
				</div> <c:if test="${vo.count lt 12}">
					<div class="div_status" style="background-color: #3534A5">
						<div class="statusFull">
							<p>신청가능</p>
						</div>
					</div>
				</c:if> <c:if test="${vo.count ge 12 && vo.count lt 16}">
					<div class="div_status" style="background-color: #EA3E42">
						<div class="statusFull">
							<p>마감임박 ${vo.count}/16</p>
						</div>
					</div>
				</c:if> <c:if test="${vo.count eq 16}">
					<div class="div_status" style="background-color: #999999">
						<div class="statusFull">
							<p>마감</p>
						</div>
					</div>
				</c:if>
		</a></li>
	</c:forEach>
</div>