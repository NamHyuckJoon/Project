<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="/Project/test.css" rel="stylesheet" type="text/css">
<style type="text/css">

div.login {
	overflow:hidden; 
	width:1200px; 
	height: auto; 
	margin: auto; 
	text-align: center;
}
table.login_table {
	margin: auto;
	text-align: center;
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

hr.garo2 {
	border: solid #dedede;
	border-width: 1px 0 0;
}

</style>
<script type="text/javascript">
    function form_chk() {
        if (id.value == "") {
    		alert("아이디를 입력해주세요!")
    		login_form.id.focus();
    		return false;
    	}
        else if (pw.value == "") {
    		alert("비밀번호를 입력해주세요!")
    		login_form.pw.focus();
    		return false;
    	}
        else 
        	return true;
    	
    }
    

 </script>

</head>
<body>
	<%
		if (session.getAttribute("header") != null && session.getAttribute("header").equals("User")) {
	%>
	<%@ include file="/header/Login_header.jsp"%>
	<%
		} else {
	%>
	<%@ include file="/header/header.jsp"%>
	<%
		}
	if(request.getAttribute("fail") != null && request.getAttribute("fail").equals("fail")) { %>
    	<script>alert("아이디 또는 비밀번호가 맞지 않습니다!!");</script>
    <%	
	}
	%>
	<div class="space" style="height: 50px;"></div>
	<div class="space">
		<img src="<%= application.getInitParameter("IMG_SRC")%>/login/LOGIN.JPG">
	</div>
	
	<div class="login">
	<form name="login_form" action="/Login?action=login" onsubmit="return form_chk()" method='post'>
	<table class="login_table">
		<tr>
			<td> ID </td>
			<td width="50px"></td>
			<td ><input type='text' id="id" name="id" style="width:300px"></td>
			<td width="50px"></td>
		</tr>
		<tr>
			<td colspan="4"><hr class="garo2"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td></td>
			<td><input type='password' id="pw" name="pw" style="width:300px"></td>
			<td></td>
		</tr>
		<tr height=25px>
		</tr>
		<tr>
			<td colspan="4"><input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/login/BTN_LOGIN.JPG" name="submit" value=""></td>
		</tr>
	</table>
	</form>
	</div>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>