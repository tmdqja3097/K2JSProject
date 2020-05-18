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
  	padding: 15px;	
  	border-radius: 30px;
  	color:white;
  }
  
  .notice_head a{
  	color: white;
  }
  
  #date{
 	font-size: x-small; 
 	color: gray;
  }
  #myUL {
	list-style-type: none;
	padding: 0;
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

	#myInput {
		background-position: 10px 12px;
		background-repeat: no-repeat;
		width: 30%;
		font-size: 16px;
		padding: 12px 20px 12px 40px;
		border: 1px solid #ddd;
		margin-bottom: 10px; 
		border-radius: 10px;
		margin-left: 0px;
	}
	#myInput2 {
		background-position: 10px 12px;
		background-repeat: no-repeat;
		color: black;
		width: 80%;
		font-size: 16px;
		padding: 12px 20px 12px 20px;
		border: 1px solid #ddd;
		margin-bottom: 50px; 
		border-radius: 10px;
		
		
	}
	
	.w3-border-bottom{
		margin-top: 40px;
		
		
		
	}
	#d1{
		background-color: #3534AB;
		color: white;
		margin: 0px ; 
		
	}
	
	#d1 p{
		color: silver;
		text-align: center;	
		line-height:50px;

	}
	#d1 h4{
		margin-top:20px;
		text-align: center;
	}
	.input{
		
	}
	.h4{
		margin-top:40px;
		color:#3534AB;
		text-align:center;
		font-weight: bold;
		
	}
	
	.category{
		display: inline;
		width: 100px;
		height: 50px;
		/* list-style: none; */
		background-image: url('../resources/images/cancle.PNG');
		margin-right: 10px;
	}
	
  	
  </style>
</head>
<body>
<c:if test="${board eq 'notice' }">
<c:import url="../template/header.jsp"></c:import>
	<form action="./${board}List">
	<div class="w3-border-bottom" id="d2"><h4>자주 묻는 질문 &nbsp;&nbsp;
	<input type="text" id="myInput" onkeypress="JavaScript:press(this.form)" placeholder="키워드로 질문하기" title="Type in a name" name="search"></h4></div>
	</form>
	<div class="notice_head"><a href="./${board}List" style="text-decoration: none; ">공지사항</a></div>
	<div id="search_result"><c:if test="${pager.lastNum eq 0}"><p style="text-align: center;">검색결과가 없습니다.</p></c:if></div>
	<ul id="myUL">	
		<c:forEach items="${list}" var="vo">
	
			<li><a href="./${board}Select?num=${vo.num}"><p id="date">${vo.regDate}</p>${vo.title}</a></li>
		</c:forEach>
	</ul>
	
	<a href="./${board}Write" class="btn btn-default" style="float: right;">글쓰기</a>
	
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
		
</c:if>

<c:if test="${board eq 'qna' }">
<c:import url="../template/header.jsp"></c:import>
<div id="d1">
<p>자주 묻는 질문</p>
<h4>궁금증을 빠르게 해결하세요</h4>
	<form action="./${board}List">
		<div style="margin-left: 17px"><h4>
		<input type="text" id="myInput2"  onkeypress="JavaScript:press(this.form)" placeholder="키워드로 질문하기(환불, 인원 변경 등)" title="Type in a name" name="search"></h4></div>
	</form>
</div>
<h4 class="h4">빠른 답변</h4>
<ul id="myUL">
		<c:forEach items="${list}" var="vo">
			<li><a href="./${board}Select?num=${vo.num}"><p id="date">${vo.regDate}</p>${vo.title}</a></li>
		</c:forEach>
	</ul>

<div id="page_num" style="margin-left:45%">
		<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./${board}List?curPage=${pager.startNum-1}&search=${pager.search}">이전</a></li>
		</c:if>
		<c:if test="${pager.lastNum eq 0 }">검색결과가 없습니다.</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li><a href="./${board}List?curPage=${i}&search=${pager.search}">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./${board}List?curPage=${pager.lastNum+1}&search=${pager.search}">다음</a></li>
		</c:if>
		</ul>
	</div> 
	
<h4 class="h4">질문 카테고리<br><br></h4>
	<form>
	<ul style="text-align: center">	
		<li class="category"><a href="./qnaList?search=매치취소"><img alt="cancle" src="../resources/images/cancle.PNG"></a></li>
		<li class="category"><a href="./qnaList?search=서비스"><img alt="service" src="../resources/images/service.PNG"></a></li>
		<li class="category"><a href="./qnaList?search=매치진행"><img alt="match" src="../resources/images/match.PNG"></a></li>
		<li class="category"><a href="./qnaList?search=매치신청"><img alt="match2" src="../resources/images/match2.PNG"></a></li>
		<li class="category"><a href="./qnaList?search=구장"><img alt="home" src="../resources/images/home.PNG"></a></li>
		<li class="category"><a href="./qnaList?search=캐시"><img alt="cash" src="../resources/images/cash.PNG"></a></li>
	</ul>
	</form>

	
	<a href="./${board}Write" class="btn btn-default" style="float: right;">글쓰기</a>
	
	 
	
</c:if>

<script type="text/javascript">
	function press(f){
		if(f.keyCode == 13){ 
			formname.submit();
		}
	}	
</script>
</body>
</html>