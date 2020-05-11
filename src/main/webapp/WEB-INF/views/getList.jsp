<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${day}" var="date" varStatus="i">
	<li id="day${i.index}" class="day-list"><a href="./matchList?matchTime=${vo.sysdate}">${date}</a></li>
</c:forEach>