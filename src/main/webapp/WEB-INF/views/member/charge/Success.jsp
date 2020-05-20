<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공 !</title>
</head>
<body>
	결제일시: ${info.approved_at}
	<br /> 주문번호: ${info.partner_order_id}
	<br /> 상품명: ${info.item_name}
	<br /> 결제금액: ${info.amount.total}
	<br /> 결제방법: ${info.payment_method_type}
	<br />
</body>
</html>