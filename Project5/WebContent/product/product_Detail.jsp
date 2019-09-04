<%@page import="cart.Cart_VO"%>
<%@page import="vo.Product_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><!-- html5 선언 -->
<html>
<head>
<link href="/test.css" rel="stylesheet" type="text/css">
      <meta charset="UTF-8">
      <title>일상을 입다, ONDAILY</title>
      <script src="jquery-3.2.1.min.js"></script>
      <style>
            table.detail_table { margin:auto;}
      </style>
      <style>
      	input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
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
	
      <%
	      	ProductDAO dao = new ProductDAO();
	                  String product_code = request.getParameter("product_code");
	                  //System.out.println(product_code);
	                  ArrayList<Product_VO> arr = dao.selectProductList(Integer.parseInt(product_code));
	      %>
      <table class="detail_table">
      <%
      	for(Product_VO vo : arr){
      %>
            <tr style="position: relative; top: expression(this.offsetParent.scrollTop); z-index: 20;">
            <td><img src="<%=vo.getProduct_img() %>" width="300px" height="300px"/></td>
            <td>
                  <table style="border: 1px solid;"> 
                        <tr align="center">
                              <td><%=vo.getProduct_name() %><hr></td>
                        </tr>
                        <tr align="center">
                              <td><%=vo.getProduct_price() %><hr></td>
                        </tr> 
                        <tr align="center">
                              <td>
                                    color :
                                    <select id="selectoption">
                                          <option disabled>color</option>
                                          <option >검은색</option>
                                          <option>하얀색</option>
                                          <option>분홍색</option>
                                          <option>파랑색</option>
                                    </select>
                              </td>
                        </tr>
                        <tr>
                              <td>
                                    <input type="hidden" id="productcode" value='<%=vo.getProduct_code()%>' />
                                    <input type="hidden" id="productname" value='<%=vo.getProduct_name() %>' />
                                    <input type="hidden" id="productprice" value='<%=vo.getProduct_price() %>' /> 
                                    <input type="hidden" id="productimg" value='<%=vo.getProduct_img()%>' />
                                    
                                    <input type="hidden" id="cartsession" value='a'>
                                    
                                    <input type="hidden" id="amount" value="1">
                                    
                                    <input type="hidden" id="z1" value='0'/> 
                                    <input type="hidden" id="arr" value='0'/> 
									<% ArrayList<Cart_VO> cartInsert = new ArrayList<Cart_VO>(); %>
                                    <script>                                              
	                                    var arr = new Array();  
	                                    var arr1 = new Array();
	                                    var arr_cart_session = new Array();
	                                    var cnt=0;
	                                    var cnt1=0;
	                                    var z=$("#z1").val();
	                                    var total=0;
	                                    
	                                    var img=null;
	                                    var code=null;
	                                    var name = null;
	                                    var arr_name = new Array();
	                                    var optionselected=null;
	                                    var price=null;
	                                    var id_split=0;

 	                               		var amount = 1;
	                                    
                                          $(document).ready(function(){
                                        	  /******************************************select option 선택했을 때******************************************/
                                                 $("#selectoption").on('change',function(){
                                                       $.ajax({
                                                             url:"product_Detail.jsp?product_code="+$("#productcode").val(),
                                                             success: function(){
                                                                   optionselected = $("#selectoption option:selected").text();
                                                                   name = $("#productname").val()+"("+optionselected+")";
                                                                   price = $("#productprice").val();
                                                            
                                                                   for(var j=0; j<arr.length; j++){
                                                                       for(var a=0;a<arr.length;a++){      
                                                                             if(arr[j].indexOf(optionselected)!=-1){ //true
                                                                                 cnt=1;
                                                                                 break;
                                                                             }else{//false
                                                                                   cnt=0
                                                                             }
                                                                       } 
                                                                       
                                                                       if(cnt==1){
                                                                             break;
                                                                       }
                                                                 	}    
                                                                   
                                                                   if(cnt==0){
                                                                         arr.push(optionselected);
                                                                         $("#arr").val(arr.length);
                                                                         $("#name").append(name+"<br>");        
                                                                         $("#number").append("<input type=\"number\" id='color"+z+"' value='1' step='1' min='1' maxlength='5'/>");
                                                                         $("#upbutton").append("<input type='image' id='upbutton "+z+"' src='<%= application.getInitParameter("IMG_SRC")%>/button/upbutton1.jpg' height=\"10px\">");
                                                                        
                                                                         $("#downbutton").append("<input type='image' id='downbutton "+z+"' src='<%= application.getInitParameter("IMG_SRC")%>/button/downbutton1.jpg' height=\"10px\"/><br>");
                                                                         
                                                                         $("#price").append(price+"<br>");  
                                                                         total += price*$("#color"+z).val();
                                                                         $("#total").html(total+"원");
                                                                        
                                                                         
                                                                         /******************************비회원 장바구니 넣기***************************/
                                     	                                /*
                                     	                                	arr_cart_session 배열에 
                                     	                                	productcode, productname, productprice, product 옵션 : 색 또는 사이즈 별 수량 
                                     	                               		product_img를 배열에 각 저장해서 넘기기                                                                              */
                                     	                               		
                                     	                               		
                                     	                               		code=$("#productcode").val();
                                     	                  					//img="/image/"+$("#productimg").val();
                                     	                  					
                                     	                  					arr_cart_session.push($("#productimg").val());
                                     	                  					arr_cart_session.push(name);                                         	                               		
                                     	                               		arr_cart_session.push(price);
                                     	                               		arr_cart_session.push($("#amount").val());
                                     	                               		arr_cart_session.push("s");
                                     	                               		arr_cart_session.push(code); 
                                     	                               		
                                         	                               	$("#cartsession").val(arr_cart_session);
                                   	                                		$("#cart_list").val($("#cartsession").val());
                                   	                                	
                                   	                                		//alert($("#cart_list").val());
                                     	                  					
                                     	                                /******************************비회원 장바구니 넣기***************************/
                                                                         
                                                                         z++;
                                                                         $("#z1").val(z);
                                                                                                                                                   
                                                                   }else{
                                                                         //수량을 update해서 추가하는 식으로 바꾸기! 
                                                                         //id_split = $("number").attr("id").split("");
                                                                         //alert(id_split);
                                                                         //document.getElementById("#upbutton0"); 일때 0을 z에 넣어야 화면에 출력 됨
                                                                         /* cnt1=$("#color"+id_split[1]).val();
                                                                         cnt1++;
                                                                         $("#color"+id_split[1]).val(cnt1);
                                                                         total += price*1;
                                                                         $("#total").html(total+"원");*/ 
                                                                         
                                                                         alert("이미 선택된 옵션입니다.");
                                                                   }                                                                             
                                                                 
                                                             },//success end
                                                             error: function(){alert("오류");},
                                                             complete : function(){}
                                                       });//ajax end
                                                 });//on end
                                            
                                                 $("#upbutton").on('click', "input:image", function(){
                                                            	//alert($(this).attr('id'));	
                                                            	id_split = $(this).attr('id').split(" ");
                                                            	//alert(id_split[1]); 
                                               		 $.ajax({
                                                            url:"product_Detail.jsp?product_code="+$("#productcode").val(),
                                                            success: function(){    
                                                            	cnt1= $("#color"+id_split[1]).val();
                                                            	cnt1++;
                                                                $("#color"+id_split[1]).val(cnt1);
                                                                //$("#amount").val($("#color"+id_split[1]).val());
                                                                total += price*1;
                                                                $("#total").html(total+"원");                         	                                	
                                                                                                                     
                                                            },//success end
                                                            error: function(){alert("오류");},
                                                            complete : function(){}
                                                      });//ajax end
                                                 });//on end
                                                 
                                                 
                                                 $("#downbutton").on('click',"input:image",function(){
                                                	 			id_split = $(this).attr('id').split(" ");
                                                      $.ajax({
                                                           url:"product_Detail.jsp?product_code="+$("#productcode").val(),
                                                           success: function(){
                                                        	   cnt1 = $("#color"+id_split[1]).val();
                                                          	 	if(cnt1>1){
                                                          	 		cnt1--;
                                                                   $("#color"+id_split[1]).val(cnt1);
                                                                  // $("#amount").val($("#color"+id_split[1]).val());
                                                                   total -= price*	1;
                                                          	 	}else if(cnt1<1){
                                                          	 		cnt1=1
                                                          	 		$("#color"+id_split[1]).val(cnt1);
                                                          	 	}
                                                          	 	
                                                                $("#total").html(total+"원");
                                                                                                                    
                                                           },//success end
                                                           error: function(){alert("오류");},
                                                           complete : function(){}
                                                     });//ajax end
                                               });//on end 
                                               
                                          });//ready end
                                          
                                    </script>
                                   
                              </td>
                        </tr>
                        <tr>
                              <td>
                                    <table>
                                          <tr align="center">
                                          		<hr style="border-top: 2px solid;">
                                                <td width="250px">NAME</td>
                                                <td width="150px">QTY</td>
                                                <td width="250px">PRICE</td>  
                                          </tr>
                                    </table>
                                    
                                    <table align="center" >
                                    	<tr align="center">
                                    		<hr>
                                    		<td id="name" width="250px"><br></td>
                                    		<td width="150px">
                                    			<table>
	                                    			<tr align="center">
	                                    				<td><div id="number"></div></td>
	                                    				<td><div id="upbutton"></div></td>
	                                    				<td><div id="downbutton"></div></td>
	                                    			</tr>
	                                    			<br>
                                    			</table>
                                    		</td>
                                    		<td id="price" width="250px"><br></td>                                    	
                                    	</tr>
                                    </table>
                                    
                                    <table>
                                          <tr align="right">
                                          		<hr style="border-top: 2px solid;"> 
                                                <td  width="400px">Total : </td>
                                                <td id="total"></td>
                                          </tr>
                                    </table>
                              </td>
                        </tr>
                  </table>  
                  <table>
                  	<tr>
                  		<td>
                  			<form action="/cart/Cart.jsp" method="post">
                  				<input type='image' id='buynow' src='<%= application.getInitParameter("IMG_SRC")%>/button/buy_now.JPG'  width="410px">
                  			</form>
                  		</td>
                  		<td>
                  			<form action="/Cart?action=cart_insert" method="post">       
                  			<%
                  				String img1="/image/"+vo.getProduct_img();
                  			%>         
                                <input type="hidden" id="cart_list" name="cart_list" value='a'>                     
                   <%--              <input type="hidden" name="id" value='<%="null"%>'> --%>
                                <input type="hidden" name="action" value='<%="cart_insert"%>'>
                  				<input type='image' id='addbasket' src='<%= application.getInitParameter("IMG_SRC")%>/button/add_basket.JPG' height="54px" width="260px">
                  			</form>
                  		</td>
                  	</tr>
                  </table>                              
      <%
            }
      %>
      </table>
      <%@ include file="/footer/footer.jsp" %>
</body>
</html>