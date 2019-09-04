<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="test.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
/* 	String back = session.getAttribute("back").toString(); */
	session.invalidate();
%>
<script>
	alert('로그아웃 되었습니다!');
	location.href="/Main";
	// .jsp가 노출되는 문제가..
</script>
	
	
	

</body>
</html>