<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function test() {
	cart_form.action = "/WebProject/Cart?action=cart_insert&cart_img=/WebProject/IMG/EDIT.JPG&cart_name=하늘색원피스&cart_size=S&cart_amount=1&cart_price=50000&product_code=100111";	
	cart_form.submit();
}

function test2() {
	cart_form.action = "/WebProject/Cart?action=cart_insert&cart_img=/WebProject/IMG/EDIT.JPG&cart_name=분홍색셔츠&cart_size=M&cart_amount=1&cart_price=33000&product_code=250";	
	cart_form.submit();
}

function test3() {
	cart_form.action = "/WebProject/Cart?action=cart_insert&cart_img=/WebProject/IMG/EDIT.JPG&cart_name=노란색치마&cart_size=L&cart_amount=1&cart_price=12000&product_code=350";	
	cart_form.submit();
}
</script>
</head>
<body>
	<%
	if (session.getAttribute("header") != null && session.getAttribute("header").equals("User")) {
	%>
		<%@ include file="/header/Login_header.jsp" %>
	<%	
	}
	else if (session.getAttribute("header") != null && session.getAttribute("header").equals("Admin")) {
	%>
		<%@ include file="/header/Admin_header.jsp" %>
	<%	
	} 
	else {
	%>
		<%@ include file="/header/header.jsp" %>
	<%
	}
	%>
	
	<form name="cart_form" method="post">
		<input type="button" value="test" onclick="test()">
		<input type="button" value="test" onclick="test2()">
		<input type="button" value="test" onclick="test3()">
	</form>

<%@ include file="/footer/footer.jsp" %>
</body>
</html>