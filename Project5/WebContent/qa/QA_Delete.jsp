<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String num = request.getParameter("num"); 
String id = session.getAttribute("id").toString(); 


String driverName="oracle.jdbc.driver.OracleDriver";
String dbURL = "jdbc:oracle:thin:@127.0.0.1:1522:xe";

Class.forName(driverName);
DriverManager.getConnection(dbURL,"project","project");

Connection conn = null;

    Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT id FROM BOARD_QA WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodid = rs.getString("id").trim();
if (id.equals(goodid)){
	strSQL = "DELETE From BOARD_QA WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
	
	strSQL = "UPDATE BOARD_QA SET num = num - 1 WHERE num > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();

	response.sendRedirect("/Project/board/Board_QA.jsp");
}else{ %>
	<SCRIPT language="JavaScript">
	alert('정보가 일치하지 않습니다!');
	</SCRIPT>
	
	
	<% response.sendRedirect("Board_QA.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>
