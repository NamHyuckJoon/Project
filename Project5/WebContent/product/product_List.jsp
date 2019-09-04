<%@page import="vo.Product_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><!-- html5 선언 -->
<html>
<head>
<link href="/test.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<title>일상을 입다, ONDAILY</title>
	<script src="jquery-3.2.1.min.js"></script>
	<style>
			a.test:link { color: black; text-decoration: none;}
 			a.test:visited { color: black; text-decoration: none;}
 			a.test:hover { color: black;}
		table.list_table { margin:auto;}
		div.list_font {
			text-align: center;
		font: 11px 'Lato', sans-serif;
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
	
	<div style="height:100px"></div>

	<table class="list_table">	
	<%
			ArrayList<Product_VO> arr = (ArrayList<Product_VO>)request.getAttribute("product_List");
			int i;
			int a=4;
			int size = arr.size();
			int size_chk = arr.size();
			int z=0;
			
			for(int j=0; j<=(size/4) ; j++ ){
		%>
		<tr align="center"> 
		<%
	
		for(i=0;i<4;i++){
			
			if(size_chk <= 0)
				break;
			
		%>
			<td>
				<%-- <form name="myForm" action="/product/product_Detail.jsp" method="POST">
					<input type="hidden" name="product_code" value=<%=vo.getProduct_code() %>/>
				</form>
				<a href="/product/product_Detail.jsp" onclick="javascript:document.myForm.submit();"> --%>
				<a href="/product/product_Detail.jsp?product_code=<%=arr.get(z).getProduct_code() %>">
				
				
				<img src="<%=arr.get(z).getProduct_img() %>"  width="300px" height="300px" style="opacity:1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1.0'"/></a><br>
				<div class="list_font">
				<%=arr.get(z).getProduct_name() %><br>
				<%=arr.get(z).getProduct_price() %><br>
				</div>
				
			</td>		
		<% 
				z++;
				size_chk--;
			
		}//for(ProductVO vo : arr) end
		%>	
		</tr>
		<tr> <td height=30px> </td> </tr>	
	<%
	}//size end
	%>	
	</table>
	
	<h4 align="center">
		<c:forEach var="i" begin="1" end="${totalPage }">
            <a class="test" href="Product_List?category_code=<%=request.getParameter("category_code")%>&pagenum=${i}">${i }</a>&nbsp;                  
		</c:forEach> 
	</h4>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>