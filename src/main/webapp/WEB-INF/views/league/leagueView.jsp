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

	<h1>leagueView page</h1>
	
	<div class="container">
		<table class="table">
			<tr>
				<td>순위/팀</td>
				<td>승</td>
				<td>무</td>
				<td>패</td>
				<td>점수</td>		
			</tr>   
			<c:forEach items="${leagues}" var="lea"> 
					<tr> 
						<td><span>${lea.rank} &nbsp;&nbsp;&nbsp;&nbsp;</span><a href="./leagueSelect?teamName=${lea.teamName}">${lea.teamName}</a></td>
						<td>${lea.win}</td>
						<td>${lea.draw}</td>
						<td>${lea.lose}</td>
						<td>${lea.point}</td>
					</tr>
			</c:forEach>
		</table>
	</div>    
	<a href="./leagueWrite" class="btn btn-default">리그 작성</a>
	

</body>
</html>