<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 화면</title>
<script src="../resources/js/kakao.js"></script>
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<c:import url="../template/boot.jsp" />
<style>
body {
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
}

.bodyCon {
	border-top: 0.3px solid gray;
	margin-top: 10px;
}

.userName>span {
	font-size: 20px;
	font-style: oblique;
}

.userName>p {
	font-size: 30px;
	font-style: italic;
	color: #3534A5;
}
.cashBal {
	border-bottom: 0.3px solid gray;
	padding-bottom: 20px;
}

.cashBal>p {
	font-size: 5px;
	color: silver;
}

.cashBal>span {
	font-size: 20px;
	font-style: italic;
	color : black;
}

.cashCharge {
	float: right;
	margin : 8px 0px;
}
.userInfo {
float : right;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="bodyCon">
		<label hidden="hidden" id="loginmt" title="${member.loginmt}"></label>
		<br> <br>
		<div class="userName">
			<span>어서오세요</span>
			<p>${member.name}님</p>
		</div>
		<br> <br>
		<div class="cashCharge">
			<button class="btn btn-primary" id="addCash">캐시 충전</button>
		</div>
		<div class="cashBal">
			<p><i class="fas fa-won-sign"></i> 나의 캐쉬 잔액</p> <span>${member.cash}원</span>
			
		</div>
		<div class="lastMatch">
			<h1> 참여한 경기 목록 </h1>
			<div class="matchList">
				
				
				
			</div>
		</div>
		<br>
		<div class="userInfo">
			<button class="btn btn-normal" id="chargeList">충전 내역</button>
			<button class="btn btn-normal" id="updateInfo">개인 정보 수정</button>
			<button class="btn btn-danger" id="deleteInfo">회원 탈퇴</button>
		</div>
	</div>

	<script type="text/javascript">
	
		$("#chargeList")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/member/MemberChargeList";
						})
		$("#updateInfo")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/member/MemberUpdate";
						})
		$("#addCash")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/member/MemberAddCash";
						})
		$("#deleteInfo").click(function() {
			var loginmt = '${member.loginmt}';
			if (loginmt == 1) {
				Kakao.init('c5126e0fcae8eba0e1ed7a9c58dc7812');
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function() {
						alert("연동 정보 삭제 완료");
					}
				})

				location.href = "./MemberDelete";
			}
		})
		
		
		
	</script>
</body>
</html>