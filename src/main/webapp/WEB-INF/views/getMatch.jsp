<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>






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