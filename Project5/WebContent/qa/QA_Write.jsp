<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script language="javascript">
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;

		if (!form.qSeq.value) {
			alert("번호를 입력하세요");
			form.qSeq.focus();
			return;
		}
		
		if (!form.qTitle.value) {// form 에 있는 nTitle 값이 없을 때
			alert("문의제목을 입력하세요"); // 경고창 띄움
			form.qTitle.focus(); // form 에 있는 nTitle 위치로 이동
			return;
		}

		if (!form.qWriter.value) {
			alert("작성자를 입력하세요");
			form.qWriter.focus();
			return;
		}
		
		if (!form.productName.value) {
			alert("상품명을 입력하세요");
			form.productName.focus();
			return;
		}
		
		if (!form.productCode.value) {
			alert("상품코드를 입력하세요");
			form.productCode.focus();
			return;
		}
				
		if (!form.qContext.value) {
			alert("상세 문의사항을 입력하세요");
			form.qContext.focus();
			return;
		}
				
		if (!form.qTime.value) {
			alert("작성일을 입력하세요");
			form.qTime.focus();
			return;
		}

		form.submit();
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Q&A 작성</title>
</head>
<body>
	<table>
		<form name=writeform method=post action="/Project/qa/QA_Write_In.jsp" align="center">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="text-align: center;">
							<td width="5"><img src="" width="5"	height="30" /></td>
							<td>Q&A 작성</td>
							<td width="5"><img src="" width="5"	height="30" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번호</td>
							<td><input name="qSeq"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input name="qTitle" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성자</td>
							<td><input name="memberId"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
<!-- 						<tr>
							<td>&nbsp;</td>
							<td align="center">조회수</td>
							<td></td>
							<td>&nbsp;</td>							
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr> -->
						<tr>
							<td>&nbsp;</td>
							<td align="center">상품명</td>
							<td><input name="productName" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">상품코드</td>
							<td><input name="productCode"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">문의사항</td>
							<td><textarea name="qContext" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
							<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성일</td>
							<td><input type="datetime-local" name="qTime"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td>
						</tr>

						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2">
							<input type=button value="취소" OnClick="window.location='/Project/board/Board_QA.jsp'">
							<input type=button value="등록" OnClick="javascript:writeCheck();">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>