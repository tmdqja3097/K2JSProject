<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>

	<div class="ranks_card">
		<div class="ranks_top">
		<h2> 전체 랭킹 </h2>
			<div class="ranks_body">
			
			<table class="table">
				<tr style="font-weight: bolder;">
					<td>순위/팀</td>
					<td>승률</td>
					<td>승</td>
					<td>무</td>
					<td>패</td>
					<td>점수</td>		
				</tr>
					<c:forEach items="${leagueTotal}" var="leaT">
						<tr>
							<td><span>${leaT.rank} &nbsp;&nbsp;&nbsp;&nbsp;</span><a
								href="./leagueSelect?teamName=${leaT.teamName}"
								style="text-decoration: none;">${leaT.teamName}</a></td>
							<td><fmt:formatNumber pattern="#.#" value="${leaT.winRate}"></fmt:formatNumber>%</td>
							<td>${leaT.win}</td>
							<td>${leaT.draw}</td>
							<td>${leaT.lose}</td>
							<td style="color: #FF5D5D;">${leaT.point}</td>
						</tr>
					</c:forEach>
				</table>        
				
				<a href="./leagueView" class="btn btn-default">뒤로가기</a>
				  
			</div>
		</div>
	</div>

</body>
</html>