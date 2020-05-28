<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
</head>
<body>

<c:import url="./template/header.jsp"></c:import>

			<div class="container">
				<div class="row">
					<table class="table table-condensed">
						<tr>
							<td>MatchTime</td>
							<td>Title</td>
							<td>Count</td>
						</tr>
						
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.matchTime}</td>
								<td>${vo.title}</td>
								<td>${vo.count}</td>
							</tr>
						</c:forEach>
						
						
					</table>
				</div>
			</div>


</body>
</html>