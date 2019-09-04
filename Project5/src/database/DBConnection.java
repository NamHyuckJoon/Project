package database;
import java.sql.Connection; 
/*import java.sql.DriverManager; */
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource; 

public class DBConnection { 
	
/*	private static final String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String id = "jdbc";
	private static final String pwd = "jdbc";*/
   
	public static final Connection getConnection() { 
	   
      Connection conn = null; 
      try { 
         /*Class.forName("oracle.jdbc.driver.OracleDriver"); 
         conn = DriverManager.getConnection(dbUrl, id, pwd);*/
    	  
    	  Context initContext = new InitialContext();
    	  Context envContext = (Context)initContext.lookup("java:/comp/env");
    	  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
    	  conn = ds.getConnection();
         
         }catch(Exception e) { 
         e.printStackTrace(); 
      } 
      return conn; 
   } 
   public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) { 
	   
      if(rs != null) { try { rs.close(); }catch(SQLException se) {} } 
      if(pstmt != null) { try { pstmt.close(); }catch(SQLException se) {} } 
      if(conn != null) { try { conn.close(); }catch(SQLException se) {} } 
   } 
   public static void close(Connection conn, PreparedStatement pstmt) { 
      close(conn, pstmt, null); 
   } 
} 