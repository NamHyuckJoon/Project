package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBConnection;

public class Login_DAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = "";
	String sql = null;


	public String login(String id, String pw) {
		try {
			conn = DBConnection.getConnection();
			
			sql = "select MEMBER_ID, MEMBER_PW, MEMBER_ADMIN from MEMBER where MEMBER_ID = ?";
	

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {			
				if(rs.getString("MEMBER_ID").equals(id) && rs.getString("MEMBER_PW").equals(pw)) {
					result = "User";
					if (rs.getString("MEMBER_ADMIN").equals("admin")) {
						result = "Admin";
					}
				}
				else
					result = "chk_no";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return result;
	}
	

}
