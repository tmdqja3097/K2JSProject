<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach items="${day}" var="date" varStatus="i">
	<c:if test="${fn:substringAfter(date,'/') eq '토' }">
		<li id="day${i.index}" class="day-list"><a style="color: blue;">${date}</a></li>
	</c:if>
	<c:if test="${fn:substringAfter(date,'/') eq '일' }">
		<li id="day${i.index}" class="day-list"><a style="color: red;">${date}</a></li>
	</c:if>
	<c:if test="${fn:substringAfter(date,'/') ne '토' && fn:substringAfter(date,'/') ne '일' }">
		<li id="day${i.index}" class="day-list"><a style="color: black;">${date}</a></li>
	</c:if>
</c:forEach>