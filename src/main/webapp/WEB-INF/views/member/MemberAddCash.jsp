<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐쉬 충전</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="container">
		<div class="row">캐시 잔액 : ${member.cash}</div>
		<div class="row">
			충전 금액 : <select id="money">
				<option>1000</option>
				<option>3000</option>
				<option>5000</option>
				<option>10000</option>
				<option>20000</option>
				<option>30000</option>
				<option>직접입력</option>
				<c:if test="">
					<ins>
						<input type="text">
					</ins>
				</c:if>
			</select>
		</div>
		<p>충전 방식</p>
		<ul class="nav nav-tabs">
			<li id="Culture"><a href="#">상품권</a></li>
			<li id="CaCaoPay"><a href="#">카카오페이</a></li>
			<li id="PhoneCash"><a href="#">핸드폰</a></li>
		</ul>
		<div class="container" id="howCharge"></div>
	</div>

	<script type="text/javascript">
		var money = $("#money").val();
		$("#money").change(function() {
			money = $("#money").val();
		})
		$("#CaCaoPay").click(function() {
			$("#CaCaoPay").addClass("active");
			$("#Culture").removeClass("active");
			$("#PhoneCash").removeClass("active");
			alert(money);
		})
		$("#Culture").click(function() {
			$("#Culture").addClass("active");
			$("#CaCaoPay").removeClass("active");
			$("#PhoneCash").removeClass("active");
			CultureCharge(money);
			alert(money);
		})
		$("#PhoneCash").click(function() {
			$("#PhoneCash").addClass("active");
			$("#Culture").removeClass("active");
			$("#CaCaoPay").removeClass("active");

			alert(money);
		})

		function CultureCharge(money) {
			$("#howCharge").empty();

			$.get("./CultureCharge?cash=" + money, function(result) {
				console.log(result);
				$("#howCharge").append(result);
			})
		}
	</script>
</body>
</html>