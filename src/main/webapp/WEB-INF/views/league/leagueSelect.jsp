<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>

	<h1>팀소개</h1>
	<br>
	<hr>
	<br>
	<h2 style="font-weight: 800;">${leagueVO.teamName}&nbsp;팀</h2>
	<br>
	<hr>
	<br>
	<h3>포인트</h3>
	<h3>${leagueVO.point}점</h3>
	<br>
	<br>
	<c:if test="${member.id eq 'admin'}">
		<a href="./leagueUpdate?teamName=${leagueVO.teamName}"
			class="btn btn-default">팀 수정</a>
		<button class="btn btn-danger" id="delete">팀 지우기</button>
		<a href="./leagueView" class="btn btn-default">뒤로가기</a>
	</c:if>

	<script type="text/javascript">
		$("#delete").click(function() {
			var teamName = "<c:out value='${leagueVO.teamName}'/>";
			var result = confirm("정말 팀을 지울까요?");
			if (result) {
				location.href = "./leagueDelete?teamName=" + teamName;
			}

		});
	</script>

</body>
</html>