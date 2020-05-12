<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="match-filter" style="border: black solid 1px;">
	<div class="match-result"
		style="border: red solid 1px; padding-top: 3px;">
		<p>${i}개의매치</p>
	</div>

	<div class="match-wrapper" style="border: blue solid 1px">
		<button class="btn-all-area" data-target="#layerpop"
			data-toggle="modal"
			style="border: hidden; background-color: white; padding-top: 3px;">모든지역</button>

		<!-- <span id="all-area" data-target="#layerpop" data-toggle="modal" style="cursor: pointer; padding-right: 5px;">모든 지역</span> -->
		<span id="all-match" style="cursor: pointer; padding-left: 5px;">모든매치</span>
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
						<li><input type="checkbox" id="1" class="filterCheck grey"
							value="1"> <label for="1" class="checkLabel">서울</label></li>
						<li><input type="checkbox" id="2" class="filterCheck grey"
							value="2"> <label for="2" class="checkLabel">대구</label></li>
						<li><input type="checkbox" id="3" class="filterCheck"
							value="3"> <label for="3" class="checkLabel">경기</label></li>
						<li><input type="checkbox" id="4" class="filterCheck"
							value="4"> <label for="4" class="checkLabel">광주</label></li>
						<li><input type="checkbox" id="5" class="filterCheck"
							value="5"> <label for="5" class="checkLabel">대전</label></li>
						<li><input type="checkbox" id="6" class="filterCheck"
							value="6"> <label for="6" class="checkLabel">인천</label></li>
						<li><input type="checkbox" id="7" class="filterCheck"
							value="7"> <label for="7" class="checkLabel">부산</label></li>
						<li><input type="checkbox" id="8" class="filterCheck"
							value="8"> <label for="8" class="checkLabel">울산</label></li>
						<li><input type="checkbox" id="9" class="filterCheck"
							value="9"> <label for="9" class="checkLabel">충북</label></li>
					</ul>
				</div>

			</div>
			<!-- Footer -->
			<div class="modal-footer"
				style="background-color: #ffc645; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; text-align: center; cursor: pointer;">
				<h5>적용하기</h5>

			</div>

		</div>
	</div>
</div>


<div class="container">
	<div class="row">

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
				<td>${vo.count}</td>
				<td>${vo.gender}</td>
				<td>${vo.capacity}</td>
			</tr>
			<br>
		</c:forEach>
 
		<c:catch>
			<c:if test="${i eq 0}">
				<h1>경기가 없어요</h1>
			</c:if>
		</c:catch>



	</div>
</div>

		<%-- <c:forEach items="${matchs}" var="vo">
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
			<br>
		</c:forEach> --%>

