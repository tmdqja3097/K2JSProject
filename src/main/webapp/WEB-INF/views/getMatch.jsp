<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>${i}개의매치</div>

<table class="table table-condensed">

	<tr>
		<td>Num</td>
		<td>Title</td>
		<td>Contents</td>
		<td>MatchTime</td>
		<td>FileImage</td>
		<td>Count</td>
		<td>Gender</td>
		<td>Capacity</td>
	</tr>
</table>

<c:forEach items="${matchs}" var="vo">
	<tr>
		<td>${vo.num}</td>
		<td>${vo.title}</td>
		<td>${vo.contents}</td>
		<td>${vo.matchTime}</td>
		<td>${vo.fileImage}</td>
		<td>${vo.gender}</td>
		<td>${vo.capacity}</td>
	</tr>
</c:forEach>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
 <style type="text/css">
  
  .notice_head a{
  	color: white;
  }
  
  #date{
 	font-size: x-small; 
 	color: gray;
  }
  .myUL {
	list-style-type: none;
	margin-left: 0px;
	width: 100%;

}

.myUL li a {
	height : 80px;
	border-bottom: 2px solid #ddd;
	border-collapse
	margin-top: -1px; /* Prevent double borders */
	background-color: white;
	
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block;
	
	
}

#p{
	font-size: small;
	color: gray;
}

.div_time{
	width: 300px;
	display: inline;
	font-weight: bold;
	font-size: large;


}

.div_time p {
	margin: 0 auto;
}

.div_title{
	margin-left: 150px;
	display: inline-block;
	width: 500px;

	
}

.div_gender{
	font-size: small;
	color: gray;
	/* display: inline; */
}

.div_status{
	display: inline;
 	background-color: blue; 
	/* margin-right: 10%; */
	width: 150px;
	height: 50px;
	padding: 5 30 5 30px;
	margin-bottom: 10px;
	margin-left: 87%;
	position: absolute;
	text-align: center;
	line-height: 3;
	box-sizing: border-box;
	margin-top: 13px;
	border-radius: 5px;
}
.statusFull{
	display: inline;
	
	
}

.div_title h4{
	margin-bottom: 10px;
}

p, li, h4{
	display: inline;
	margin: 0;
	
	
}

.statusFull p{
	margin: 0 0 0 0;
	display: inline;
	position: relative;
	font-size: small;
	color: white;
}
	
/* .match_filter{  
	height: 50px;    
}

.match_filter_sub{ 
	height: 50px; 
}

.match_filter_sub > li > a{   
	border: 1px solid blue;  
	width: 7%;
	height: 30px;    
	display: inline-block;
	margin-top: 10px;
	padding-top: 5px;
	text-align: center;
} */
  	
  </style>
	

	<span>${i}개의매치</span>
	<div class="match-wrapper" style="display: inline;">	
				<button class="btn-all-area" data-target="#layerpop1"
					data-toggle="modal"
					style="border: hidden; background-color: white; padding-top: 3px;">모든 지역</button>
				<!-- <span id="all-area" data-target="#layerpop" data-toggle="modal" style="cursor: pointer; padding-right: 5px;">모든 지역</span> -->
				
				<button class="btn-all-match" data-target="#layerpop2"
					data-toggle="modal"
					style="border: hidden; background-color: white; padding-top: 3px;">모든 매치</button>
				<!-- <span id="all-match" style="cursor: pointer; padding-left: 5px;">모든매치</span> -->
	</div>
	
	
	<div id="search_result"><c:if test="${i eq 0}"><p style="text-align: center;">경기가 없습니다.</p></c:if></div>
		<div id="getMatchList" style="position: relative; line-height:100%;">
		<c:forEach items="${matchs}"  var="vo">
			<li id="gml"><a href="./match/matchSelect?num=${vo.num}">
			<div class="div_time" style="position:absolute;"><p style="line-height: 4">${vo.time}</p></div> 
			<div class="div_title" style="position: absolute;"><h4 style="line-height: 2.7">${vo.title}</h4><div class="div_gender" id="p"><c:if test="${vo.gender eq 1}">남성</c:if><c:if test="${vo.gender eq 2}">여성</c:if> </div></div>
			<c:if test="${vo.count lt 12}">
			<div class="div_status" style="background-color: #3534A5 " ><div class="statusFull" ><p>신청가능</p></div></div>
			</c:if>
			<c:if test="${vo.count ge 12 && vo.count lt 16}">
			<div class="div_status" style="background-color: #EA3E42" ><div class="statusFull" ><p>마감임박 ${vo.count}/16</p></div></div>
			</c:if>	
			<c:if test="${vo.count eq 16}">
			<div class="div_status" style="background-color: #999999" ><div class="statusFull" ><p>마감</p></div></div>
			</c:if>
			</a></li>
		</c:forEach>
		</div>




