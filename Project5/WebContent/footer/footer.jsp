<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>일상을 입다, ONDAILY</title>
<script src = "/jquery-3.2.1.min.js"></script>

<style type="text/css">

table.footer {
	border : none;
	border-spacing: 0 0;
	border-bottom: none;
	margin-right:auto;
}

table.footer td {
	font: 12px 'Lato', sans-serif;
	border-bottom: none;
}


div.footerspace {
	width:1200px;
	height: 100px;
	margin: auto;
}

div.footer_admin_info {
	display:table; 
	margin-left:auto; 
	margin-right:auto; 
	width:1200px;
}


hr.top {
	border: solid #000000;
	border-width: 5px 0 0;
}

hr.footer_hr {
	border: solid #BDBDBD;
	border-width: 1px 0 0;
}

</style>

<script type="text/javascript">
 	function goTop() {
		 window.scrollTo(0,0);
 	}
	
	
</script>
</head>
<body>
<div style="height:50px"> </div>

<div class="footerspace">
 <table class="footer">
	<tr>
		<td width='650px' align="right">
			<hr class="top">
		</td>
		<td>
			<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/footer/TOP.PNG" name="button" value="" onClick="goTop()" style="outline: none;">
		 </td>
		<td width='650px'>
			<hr class="top">
		</td>
	</tr>
</table>
</div>

<div class="footer_admin_info">
<hr class="footer_hr">

	<table class="footer">
		<tr><td height="10px"></td></tr>
		<tr>
			<td>
				<img src="<%= application.getInitParameter("IMG_SRC")%>/footer/FOOTER_LOGO.PNG">
			</td>
		</tr>
		<tr>
			<td>
				COMPANY 온데일리 OWNER 4조
			</td>
		</tr>
		<tr> <td height="10px"></td> </tr>
	</table>
	
<hr class="footer_hr">
</div>

<div style="height:100px"></div>

</body>
</html>