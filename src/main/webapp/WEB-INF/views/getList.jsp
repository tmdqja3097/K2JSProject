<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:forEach items="${day}" var="date" varStatus="i">
	<li id="day${i.index}" class="day-list" >
	<a href="./matchList?matchTime=${date}">${date}</a></li>
</c:forEach> --%>

<%-- <c:forEach items="${day}" var="date" varStatus="i">
	<li id="day${i.index}" class="day-list" style="cursor: pointer; border: 1px solid black;">${date}</li>
</c:forEach> --%>

<c:forEach items="${day}" var="date" varStatus="i">
	<li id="day${i.index}" class="day-list" ><a href="#">${date}</a></li>
</c:forEach>