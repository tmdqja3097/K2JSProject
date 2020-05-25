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

	<table >
		<tr>
			<td>팀이름</td>
			<td>매치 경기</td>
			<td>매치 날짜</td>
			<td>매치 장소</td>
			<td>랭킹</td>		
		</tr>   
	</table>
      
	<table>
	<c:forEach items="${leagues}" var="lea">
			<tr>
				<td>${lea.teamName}</td>
				<td>${lea.matchName}</td>
				<td>${lea.matchDate}</td>
				<td>${lea.matchLocation}</td>
				<td>${lea.ranking}</td>
			</tr>
	</c:forEach>
	</table>
	
	<a href="./leagueWrite">남자 리그 작성</a>

</body>
</html>