<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐쉬 충전</title>
<c:import url="../template/boot.jsp" />
<script src="../resources/js/kakao.js"></script>
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="container">
		<div class="row">캐시 잔액 : ${member.cash}</div>
		<div class="row">
			충전 금액 : <select id="money">
				<option>1000</option>
				<option>3000</option>
				<option selected="selected">5000</option>
				<option>10000</option>
				<option>20000</option>
				<option>30000</option>
				<option>직접입력</option>
			</select>
		</div>
		<div class="row" id="self"></div>
		<br>

		<p>충전 방식</p>
		<ul class="nav nav-tabs">
			<li id="Culture"><a href="#">상품권</a></li>
			<li id="CaCaoPay"><a href="#">카카오페이</a></li>
			<li id="PhoneCash"><a href="#">핸드폰</a></li>
		</ul>
		<div class="container" id="howCharge"></div>
	</div>

	<script type="text/javascript">
		var money = parseInt($("#money").val());
		$("#money")
				.change(
						function() {
							money = $("#money").val();

							if (money == '직접입력') {
								$("#self")
										.append(
												'<input type="text" placeholder="금액입력" id="selfMoney">');
							} else {
								$("#self").empty();
							}
						})
		$("#self").on("blur", "#selfMoney", function() {
			money = $("#selfMoney").val();
			alert("결제금액:" + money);
		})

		/* 금액 선택 및 직접입력   */
		$("#CaCaoPay").click(function() {
			$("#CaCaoPay").addClass("active");
			$("#Culture").removeClass("active");
			$("#PhoneCash").removeClass("active");
			alert(money);
			KakaoPay(money);
		})
		$("#Culture").click(function() {
			$("#Culture").addClass("active");
			$("#CaCaoPay").removeClass("active");
			$("#PhoneCash").removeClass("active");
			CultureCharge(money);
		})
		$("#PhoneCash").click(function() {
			$("#PhoneCash").addClass("active");
			$("#Culture").removeClass("active");
			$("#CaCaoPay").removeClass("active");
		})

		function CultureCharge(money) {
			$("#howCharge").empty();
			$.get("./charge/CultureCharge?cash=" + money, function(result) {
				$("#howCharge").append(result);
			})
		}
		function KakaoPay(money) {
			$("#howCharge").empty();
			$.get("./charge/KakaoPayCharge?cash=" + money, function(result) {
				$("#howCharge").append(result);
			})
		}
		
		/* 결제 방법 선택 */
		$("#howCharge").on("click", "#kakaobtn", function() {
			$.post("./KakaoPay",{money : money},function(result) {
				alert("OK");
			})
			
		});


		/* 					$.ajax({
		 type : "post",
		 url : "./KakaoPayCharged",
		 data : {
		
		 }
		 }) */
			/* Kakao.init('c5126e0fcae8eba0e1ed7a9c58dc7812');
			Kakao.API.request({
				url : '/v1/payment/ready',
				data : {
				Authorization : 'KakaoAK 9cd9eafac1eac29eb3a3a8e894c16f31',
				cid : "TC0ONETIME",
				partner_order_id : 'K2JS',
				partner_user_id : '${member.id}',
				item_name : 'cash',
				quantity : 1,
				total_amount : money,
				vat_amount : 200,
				tax_free_amount : 0,
				approval_url : './charge/Success',
				fail_url : './charge/Fail',
				cancel_url : './charge/Cancel'},
				success : function(res) {
					alert('성공');
				},
				fail : function(error) {
					alert('실패');
				}
			}) */
		/* 카카오페이 결제 */
	</script>
</body>
</html>