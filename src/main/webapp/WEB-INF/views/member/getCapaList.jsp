<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/boot.jsp"></c:import>
<style>
.capaList {
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
	font-weight: bold;
}
</style>
</head>
<div class="capaList">
	<c:if test="${i eq 0}">
		<p style="text-align: center;">참여 경기가 없습니다.</p>
	</c:if>
	<c:if test="${i gt 0}">
		<table class="table table-hover">
			<tr>
				<td>
					<p>경기 시간
				</td>
				<td>
					<p>경기 구장
				</td>
				<td>
					<p>성별
				</td>
				<td>
					<p style="float: right;">참가 여부
				</td>
			</tr>
			<c:forEach items="${list}" var="vo" varStatus="i">
				<tr>
					<td>
						<p id="time${i.index}">${vo.realTime}</p>
					</td>
					<td>
						<p>${vo.title}</p>
					</td>
					<td>
						<p>
							<c:if test="${vo.gender eq 1}">남성 매치</c:if>
							<c:if test="${vo.gender eq 2}">여성 매치</c:if>
							<c:if test="${vo.gender eq 3}">혼성 매치</c:if>
						</p>
					</td>
					<td><input type="button" id="joinDecision${i.index}" class="decision" style="float : right;"></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<script type="text/javascript">
		$(function() {
			for (var day = 0; day < '${i}'; day++) {
				var matchTime = $("#time"+day).text().trim();
				matchTime = matchTime.split("/");
				if (matchTime[5] == "오후") {
					matchTime[3] = parseInt(matchTime[3]) + 12;
				}
	
				matchTime = new Date(matchTime[0], matchTime[1] - 1,
						matchTime[2], matchTime[3], matchTime[4]);
				var currentTime = new Date();
				if (matchTime > currentTime) {
					$("#joinDecision"+day).prop("value", "참가취소");
					$("#joinDecision"+day).addClass("btn btn-danger");
				}else if (matchTime < currentTime) {
					$("#joinDecision"+day).prop("value", "경기완료");
					$("#joinDecision"+day).prop("disabled","disabled");
					$("#joinDecision"+day).addClass("btn btn-normal");
				}
			}
		})
		
		$(".decision").each(function() {
			$(this).on("click", function () {
				alert($(this).val());
				
				//참가 취소 코드 ++ 
			})
		})
	</script>
</div>
</html>