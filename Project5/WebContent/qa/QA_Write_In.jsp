<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<% request.setCharacterEncoding("UTF-8");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id = "project";
	String pass = "project";
	
	// 작성시간 입력전 포맷맞추기
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
	
	String qTitle = request.getParameter("qTitle");
	String qSeq = request.getParameter("qSeq");
	String qWriter = request.getParameter("qWriter");
	String qContext = request.getParameter("qContext");
	String qTime = request.getParameter("qTime");
	String memberId = request.getParameter("memberId");
	String productName = request.getParameter("productName");
	String productCode = request.getParameter("productCode");
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO BOARD_QA"
				+ " (QA_TITLE,QA_SEQ,QA_WRITER,QA_CONTEXT,QA_TIME,MEMBER_ID,PRODUCT_NAME,PRODUCT_CODE)"
				+ " VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, qTitle);
		pstmt.setString(2, qSeq);
		pstmt.setString(3, qWriter);
		pstmt.setString(4, qContext);
		pstmt.setString(5, indate);
		pstmt.setString(6, memberId);
		pstmt.setString(7, productName);
		pstmt.setString(8, productCode);
		
		pstmt.execute();
		pstmt.close();
		conn.close();
		
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>게시판에 문제가 있습니다. 관리자에게 문의하세요.
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="/Project/qa/QA_View.jsp"; 
</script>