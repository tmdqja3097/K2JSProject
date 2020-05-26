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
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.header {
	height: 50px;
	color: black;
	line-height: 50px;
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
	font-weight: bold;
	text-shadow: black;
	font-size: 24px;
	border-bottom: 0.5px solid black;
}

.nav-tabs>li>a {
	height: 60px;
	width: 100%;
	line-height: 60px;
	box-sizing: border-box;
}
.nav>li>a{
padding : 0 24px;
}

.chargeMethod {
padding-top : 10px;
box-sizing:border-box;
border-top : 0.5px solid black;
border-bottom : 0.5px solid black;
}
.remain {
font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
		font-size : 11px;
		font-weight: bold;
}
.remain>span {
color : #ff3300;
}
#selfMoney {
	width : 152px;
}
</style>
</head>
<body>
	<div class="header"><i class="fas fa-coins"></i> 캐쉬 충전</div>
	<br>
	<div>
		<span id="remainCash" hidden="hidden">${remainCash}</span>
		<div class="remain">(캐시 잔액 : <span>${member.cash}</span>)</div>
		<div >
			결제 금액 : <select id="money">
				<option>1000</option>
				<option>3000</option>
				<option selected="selected">5000</option>
				<option>10000</option>
				<option>20000</option>
				<option>30000</option>
				<option>직접입력</option>
			</select>
		</div>
		<div id="self"></div>
		<br>

		<div class="chargeMethod">
			<p>결제 수단</p>
			<ul class="nav nav-tabs">
				<li id="Culture"><a href="#">상품권</a></li>
				<li id="KaCaoPay"><a href="#">카카오페이</a></li>
				<li id="PhoneCash"><a href="#">핸드폰</a></li>
			</ul>
		</div>
		<div class="container" id="howCharge"></div>
	</div>

	<script type="text/javascript">
		var remainCash = $("#remainCash").text();
		var money = 0;
		money = parseInt($("#money").val());
		$(function() {
			if (remainCash > 0) {
				money = $("#money").val("직접입력");
				$(this).prop("selected", "selected");
				change(remainCash);
				money = remainCash;
			}
		})
		function change(remainCash) {
			$("#self")
					.append(
							'<input type="text" placeholder="금액입력" maxlength="6" id="selfMoney" value="'+remainCash+'">');
		}
		$("#money").change(function() {
			money = $("#money").val();

			if (money == '직접입력') {
				change(remainCash);
			} else {
				$("#self").empty();
			}
		})
		$("#self").on("blur", "#selfMoney", function() {
			money = $("#selfMoney").val();
		})
		/* 금액 선택 및 직접입력   */
		$("#KaCaoPay").click(function() {
			$("#CaCaoPay").addClass("active");
			$("#Culture").removeClass("active");
			$("#PhoneCash").removeClass("active");
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
			PhoneCharge(money);
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
		function PhoneCharge(money) {
			$("#howCharge").empty();
		}

		/* 결제 방법 선택 */
		$("#howCharge").on("click", "#kakaobtn", function() {
			alert(money);
			/* 			 		open("./KakaoPay?money=" + money, "_blank",
			 "width=500, height=600", true);  */
			location.href = "./KakaoPay?money=" + money;

		});

		/* 카카오페이 결제 */
	</script>
</body>
</html>