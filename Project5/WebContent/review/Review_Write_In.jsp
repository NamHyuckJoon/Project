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
	
	String rSeq = request.getParameter("rSeq");
	String rWriter = request.getParameter("rWriter");
	String rTitle = request.getParameter("rTitle");
	String rContext = request.getParameter("rContext");
	String rTime = request.getParameter("rTime");
	String memberId = request.getParameter("memberId");
	String productName = request.getParameter("productName");
	String productCode = request.getParameter("productCode");
	String productReview = request.getParameter("productReview");
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO BOARD_REVIEW"
				+ " (REVIEW_SEQ,REVIEW_WRITER,REVIEW_TITLE,REVIEW_CONTEXT,REVIEW_TIME,MEMBER_ID,PRODUCT_NAME,PRODUCT_CODE,PRODUCT_REVIEW)"
				+ " VALUES(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, rSeq);
		pstmt.setString(2, rWriter);
		pstmt.setString(3, rTitle);
		pstmt.setString(4, rContext);
		pstmt.setString(5, indate);
		pstmt.setString(6, memberId);
		pstmt.setString(7, productName);
		pstmt.setString(8, productCode);
		pstmt.setString(9, productReview);
		
		pstmt.execute();
		pstmt.close();
		conn.close();
		
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
<script>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="/Project/qa/QA_View.jsp"; 
</script>