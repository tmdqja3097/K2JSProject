<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전 내역 확인 페이지</title>
<c:import url="../template/boot.jsp" />
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
}

.user_info {
	margin-top: 5px;
	border-top: 0.3px solid gray;
	border-bottom: 0.3px solid gray;
	color: #3540A5;
	font-size: 20px;
	height: 100px;
}

.user_cash {
	margin-top: 1.5%;
	margin-left: 1%;
	display: inline-block;
	font-weight: bold;
}

.user_cash>span {
	font-weight: none;
	font-size: 10px;
	color: silver;
}

.discharge {
	margin-right: 1%;
	display: inline-block;
	float: right;
	line-height: 100px;
}

h2 {
	font-size: 25px;
	color: #3540A5;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="user_info">
		<div class="user_cash">
			<span><i class="fas fa-won-sign"></i>캐시잔액</span>
			<p>${member.cash}원</p>
		</div>
		<div class="discharge">
			<button disabled="disabled" class="btn btn-primary">잔액 환불</button>
		</div>
	</div>
	<br>
	<h2>나의 충전 내역</h2>
	<table class="table">
		<thead>
			<tr>
				<th>충전 누적 횟수</th>
				<th>충전 금액</th>
				<th>충전 방식</th>
				<th>충전 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${chargeList}" var="cl" varStatus="i">
				<tr class="success">
					<td>${i.index+1}</td>
					<td>${cl.amount}원</td>
					<c:if test="${cl.chargeMethod eq 1}">
						<td>카카오페이</td>
					</c:if>
					<td>${cl.chargeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>