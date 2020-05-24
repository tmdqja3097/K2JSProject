<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach items="${day}" var="date" varStatus="i">
	<c:if test="${fn:substringAfter(date,'/') eq '토' }">
		<li id="day${i.index}" class="day-list" style="width: 8%"><a style="color: #3534A5; line-height: 1; margin-top: 30px;"> <p class="dateNum">${fn:substringBefore(date,'/')}</p> <span class="yoil">${fn:substringAfter(date,'/')}</span></a></li>
	</c:if>
	<c:if test="${fn:substringAfter(date,'/') eq '일' }">
		<li id="day${i.index}" class="day-list" style="width: 8%"><a style="color: #EA3E42; line-height: 1; margin-top: 30px;"> <p class="dateNum">${fn:substringBefore(date,'/')}</p> <span class="yoil">${fn:substringAfter(date,'/')}</span></a></li>
	</c:if>
	<c:if test="${fn:substringAfter(date,'/') ne '토' && fn:substringAfter(date,'/') ne '일' }">
		<li id="day${i.index}" class="day-list" style="width: 8%"><a style="color: black; line-height: 1; margin-top: 30px;"> <p class="dateNum">${fn:substringBefore(date,'/')}</p> <span class="yoil">${fn:substringAfter(date,'/')}</span></a></li>
	</c:if>
</c:forEach>

