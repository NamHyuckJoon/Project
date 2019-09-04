<%@page import="member.Member_VO"%>
<%@page import="java.util.HashMap"%>
<%@page import="cart.Cart_VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="/test.css" rel="stylesheet" type="text/css">
<style type="text/css">

div.cart {
	overflow:hidden; 
	width:1200px; 
	height: auto; 
	margin: auto; 
	text-align: center;
}

table.cart_table {

	width:100%;
	margin: auto;
	text-align: center;
	font: 13px 'Lato', sans-serif;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.cart_table td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 div.cart_option {
 	font: 10px 'Lato', sans-serif;
 	color : #585858;
 }
  
  
div.space {
	border: none;
	height: 100px;
	margin: auto;
}

.accountstyle {
	position:absolute;
	font-size:12px;
	padding-top:9px;
	padding-left:30px;
	cursor: pointer;
}
  
  
.order_price {
	font-weight : bold;
}
   
</style>


<script type="text/javascript">

function order() {
	cart_form.action = "/Cart?action=order";
	return true;
}

function all_order() {
	alert("테스트");
}

function amount_update(product_code) {
	cart_form.action = "/Cart?action=amount_update&product_code="+product_code;
	cart_form.submit();
}

function order_delete(product_code) {
	if (confirm("정말 삭제하시겠습니까?") ) {
		cart_form.action = "/Cart?action=order_delete&product_code="+product_code;
	
	} 
	else {
		return false;
	}
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
	<div style="height: 50px;"></div>
	<div class="space">
		<img src="<%= application.getInitParameter("IMG_SRC")%>/cart/CART.PNG">
	</div>
	<div style="height:25px"></div>
	
	<div class="cart">
	 <!--  회원님 , 적립금 등 표현 -->
	 <% 
	 if ( session.getAttribute("id") != null ) {
	 	Member_VO mem_vo = (Member_VO)session.getAttribute("mem_vo");
	 %>
	 	<table class="cart_table">
	 		<tr>
	 			<td width="250px" height="100px">
	 				<img src="<%= application.getInitParameter("IMG_SRC")%>/cart/GIFT_INFO.PNG">
	 			</td>
	 			<td align="left" style="background-color:#FAFAFA">
<%--  	 				<%= mem_vo.getName() %> 님은
	 				<%= mem_vo.getMember_admin() %> 회원입니다. 아래 내용을 확인해주세요. <br><br> --%>
	 				
	 				<!-- 임시 장바구니 추가용 input box 필요 -->
	 				
	 				<%-- <div class="accountstyle">계정신청</div>
	 				<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/cart/SAVE_MONEY.PNG" value="가용적립금  <%= 1000  %> 원"/> --%>
	 				<!--  대체 버튼안에 글씨는 어떻게? 집에가서 해야하나 -->
	 			</td>
	 		</tr>
	 	</table>
	</div>
	<div class="space" style="height: 50px;"></div>
	<% } %>
	
	<div class="cart"> <!--  장바구니 -->
	<form name="cart_form" action="/Cart"  method='post'>
		<table class="cart_table">
			<tr>
				<td width=50px height=30px><input type='checkbox'></td>
				<td>이미지</td>
				<td>상품정보</td>
				<td>판매가</td>
				<td>수량</td>
				<td>합계</td>
				<td>선택</td>
			</tr>
<%
	// 장바구니 리스트 조회
	@SuppressWarnings("unchecked")	
	ArrayList<Cart_VO> cart_list = (ArrayList<Cart_VO>)session.getAttribute("cart_list");

 	int cnt = 0; 
 	int order_price=0;
 	
 	if (cart_list != null && cart_list.size() >= 1) {
 	
		HashMap<String, Integer> amount_map = new HashMap<String, Integer>();

		for (int i=cart_list.size()-1 ; i >=0 ; i-- ) {
			Cart_VO cart_vo = cart_list.get(i);
			pageContext.setAttribute("price", cart_vo.getCart_price()); // 상품 당 가격
			pageContext.setAttribute("sum_price",
					Integer.parseInt(cart_vo.getCart_price()) * Integer.parseInt(cart_vo.getCart_amount())); // 상품 * 갯수 가격
					
			amount_map.put(cart_vo.getProduct_code(), cnt);
			cnt++;
%>			
			<tr>
				<td style="line-height:75px">	<input type='checkbox'>	</td>
				<td>	<img src="<%=cart_vo.getCart_img() %>" width="50px" height="50px">	</td>
				<td align="left">	
						<%=cart_vo.getCart_name() %><br><br>
						<div class="cart_option">
						<% if (cart_vo.getCart_size() != null) { %>
					   	[사이즈 : <%=cart_vo.getCart_size() %> ]
					   	<% } %>
					   	<% if (cart_vo.getCart_color() != null) { %>
					   	[색상 : <%=cart_vo.getCart_color() %>]
					   	<% } %>
					   	</div>
				</td>
				<td>	<fmt:formatNumber value="${price }" groupingUsed="true"/>	</td>

				<td>	
						<input type='number' name="cart_amount" value="<%=cart_vo.getCart_amount() %>" style="width:45px; text-align:right;"><br>
						<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/cart/CHANGE.PNG" name="submit" value="" onclick="amount_update(<%=cart_vo.getProduct_code() %>);">
				</td>
				
				<td>
						<fmt:formatNumber value="${sum_price }" groupingUsed="true"/>
						<% order_price += (int)pageContext.getAttribute("sum_price"); %>
				</td> 
				<td width=100px>
						<input type='hidden' name="getProduct_code" value="<%=cart_vo.getProduct_code()%>">
						<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/cart/ORDER_OK.PNG" name="submit" value="" onclick="order();">
						<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/cart/ORDER_DELETE.PNG" name="submit" value="" onclick="order_delete(<%=cart_vo.getProduct_code() %>);">
				</td>
			</tr>
<% 	
	} 
		pageContext.setAttribute("order_price", order_price); // 장바구니 내 최종 합산 가격
		session.setAttribute("amount_map", amount_map);
 
 %>			
			
			<tr>
				<td colspan='4'>
				<td colspan='3' align='right' height='60px'>
						상품구매금액 : <font class="order_price"><fmt:formatNumber value="${order_price }" groupingUsed="true"/></font> + 
						배송비 0 (무료) = 합계 : <font class="order_price"><fmt:formatNumber value="${order_price }" groupingUsed="true"/></font> 원
				</td>
			</tr>

 <%
 	}
 	
 	else {
 %>		
 			<tr>
	 			<td height='50px' style="border-bottom : none;"></td>
 			</tr>
 			<tr>
 				<td colspan='7' style="border-bottom : none;">
 					<img src="<%= application.getInitParameter("IMG_SRC")%>/cart/CART_EMPTY.PNG">
 				</td>
 			</tr>
 			<tr>
 				<td height='50px' colspan='7'>
 				</td>
 			</tr>
 <%	} %>
 			
			<tr>
				<td colspan='7' align='right' style="border-bottom : none;">
						<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/cart/ALL_ORDER.PNG" name="submit" value="" onclick="all_order();">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>