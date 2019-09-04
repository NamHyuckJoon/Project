<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상을 입다, ONDAILY</title>
</head>
<body>
	<%
		System.out.println("result 화면 도착");
		if (session.getAttribute("Admin_result") != null) {
			String result = (String)session.getAttribute("Admin_result");
			
			if (result.equals("insert success")) {
	%>
				<script> alert("성공적으로 등록되었습니다.")
				location.href="/admin/Admin.jsp";
				</script>			
	<%		
			}
			else { %>
				<script> alert("등록 중 문제가 발생했습니다.")
				location.href="/admin/Admin.jsp";</script>				
		<%	}
		/* response.sendRedirect("/Project/admin/Admin.jsp"); */
		}
	
	
	%>
</body>
</html>