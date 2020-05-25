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
<c:import url="../template/header.jsp"></c:import>
<h1>managerList</h1>
<c:forEach items="${list}" var="manager" varStatus="i">
	<li><a href="#">
		<c:forEach items="${manager.managerFileVOs}" var="file" varStatus="j">
			<img alt="" src="../resources/uploadmanager/${file.fileName}"> 
		</c:forEach>${manager.num} ${manager.name} ${manager.gender} ${manager.phone} ${manager.home} ${manager.managerFileVOs.fileName}</a></li>
	</c:forEach>
	
<div id="page_num" style="text-align: center;">
		<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./managerList?curPage=${pager.startNum-1}">이전</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li><a href="./managerList?curPage=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./managerList?curPage=${pager.lastNum+1}">다음</a></li>
		</c:if>
		</ul>
	</div> 
	
	<script type="text/javascript">
	${list}
	
	</script>
</body>
</html>