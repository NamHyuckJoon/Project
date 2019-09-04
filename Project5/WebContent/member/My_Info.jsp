<%@page import="member.Member_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
<script src="/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="/test.css" rel="stylesheet" type="text/css">
<style type="text/css">

div.my_info{
	overflow:hidden; 
	width:1200px; 
	height: auto; 
	margin: auto; 
	text-align: center;
}

.info {
	background-color: #FAFAFA;
	border: 1px solid #BDBDBD;
	padding: 10px;
	width: 1200px;
	height: 50px;
	margin: auto;
	border-radius: 10px;
	display: table;
	text-align: center;
}

.info span {
	display: table-cell;
	vertical-align: middle;
	font: bold 12px 'Lato', sans-serif;
}

hr.garo {
	border: solid #dedede;
	border-width: 1px 0 0;
}

table.table_info {
	margin: auto;
	text-align: left;
	font: 12px 'Lato', sans-serif;
	color : #545454;
}

.table_info td {
	height:25px;
}

div.space {
	border: none;
	height: 100px;
}

input {
	padding-left: 10px;
	/* margin: auto; */
	text-align: left;
	font: 12px 'Lato', sans-serif;
	color : #545454;
}

input[type=text], [type=password], [type=tel] {
	margin: auto;
	text-align: left;
	font: 12px 'Lato', sans-serif;
	width: 180px;
	line-height : 25px;
	border: 1px solid #BDBDBD;
}

input#txtMobile2, #txtMobile3 {
	width: 100px;
}

input#address {
	width: 450px;
	background-color: #F2F2F2;
}

input#detailAddress {
	width: 450px;
}


input#postcode {
	width: 180px;
	background-color: #F2F2F2;
}

input#img_button {
	vertical-align: middle;
	border: none;
	width: 90px;
	height: 35px;
	cursor: pointer;
}

select {
	margin: auto;
	text-align: right;
	font: 12px 'Lato', sans-serif;
	width: 100px;
	height : 30px;
}


</style>
<script type="text/javascript">
    function form_chk() {
    	
        if (pw.value != pw_chk.value) {
            alert('비밀번호가 같지 않습니다. 다시 입력해 주세요');
    		member_input.pw.focus();
            return false;
        }
        else if (pw.value.length < 3){
    		alert("비밀번호를 4자 이상 입력해주세요.");
    		member_input.pw.focus();
    		return false;
    	}
        
        else if (postcode.value == "" || detailAddress.value== "") {
    		alert("주소를 입력해주세요!");
    		member_input.detailAddress.focus();
    		return false;
    	}
        
        else if (txtMobile2.value == "") {
        	alert("연락처 앞자리를 입력해주세요!");
        	member_input.txtMobile2.focus();
    		return false;
        }
        
        else if (txtMobile3.value == "") {
        	alert("연락처 뒷자리를 입력해주세요!");
        	member_input.txtMobile3.focus();
    		return false;
        }
        else
        	return true;   
    }
    
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
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
	
	<% 
		Member_VO mem_vo = (Member_VO)request.getAttribute("member");
	 	String[] phone = mem_vo.getPhone().split("-");
	 	pageContext.setAttribute("phone", phone[0]) ;
	 	
	 	String[] address = mem_vo.getAddress().split("/");

	%>
	
	
	<div class="space" style="height: 50px;"></div>
	<div class="space">
		<img src="<%= application.getInitParameter("IMG_SRC")%>/member/EDIT.JPG">
	</div>
	<div class="info">
		<span> B A S E &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I N F O R M A T I O N </span>
	</div>
	<div class="space" style="height: 50px;"></div>

	<div class="my_info">
		<form name="member_input" action="My_Info?action=myinfo" onsubmit="return form_chk()"method='post'>
			<table class="table_info">
				<tr>
					<td align="left" style="width:100px">아이디</td>
					<td width="50px"></td>
					<td><input type='text' name="id" value="<%=mem_vo.getId() %>" readonly style="background-color: #F2F2F2;"></td>
					<td width="100px"></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>

				<tr>
					<td align="left">비밀번호</td>
					<td width="50px"></td>
					<td><input type='password' id="pw" name="pw" maxlength="16"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>

				<tr>
					<td align="left">비밀번호 확인</td>
					<td width="50px"></td>
					<td><input type='password' id="pw_chk" maxlength="16"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>

				<tr>
					<td align="left">이름</td>
					<td width="50px"></td>
					<td><input type='text' value="<%=mem_vo.getName() %>" readonly style="background-color: #F2F2F2;"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>

				<tr>
					<td align="left">주소</td>
					<td width="50px"></td>
					<%-- <td><input type='text' id="address" name="address" value="<%=mem_vo.getAddress()%>" style="width:500px"></td> --%>
					<td><input type="text" id="postcode" name="postcode" placeholder="우편번호" value="<%=address[0]%>" readonly>
						<input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/member/BTN_POST_CODE.PNG" id="img_button" onclick="execDaumPostcode(); return false;" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address" placeholder="주소" value="<%= address[1] %>" readonly>  &nbsp; (기본주소)<br> 
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" value="<%= address[2] %>">  &nbsp; (나머지주소)</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>

				<tr>
					<td align="left">연락처</td>
					<td width="50px"></td>
					<td>
						<select id="txtMobile1" name="txtMobile1">
							<option value="010" <c:if test="${phone eq '010'}">selected</c:if>>010</option>
							<option value="011" <c:if test="${phone eq '011'}">selected</c:if>>011</option>
							<option value="016" <c:if test="${phone eq '016'}">selected</c:if>>016</option>
							<option value="017" <c:if test="${phone eq '017'}">selected</c:if>>017</option>
							<option value="019" <c:if test="${phone eq '019'}">selected</c:if>>019</option>
						</select>
						- <input type="tel" id="txtMobile2" name="txtMobile2" value=<%=phone[1] %> size="4" maxlength="4">
						- <input type="tel" id="txtMobile3" name="txtMobile3" value=<%=phone[2] %> size="4" maxlength="4">
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><hr class="garo"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="right"><input type="image" src="<%= application.getInitParameter("IMG_SRC")%>/member/BTN_MODIFY.JPG" name="submit" value="">
					<a href="Main"><img src="<%= application.getInitParameter("IMG_SRC")%>/member/BTN_NOT_JOIN.JPG"></a></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>
