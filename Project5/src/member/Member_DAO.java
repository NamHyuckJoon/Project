package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBConnection;

public class Member_DAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	String result = "";
	String sql = null;
	ResultSet rs = null;
	
	public String join(Member_VO vo) {
		try {
			int rs = 0;
			conn = DBConnection.getConnection();

			sql = "insert into MEMBER values(member_seq.NEXTVAL, ?, ?, ?, ?, ?, 0)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			
			rs = pstmt.executeUpdate();
			
			if (rs == 1) {
				result = "join_success";
				System.out.println("join_success");
			} 
			else {
				result = "join_fail";
				System.out.println("join_fail");
			}			
		}
		catch (Exception e) {
			e.printStackTrace();
			
		}
		finally {
			DBConnection.close(conn, pstmt);
		}
		return result;		
	}
	
	
	public Boolean join_select(String id) {
		Boolean result = false;
		
		try {
			conn = DBConnection.getConnection();
			sql = "select MEMBER_ID from MEMBER where MEMBER_ID=?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			
			if ( rs.next() == true) {
				result = true;
			}
			else {
				result = false;
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
	
	
	public Member_VO my_info_select(String id) {
		Member_VO vo = new Member_VO();
		
		try {
			conn = DBConnection.getConnection();
			sql = "select * from MEMBER where MEMBER_ID=?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();

			vo.setId(rs.getString("MEMBER_ID"));
			vo.setName(rs.getString("MEMBER_NAME"));
			vo.setPhone(rs.getString("MEMBER_PHONE"));
			vo.setAddress(rs.getString("MEMBER_ADDRESS"));
			vo.setMember_admin(rs.getString("MEMBER_ADMIN"));
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	
	public String my_info_update(Member_VO vo) {
		int rs = 0;
		try {
			
			conn = DBConnection.getConnection();
			sql = "update MEMBER set MEMBER_PW=?, MEMBER_ADDRESS=?, MEMBER_PHONE=? where MEMBER_ID=?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getId());
			
			rs = pstmt.executeUpdate();
			
			if (rs == 1) {
				return "update_success";
			}
			else {
				return "update_fail";
			}
				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.close(conn, pstmt);
		}
		return "system_error";
	}
}
