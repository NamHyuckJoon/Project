<%@page import="member.Member_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
.info {
	background-color: #FAFAFA;
	border: 1px solid #BDBDBD;
	padding: 10px;
	width: 350px;
	height: 80px;
	margin: auto;
	border-radius: 10px;
	display: table;
	text-align: center;
}

.info_table {
	display: table-cell;
	vertical-align: middle;
}

hr.garo {
	border: solid #dedede;
	border-width: 1px 0 0;
}

table.succes_table {
	margin: auto;
	text-align: left;
	font: 12px 'Lato', sans-serif;
}

div.space {
	border: none;
	height: 100px;
	margin: auto;
}
input {
	padding-left: 5px;
}

</style>
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
	<% Member_VO mem_vo = (Member_VO)request.getAttribute("join_vo"); %>
	<div class="space" style="height: 50px;"></div>
	<div class="space">
		<img src="<%= application.getInitParameter("IMG_SRC")%>/member/JOIN_COMPLETE.JPG">
	</div>
	<div class="info">
		<div class="info_table">
		<table class="succes_table">
			<tr>
				<td align="left" style="width:100px">아이디</td>
				<td><%=mem_vo.getId() %></td>
			</tr>
			<tr height=15px></tr>
			<tr>
				<td>이름</td>
				<td><%=mem_vo.getName() %></td>
			</tr>
		</table>
		</div>
	</div>
	<div class="space" style="height: 50px;"></div>
	 <span style="font: bold 14px 'Lato', sans-serif;"><%=mem_vo.getName() %></span> 
	 <span style="font: 14px 'Lato', sans-serif;">님의 회원가입이 완료되었습니다. </span>
	 <div style="height:20px"></div>
	 <hr class="garo" style="width:700px">
	 <a href="Login"><img src="<%= application.getInitParameter("IMG_SRC")%>/member/BTN_LOGIN2.JPG"></a>
	 <a href="Main"><img src="<%= application.getInitParameter("IMG_SRC")%>/member/BTN_GOHOME.JPG"></a>

	
	

<%@ include file="/footer/footer.jsp" %>
</body>
</html>