<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
 <style type="text/css">
 
  .notice_head{
  	background-color: #3534AB;
  	color:"white";
  	padding: 15px;
  	color : white;
  	margin: 15px 130px;';
  	font-weight: bold;
  	border-radius: 30px;
  }
  #date{
 	font-size: x-small; 
 	color: gray;
  }
  #myUL {
	list-style-type: none;
	padding: 0;
	margin: 30px 130px;
}

#myUL li a {
	border-bottom: 2px solid #ddd;
	border-collapse
	margin-top: -1px; /* Prevent double borders */
	background-color: white;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}
  
  </style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<c:import url="../template/search.jsp"></c:import>
	<div class="notice_head"><a href="./${board}List" style="text-decoration: none;">공지사항</a></div>
	
	<ul id="myUL">
		<c:forEach items="${list}" var="vo">
			<li><a href="./${board}Select?num=${vo.num}"><p id="date">${vo.regDate}</p>${vo.title}</a></li>
		</c:forEach>
	</ul>
	
	<a href="./${board}Write" class="btn btn-default" style="margin-left: 85%">글쓰기</a>
	
	 <div id="page_num" style="margin-left:45%">
		<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./${board}List?curPage=${pager.startNum-1}&search=${pager.search}">이전</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li><a href="./${board}List?curPage=${i}&search=${pager.search}">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./${board}List?curPage=${pager.lastNum+1}&search=${pager.search}">다음</a></li>
		</c:if>
		</ul>
	</div> 
		
	
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>