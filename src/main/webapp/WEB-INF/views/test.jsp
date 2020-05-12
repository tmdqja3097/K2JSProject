<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:catch>
						
					<c:forEach items="${matchs}" var="vo">
							<tr>
								<td>${vo.num}</td>
								<td>${vo.title}</td>
								<td>${vo.contents}</td>
								<td>${vo.matchTime}</td>
								<td>${vo.fileImage}</td>
								<td>${vo.count}</td>
								<td>${vo.gender}</td>
								<td>${vo.capacity}</td>
							</tr>
						</c:forEach>
						</c:catch>
</body>
</html>