<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="/test.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	if (session.getAttribute("header") != null && session.getAttribute("header").equals("User")) {
	%>
		<%@ include file="/header/Login_header.jsp" %>
	<%	
	} 
	else {
	%>
		<%@ include file="/header/header.jsp" %>
	<%
	}
	%>
	
	
	<div>
	
		<%= "현재 준비중에 있습니다. \n 잠시 후 메인 페이지로 이동합니다." %>
	
	</div>
	
	

	<%@ include file="/footer/footer.jsp" %>
</body>
</html>