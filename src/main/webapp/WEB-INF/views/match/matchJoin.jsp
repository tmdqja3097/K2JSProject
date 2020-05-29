<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.orderTitle {
	padding-top: 30px;
}

.orderTitle h2 {
	font-size: 24px;
	font-weight: 300;
	border-bottom: 3px solid #FFC645;
	display: inline-block;
	margin-bottom: 8px;
	margin-left: 15px;
}

form.orderForm {
	max-width: 480px;
	margin: 0 auto;
}

form.orderForm .orderInfo h3 {
	color: #3540A5;
	font-weight: bolder;
	font-size: 20px;
	margin-left: 15px;
}

form.orderForm fieldset h3 {
	margin-bottom: 10px;
}

form.orderForm .inputWrapper {
	width: 73%;
	float: left;
}

form.orderForm .inputWrap label {
	float: left;
	width: 20%;
	margin: inherit;
	line-height: 3.5;
	display: inherit;
	font-size: 14px;
	font-weight: normal;
	margin-left: 10px;
}

fieldset .inputWrap select {
	width: 100%;
}

select {
	padding: 15px 10px;
	border-radius: 6px;
	border: 1px solid #ddd;
	box-shadow: none;
	outline: none;
	color: #333333;
	background-color: #fafafa;
	font-size: 16px;
	appearance: none;
	box-sizing: border-box;
}

form.orderForm .orderPay fieldset {
	margin-bottom: 20px;
	padding-bottom: 20px;
}

form.orderForm .orderPay {
	background-color: #3540A5;
	color: white;
	padding: 20px;
	margin-top: 30px;
}

.payment h3 {
	color: #FFC645;
	font-size: 18px;
	font-weight: bold;
}

form.orderForm fieldset h3 {
	margin-bottom: 10px;
}

.payRow span {
	float: left;
	font-size: 12px;
	line-height: 32px;
}

.payRow p {
	width: 50%;
	float: right;
	font-size: 18px;
	line-height: 32px;
	text-align: right;
	margin: inherit;
}

.payRow:last-child {
	border-top: 1px solid rgba(255, 255, 255, 0.3);
	padding-top: 10px;
	margin-top: 10px;
}

.payRow {
	overflow: auto;
	border-top: 1px solid rgba(255, 255, 255, 0.3);
	padding: 10px 0px;
	line-height: 20px;
}

.payRow .addFee {
	color: #FFC645;
	font-size: 24px;
}

.payment .confirm {
	padding: 10px 0;
	border-top: 1px solid rgba(255, 255, 255, 0.3);
}

.confirm {
	margin: 20px 0 10px 0;
	position: relative;
}

#confirmTP {
	float: left;
}

#agreeTP {
	margin-left: 10px;
	font-weight: normal;
}

#confirmCorona {
	float: left;
	position: absolute;
}

#agreeCorona {
	margin-left: 20px;
	font-weight: normal;
	float: left;
	position: absolute;
}

.payment .termBox {
	background-color: white;
	border-radius: 4px;
	padding: 20px;
	color: #666;
	font-size: 12px;
	line-height: 18px;
}

.box2 {
	margin-top: 40px;
}

.btnWrap {
	margin-top: 20px;
	width: 100%;
	text-align: center;
}

.btn.order {
	background-color: #FFC645;
	width: 80%;
	font-size: 18px;
	line-height: 18px;
	margin: 0 auto;
	color: #3540A5;
	border-radius: 100px;
	padding: 15px 10px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div>
		<form action="./matchJoin" id="form" class="orderForm" method="post">

			<input type="text" name="count" hidden="hidden"
				value="${matchVO.count}"> <input type="hidden"
				class="form-control" id="num" name="num" value="${matchVO.num}">
			<input type="hidden" class="form-control" id="id" name="id"
				value="${member.id}">


			<div class="orderTitle">
				<h2>${matchVO.fullTime}</h2>
				<h2>${matchVO.stadiumName}</h2>
			</div>
			<div class="orderInfo">
				<fieldset>
					<h3>신청 정보</h3>
					<div class="inputWrap" style="display: block;">
						<label>신청 인원</label>
						<div class="inputWrapper">
							<select name="counted" id="count" class="inputFull">
								<c:forEach end="${16-matchVO.count}" var="i" begin="1">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="orderPay">
				<fieldset class="payment">
					<h3>결제</h3>
					<div class="payRowWrap">
						<div class="payRow">
							<span>이용 금액</span>
							<div id="result_pay">
								<p id="match_cash">10,000원</p>
							</div>
						</div>
						<div class="payRow">
							<span id="remain_cash"> 캐시 차감(잔여:${member.cash-10000}원) </span> <input
								type="text" hidden="hidden" name="dicountMoney"
								id="dicountMoney">
							<div id="result_cash">
								<p id="sum_cash" class="addFee">10,000원</p>
							</div>
						</div>
						<span id="memberCash" hidden="hidden">${member.cash}</span>
					</div>
					<div class="confirm">
						<input type="checkbox" name="#" class="checkbox" id="confirmTP">
						<label for="confirmTP" id="agreeTP"> 아래 환불규정 및 주의사항에
							동의합니다. </label>
					</div>
					<div class="termBox box1">
						- 경기 2일전: 전액 환급<br> - 경기 1일전: 참가비의 80% 환급<br> - 경기 당일
						90분 전: 참가비의 20% 환급<br> - 경기 당일 90분 미만: 0%<br> - 인원 부족으로
						경기가 취소될 경우에는 최소 1시간 30분 전에 개별적으로 매치 취소 안내를 드리며 해당 캐시는 당일내로 전액 환급
						처리됩니다.<br> - 매치시작 1시간 30분 전까지 취소하지 않고 불참하면 향후 이용의 제한이 있습니다.<br>
						- 비가 와도 인원이 모이면 진행하고 있습니다. 신청 시에 미리 일기 예보 확인 부탁드리며 당일 무단 불참 시 추후
						서비스 이용이 제한됩니다. 참석이 어려울 경우 꼭 취소 신청 바랍니다.<br> - 경기 중 부상에 대한 책임은
						해당 개인에게 귀속됩니다.<br> - 보험 등록 관련 안내 <a href="#"
							style="outline: none; color: rgb(53, 52, 165); text-decoration-line: underline; cursor: pointer; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">자세히
							보기</a>
					</div>
					<div class="confirm">
						<input type="checkbox" name="#" class="checkbox"
							id="confirmCorona"> <label for="confirmCorona"
							id="agreeCorona">4/24 ~ 5/6 기간 동안 이태원 인근에 방문하신 사실이 없음에
							동의합니다</label>
					</div>
					<div class="termBox box2">
						<p>
							<span
								style="color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">코로나
								예방을 위하여 최근&nbsp;</span><strong
								style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">4/24
								~ 5/6 기간 동안 이태원 인근에 방문 이력이 있으신 분은 참가를 제한</strong><span
								style="color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">하고
								있습니다. 또한 경기 중&nbsp;</span><strong
								style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">팀
								밸런스 조정을 위한 조끼 교환을 진행하지 않습니다.</strong><br
								style="outline: none; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">
							<br
								style="outline: none; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">
							<span
								style="color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">방문
								사실을 거짓으로 진술하거나 고의로 사실을 누락·은폐하여 매치를 참여하지 않도록 협조 바랍니다.</span><br
								style="outline: none; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">
							<br
								style="outline: none; color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">
							<span
								style="color: rgb(102, 102, 102); font-family: &amp; amp; amp; amp; quot; Apple SD Gothic Neo&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Noto Sans CJK KR&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , dotum , gulim, sans-serif; font-size: 12px;">원활한
								진행을 위하여 매니저 안내에 많은 협조 부탁드립니다.</span><br>
						</p>
					</div>
				</fieldset>
				<div class=btnWrap>
					<input type="button" id="btnApply" class="btn order"
						value="결제 및 신청">
				</div>

			</div>

		</form>
	</div>

	<script type="text/javascript">
		var member_cash = $("#memberCash").text();
		var remainCash = member_cash-10000;
		$("#remain_cash").text("캐시 차감(잔여:"+remainCash+"원)");
		
		getFirstRemainCash();
		
		$("#count").change(function() {
			$("#result_pay").empty();
			$("#result_cash").empty();
			var count = $("#count").val();
			count = (count*10000);
			remainCash = member_cash-count;
			$("#dicountMoney").val(count);
			if(remainCash>=0){
				$("#remain_cash").text("캐시 차감(잔여:"+remainCash+"원)");
			}else{
				$("#remain_cash").text("잔액 부족");
			}
			$("#result_cash").html('<p id="sum_cash" class="addFee">'+count.toLocaleString()+' 원</p>'); 
			$("#result_pay").html('<p id="match_cash">'+count.toLocaleString()+' 원</p>'); 
		})
		
		function getFirstRemainCash(){
			if(${member.cash-10000} < 0){
				$("#remain_cash").text("잔액 부족"); 
			}
		}
		
		$("#btnApply").click(function(){
			var ch1 = $("#confirmCorona").prop("checked")
			var ch2 = $("#confirmTP").prop("checked")
			var ch3 = true;
			var count = $("#count").val();
			count = (count*10000);
			$("#dicountMoney").val(count);
			if(ch1&&ch2){
				if($("#remain_cash").text()=="잔액 부족"){
					var check = confirm("잔액이 부족합니다. 캐시를 충전하시겠습니까?");
					if(check){
						open("${pageContext.request.contextPath}/member/MemberAddCash?remainCash="+(-remainCash),"_blank","width=500 height=500");	
					}
				} else{
				$("#form").submit();
				}
			}else{
				alert("환불  규정 및 코로나 관련 주의 사항에 동의해주세요"); 
			}
		});
	</script>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>