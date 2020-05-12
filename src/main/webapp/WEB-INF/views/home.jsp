<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<c:import url="./template/boot.jsp"> </c:import>

<style type="text/css">
	.slide_img{
		width : 70%;
		height: 100px;
	}
	.slide_edge{
		border-radius: 50px;
	}
	
	#myCarousel >a {
	border-radius : 50px;
	z-index: 0;
	background-image : none;
	}
	
	/* match-filter */
	
	.match-result{
		width: 10%; 
		height: 30px;
		float: left; 
		text-align: center;
	}
	
	.match-wrapper{
		width: 20%;
		height: 30px;
		margin-left: 80%; 
		text-align: center;
	}
	
	/* match-filter */
	
	/* modal */
	.filterCheck{
		float: left;
		opacity: 0;
		width: 5px;
		height: 5px;
	}
	
	.checkLabel{
		background-color: #ffc645;
		width: 50px;
		height: 30px;
		text-align: center;
		border-radius:30px;
		padding-top: 5px;  
		float: left;
		cursor: pointer;
	}
	
	/* calendar */
	
</style>	
</head>


<body>

	<c:import url="./template/header.jsp"></c:import>

	<div>
		<div class="container  slide_img ">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" >
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
		
				<!-- Wrapper for slides -->
				<div class="carousel-inner slide_edge">
					<div class="item active">

						<img src="${pageContext.request.contextPath}/resources/images/foot1.png" alt="Los Angeles" style="width: 100%;"height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot2.png" alt="Chicago" style="width: 100%;" height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot3.png" alt="New york" style="width: 100%;"height="50px">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			
			<div>
			<hr> 
			</div>
			
			<!-- calendar -->
			<div id="match-box" style="width: 100%; height: 100px;">
				<div style="width: 5%; height: 100px; float: left;">
					<button id="pre">←</button>
				</div>
				<div id="list"
					style="width: 90%; height: 100px; float: left; overflow: hidden;">
					
					<ul class="nav nav-tabs" id="day-list">
					</ul>
					
				</div>
				<div style="width: 5%; height: 100px; float: left;">
					<button id="next">→</button>
				</div>
			</div>
			<!-- calendar -->
			
			
			
			
			<div class="match-filter" style="border: black solid 1px;"> 
				<div class="match-result" style="border: red solid 1px; padding-top: 3px;">
					<p>${matchView}개의 매치</p>
					<a href="${pageContext.request.contextPath}/matchLList?matchTime=${vo.matchTime}">list</a>				
				</div>
				  
				<div class="match-wrapper" style="border: blue solid 1px">  
					<button class="btn-all-area" data-target="#layerpop" data-toggle="modal" style="border: hidden; background-color: white; padding-top: 3px;" >모든지역</button>

					<!-- <span id="all-area" data-target="#layerpop" data-toggle="modal" style="cursor: pointer; padding-right: 5px;">모든 지역</span> -->
					<span id="all-match" style="cursor: pointer; padding-left: 5px;">모든 매치</span>
				</div>	
				
			</div>
			

			<div class="modal fade" id="layerpop">
			  <div class="modal-dialog"> 
			    <div class="modal-content" style="border-radius: 30px;">
			      
			      <!-- header -->
			      <div class="modal-header" style="margin-top: 10px;">
			        <!-- 닫기(x) 버튼 -->
			        <button type="button" class="close" data-dismiss="modal">취소</button>
			        <!-- header title -->
			        <h4 class="modal-title">경기장 또는 지역</h4>
			      </div>
			      <!-- body -->
			      <div class="modal-body" style="height: 150px;">
			      	<div class="modal-body-filter">
					    <h4>지역을 선택하세요</h4>  
			            <ul class="modal-list" style="list-style: none;">
			            	<li>
			            		<input type="checkbox" id="1" class="filterCheck grey" value="1">
			            		<label for="1" class="checkLabel">서울</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="2" class="filterCheck grey" value="2" >
			            		<label for="2" class="checkLabel">대구</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="3" class="filterCheck" value="3" >
			            		<label for="3" class="checkLabel">경기</label>
			            	</li>
			            	<li>	
			            		<input type="checkbox" id="4" class="filterCheck" value="4" >
			            		<label for="4" class="checkLabel">광주</label>
			            	</li>	
			            	<li>
			            		<input type="checkbox" id="5" class="filterCheck" value="5" >
			            		<label for="5" class="checkLabel">대전</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="6" class="filterCheck" value="6" >
			            		<label for="6" class="checkLabel">인천</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="7" class="filterCheck" value="7" >
			            		<label for="7" class="checkLabel">부산</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="8" class="filterCheck" value="8" >
			            		<label for="8" class="checkLabel">울산</label>
			            	</li>
			            	<li>
			            		<input type="checkbox" id="9" class="filterCheck" value="9" >
			            		<label for="9" class="checkLabel">충북</label>
			            	</li>
			            </ul>
			      	</div>
			      	
			      </div>  
			      <!-- Footer -->
			      <div class="modal-footer" style="background-color: #ffc645; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; text-align: center; cursor: pointer;">
			        	<h5>적용하기</h5>
			 
			      </div>
			      
			    </div>
			  </div>
			</div>




			<div class="container">
				<div class="row">
					<table class="table table-condensed" id="get-day-list">
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
						  
						  
							<%-- <c:if test="${no eq 1}">
								<h1>경기가 없어요</h1>
							</c:if>
							<c:if test="${no ne 1}">
						<c:forEach items="${list}" var="vo">
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
							</c:if> --%>
						
						
					</table>
				</div>
			</div>
			
			
			
			
			
			
		
		</div>
		
	</div>
	
<script type="text/javascript">

	var sysdate = new Date();
	var startDay = parseInt((sysdate.getDate()+100+"").substr(1,3));
	
	$("#next").click(function() {
		$("#day-list").empty();
		startDay = startDay+1;
		getList(startDay);
	})
	getList(startDay);
	getDayList(startDay);
	
	function getList(startDay) {
		$.get("getList?startDay="+startDay, function(result) {
			//console.log(result);
			$("#day-list").append(result);
		})
	}
	
	//1. 날짜를 한번 더 눌렀을 때 중복된 값이 또 나오면 안됌;
	//2. id = day+i의 순서를 정해줘야함
	
	/* $("#list").mouseover(function() {
		$("#day"+0).click(function() {			
			$.get("matchList?matchTime="+startDay, function(result) {
				console.log(result);
				$("#get-day-list").append(result);
			});
		});		 
	}); */
	
	var matchCount = "<c:out value='${matchView}'/>";
	
	/* $("#list").on("click", $("#day"+0), function() {
		if($(".day-list").parent().mouseup()){
			$.get("matchList?matchTime="+startDay, function(result) {
				console.log(result);
				if(matchCount==0){
					$("#get-day-list").append(result);
				}else{
					alert("a");
				}
					    
			});
		}
	}); */
	
	var startDays = parseInt(startDay);
	
	function getDayList() {   
		$("#day-list").on("click", ".day-list", function() {
			for(var i=0; i<1; i++){ 
				
				$.get("matchList?matchTime="+startDays+fu, function(result) {
					$("#get-day-list").append(result);
				});
			}
		});
	}
	
	
	
		
	
	 /* $("#list").on("mouseenter", $("#day"+0), function() {
		$("#day"+0).mouseup(function() {
			$.get("matchList?matchTime="+startDay, function(result) {
				if(matchCount==0){
					$("#get-day-list").append(result);
				}else{
					$("#get-day-list").remove(result);
				}
				      
			});
		});
	}); */
	

	/* $("#day0").click(function() {
		alert("g");
	}); */
	
	
	$(function() {
		$("#all-area").click(function() {
			$('div.modal').modal({
				remote : 'layer.html'
			});
		});
	});
	
	
	$(".checkLabel").click(function() {
		if($(".filterCheck")){
			$(".chec")
			$(".checkLabel").css("background","gray");
		}
		
		if($(".filterCheck")==false){
			$(".checkLabel").css("background","#ffc645");
		}
	});
	
		
</script>
	
	 	
	
	

  
	
	
</body>
</html>
