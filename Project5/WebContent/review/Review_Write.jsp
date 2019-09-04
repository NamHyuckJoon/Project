<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;

		if (!form.rSeq.value) { // form 에 있는 rSeq 값이 없을 때
			alert("번호를 입력하세요"); // 경고창 띄움
			form.rSeq.focus(); // form 에 있는 rSeq 위치로 이동
			return;
		}

		if (!form.rWriter.value) {
			alert("작성자를 입력하세요");
			form.rWriter.focus();
			return;
		}
		
		if (!form.rTitle.value) { // form 에 있는 rTitle 값이 없을 때
			alert("제목을 입력하세요"); // 경고창 띄움
			form.rTitle.focus(); // form 에 있는 rTitle 위치로 이동
			return;
		}
		
		if (!form.rContext.value) {
			alert("상세 리뷰를 입력하세요");
			form.rContext.focus();
			return;
		}
		
		if (!form.rTime.value) { // form 에 있는 rTime 값이 없을 때
			alert("작성일을 입력하세요"); // 경고창 띄움
			form.rTime.focus(); // form 에 있는 rTime 위치로 이동
			return;
		}

		if (!form.productName.value) {
			alert("내용을 입력하세요");
			form.productName.focus();
			return;
		}
		
		if (!form.productCode.value) {
			alert("내용을 입력하세요");
			form.productName.focus();
			return;
		}
		
		if (!form.productReview.value) {
			alert("만족도를 선택하세요");
			form.productReview.focus();
			return;
		}

		form.submit();
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Review 작성</title>
</head>
<body>
	<table>
		<form name=writeform method=post action="/Project/review/Review_Write_In.jsp" align="center">>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="text-align: center;">
							<td width="5"><img src="" width="5"	height="30" /></td>
							<td>Review 작성</td>
							<td width="5"><img src="" width="5"	height="30" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">번호</td>
							<td><input name="rSeq"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
	
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성자</td>
							<td><input name="rWriter" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input name="rTitle" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
								
						<tr>
							<td>&nbsp;</td>
							<td align="center">상세리뷰</td>
							<td><textarea name="rContext" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
							<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성일</td>
							<td><input type="datetime-local" name="rTime"></td>
							<td>&nbsp;</td>
							<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>	
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">MemberID</td>
							<td><input name="MemberId" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">상품명</td>
							<td><input name="productName" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">상품코드</td>
							<td><input name="productCode" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td align="center">만족도</td>
							<td><input type="radio" name="productReview">매우불만족
							<input type="radio" name="productReview">불만족
							<input type="radio" name="productReview">보통
							<input type="radio" name="productReview">만족
							<input type="radio" name="productReview">매우만족</td>
							<td>&nbsp;</td>							
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td align="center">첨부파일</td>
							<td><form action="" enctype="multipart/form-data">
							<input type="file" accept="image/jpg"></td>
							<td>&nbsp;</td>
							<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td>
						</tr>

						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2">
							<input type=button value="취소" OnClick="window.location='/project/board/Board_Review.jsp'">
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