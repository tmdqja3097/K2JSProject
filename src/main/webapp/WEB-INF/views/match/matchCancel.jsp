<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소 화면</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
body {
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
	font-weight: bold;
}

body>p>span {
	color: blue;
}

.warning {
	font-weight: 5px;
	color: red;
}
</style>
</head>
<body>
	<p>
		<span><환급률 안내></span> *2일 전 : 100% 환급/1일 전 : 80% 환급 /당일 매치 시간 전까지: 30% 환급
	</p>
	<p>당일 1시간 30분 미만: 0% 환급 *취소 환급액은 취소일에 따라 비율이 상이하며 취소 없이 무단 불참 시 서비스
		이용에 제한이 있을 수 있습니다.</p>
	<p>경기 변경 또한 같은 환급률이 적용되오니 신중히 신청 부탁드립니다.</p>
	<br>
	<br>
	<p class="warning">※취소확인시 바로 취소가 진행되며 환불금액이 입금됩니다.</p>
		<input type="text" hidden="hidden" name="num" value="${num}" id="num">
		<input type="checkbox" id="reqchbox" required="required"> <input
			type="submit" id="reqBtn" value="취소 약관에 동의합니다.">
	<script type="text/javascript">
	$("#reqBtn").click(function() {
		if($("#reqchbox").prop("checked") == true){
			var num = $("#num").val();
			$.post("./matchCancel",{num : num}, function(result) {
				if(result >0) {
					close();
					opener.document.location.reload();
					}
				})
			}
		})
	</script>
</body>

</html>