<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<link href="/test.css" rel="stylesheet" type="text/css">
<script src = "/jquery-3.2.1.min.js"></script>
<style type="text/css">

div.admin {
	overflow:hidden; 
	width:1200px; 
	height: auto; 
	margin: auto; 
	text-align: center;
}

table.add_table {
	margin: auto;
	text-align: center;
	align:center;
	font: 12px 'Lato', sans-serif;
}
.add_table td {
	/* border : 1px solid; */
	align:center;
	/* text-align : center; */
}

table.option_table {
	text-align: center;
	align:center;
	font: 12px 'Lato', sans-serif;
}

#product_name {
	width : 300px;
}

#product_price {
	width : 80px;
}

span#p_color input {
	width : 50px;
	vertical-align:middle;
	text-align:center;
}

 span#p_size input {
 	width : 30px;
	vertical-align:middle;
	text-align:center;
 }

img.add_btn, img.minus_btn {
	 width:25px; 
	 height: 25px; 
	 vertical-align:middle;
}

.img_wrap {
	width : 300px;
}
.img_wrap img {
	max-width : 100%;
}
tab { padding-left: 4em; }

span.space {
	display: inline-block; 
	width:2em;
}
</style>

<script type="text/javascript">

	var option_cnt = 0;
	
	function add_option() {
		
		var rowitem = "<tr>";
		rowitem += "<td>추가옵션</td>";
		rowitem += "<td><input type='text' name='product_color' style='width: 50px'></td>";
		rowitem += "<td><input type='text' name='product_size' style='width: 40px'></td>";
		rowitem += "<td><input type='text' name='product_amount' style='width: 40px'></td>";
		rowitem += "</tr>";
		$("#option_table").append(rowitem);
		
		option_cnt++;
		$("#option_cnt").val(option_cnt);
	
	}
	
	function minus_option() {
		$(document).ready(function() { 
			
 		if ($("#option_table tr").length > 3) {
			$("#option_table tr:last").remove();
		} 
		});
		option_cnt--;
		$("#option_cnt").val(option_cnt);
	}
	
	
	var sel_file;
	$(document).ready(function() {
		$("#userFile").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function (f) {
			if(!f.type.match("image.*")) {
				alert("이미지만 업로드할 수 있습니다.");
				return ;
			}
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
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
	<div style="height:100px"></div>
	
	<div class="admin">
		<form id="add_form" action="/Admin?test=1" method="post" enctype="multipart/form-data">
			<table class="add_table">
				<tr>
					<td width=200px height=300px>
						<div class="img_wrap"><img id="img" src="<%= application.getInitParameter("IMG_SRC")%>/admin/NO_IMAGE.PNG" /></div><br>
					</td>
					<td rowspan='2' width=600px  style="text-align:left">
						Category	<select name="category_code">
											<option value="100">Outer</option>
											<option value="200">Top</option>
											<option value="300">Pants</option>
											<option value="400">Skirt</option>
											<option value="500">Shoes</option>
										</select>
							<br><br>
						상품 제목		<input type='text' id ="product_name" name="product_name"> 
							<br><br>
						상품 가격		<input type='text' id = "product_price" name="product_price"> 
							<br><br>
						<details >
							<summary style="cursor: pointer; outline:0; border:0;'">상세 옵션 ( ★는 필수 입력입니다. )</summary>
							<table id ="option_table" class="option_table">
								<tr><td height=10px></td></tr>
								<tr>
									<td></td>
									<td width=60px>색상</td>
									<td width=45px>사이즈</td>
									<td width=45px>★수량</td>
									<td><img src="<%= application.getInitParameter("IMG_SRC")%>/admin/ADD_ICON.png" class="add_btn" onClick="add_option()">
									<img src="<%= application.getInitParameter("IMG_SRC")%>/admin/MINUS_ICON.png" class="minus_btn" onClick="minus_option()"></td>
								</tr>
								
								<tr>
									<td>추가옵션</td>
									<td><input type='text' name='product_color' style="width: 50px"></td>
									<td><input type='text' name='product_size' style="width: 40px"></td>
									<td><input type='text' name='product_amount' style="width: 40px"></td>
								</tr>
							
							</table>
						</details>
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" id= "userFile" name="userFile">
					</td>
				</tr>
<!-- 				<tr>
					<td colspan='2' height=500px> 
				 		상세내용
					</td>
				</tr> 
-->
			</table>
			<input type="hidden" value="0" id="option_cnt" name="option_cnt">
			<input type="submit" value="전송">
		</form>
	</div>
	 <%@ include file="/footer/footer.jsp" %> 
</body>
</html>