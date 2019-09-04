<%@page import="board.Notice_VO"%>
<%@page import="java.util.Iterator"%>
<%@page import="product.Product_VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery-3.2.1.min.js"></script>
<title>일상을 입다, ONDAILY</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
 a.test:link { color: red; text-decoration: none;}
 a.test:visited { color: black; text-decoration: none;}
 a.test:hover { color: blue;}

body {
	width : 1200px;
}

div.main {
	overflow:hidden; 
	width:1200px; 
	height: auto; 
	margin: auto; 
	text-align: center;
}

table.board {
/* 	margin: auto; */
	float:left;
	text-align: center;
	font: 12px 'Lato', sans-serif;
}

table.board2 {
/* 	margin: auto; */
	float:right;
	text-align: center;
	font: 12px 'Lato', sans-serif;
}



table.main_table {
 	margin: auto;
	text-align: center;
	width : auto;
	font: 12px 'Lato', sans-serif;
	border-top: 1px solid #444444;
	border-collapse: separate;
 	border-spacing: 50px 30px;
	font: bold 12px 'Lato', sans-serif;
}

hr.garo2 { border: solid #dedede; border-width: 1px 0 0;}

</style>

<script type="text/javascript">
var count = 1;
var $sumImg;

$(document).ready(function (e) {
   setInterval(onChange, 2500);
   $sumImg=$("#img1");
});

function onChange() {
   count++;
   $sumImg.attr("src", "http://ci2017whiteday.dongyangmirae.kr/JSP/main_img" + count + ".PNG");
   if (count >= 2) {
      count = 0;
   }
}
</script>
</head>

<body>
	<%
	if (session.getAttribute("header") != null && session.getAttribute("header").equals("User")) {
	%>
		<%@ include file="/header/Login_header.jsp" %>
		<img id="img1" src="http://ci2017whiteday.dongyangmirae.kr/JSP/main_img1.PNG" align="middle" width='1200px' height='500px'>
	<%	
	}
	else if (session.getAttribute("header") != null && session.getAttribute("header").equals("Admin")) {
	%>
		<%@ include file="/header/Admin_header.jsp" %>
		<img id="img1" src="http://ci2017whiteday.dongyangmirae.kr/JSP/main_img1.PNG" align="middle" width='1200px' height='500px'>
	<%	
	} 
	else {
	%>
		<%@ include file="/header/header.jsp" %>
		<img id="img1" src="http://ci2017whiteday.dongyangmirae.kr/JSP/main_img1.PNG" align="middle" width='1200px' height='500px'>
	<%
	}
	%>
	
	<!--  메인 하단 상품 부 -->
	<% 
		@SuppressWarnings("unchecked")
		ArrayList<Product_VO> product_list = (ArrayList<Product_VO>)session.getAttribute("product_list");
		Iterator<Product_VO> it_pd_list = product_list.iterator();
		Product_VO product_vo = new Product_VO();
	%>
	
	<div style="height:50px"></div>
	
	<div class="main">
	<form>
		<table class="main_table">
			<% while (it_pd_list.hasNext()) { %>
				<tr>
				<% for(int pd_list_cnt=0; pd_list_cnt < 4 ; pd_list_cnt++) { 
					if (it_pd_list.hasNext() == false) 
						break;
						product_vo = it_pd_list.next();
						%>
					<td width='25%' height='25%'>

						<a href="/product/product_Detail.jsp?product_code=<%=product_vo.getProduct_code() %>" >
						<img src="<%= product_vo.getProduct_img() %>" style="width:100%; height:100%; opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1.0'"></a> <br><br>
						<%= product_vo.getProduct_name() %> <br><br>
						<hr class="garo2"><br>
						<% pageContext.setAttribute("product_price", product_vo.getProduct_price()); %>
						<fmt:formatNumber value="${product_price }" groupingUsed="true"/>
					</td>
				<% } %>	
				</tr>
			<% } %>
		</table>
	</form>
	</div>
	
	<div style="height:50px"></div>
	
	<img src="<%= application.getInitParameter("IMG_SRC")%>/main/COMMUNITY_INDEX.PNG" align="middle" width="1200px">
	
	<div style="height:50px"></div>
	
	
	<%
	@SuppressWarnings("unchecked")
	ArrayList<Notice_VO> notice_list = (ArrayList<Notice_VO>)session.getAttribute("notice_list"); 
	%>
	<div class="main">
	<table class="board">
		<tr>
			<td width=300px align="left" style="padding-left:10px">공지사항</td>
			<td width=100px align="right" style="padding-right:10px"><a class="test" href="http://localhost:8081/board/Board_Notice.jsp">더보기</a></td>
		</tr>
		<tr>
			<td colspan='2'><hr></td>
		</tr>
		<% for(Notice_VO notice_vo : notice_list) { %>
		<tr>
			<td height="25px" align="left" style="padding-left:10px"><%= notice_vo.getTitle() %></td>
			<td align="right" style="padding-right:10px"><%= notice_vo.getTime() %></td>
		</tr>
		<% } %>			
	</table>
	
	
	<table class="board2">
		<tr>
			<td width=300px align="left" style="padding-left:10px">자주묻는질문</td>
			<td width=100px align="right" style="padding-right:10px"><a class="test" href="http://localhost:8081/board/Board_FAQ.jsp">더보기</a></td>
		</tr>
		<tr>
			<td colspan='2'><hr></td>
		</tr>
		<% for(Notice_VO notice_vo : notice_list) { %>
		<tr>
			<td height="25px" align="left" style="padding-left:10px"><%= notice_vo.getTitle() %></td>
			<td align="right" style="padding-right:10px"><%= notice_vo.getTime() %></td>
		</tr>
		<% } %>					
	</table>
	</div>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>