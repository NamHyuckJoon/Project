package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import database.DBConnection;

public class Cart_DAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = null;
	String sql = null;

	public ArrayList<Cart_VO> cart_select(String id) {
		ArrayList<Cart_VO> cart_list = new ArrayList<Cart_VO>();

		try {
			conn = DBConnection.getConnection();

			sql = "select * from CART where MEMBER_ID = ? order by CART_SEQ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Cart_VO cart_vo = new Cart_VO();
				cart_vo.setCart_img(rs.getString("CART_IMG"));
				cart_vo.setCart_name(rs.getString("CART_NAME"));
				cart_vo.setCart_size(rs.getString("CART_SIZE"));
				cart_vo.setCart_color(rs.getString("CART_COLOR"));
				cart_vo.setCart_amount(rs.getString("CART_AMOUNT"));
				cart_vo.setCart_price(rs.getString("CART_PRICE"));
				cart_vo.setProduct_code(rs.getString("PRODUCT_CODE"));

				cart_list.add(cart_vo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}

		return cart_list;
	}

	public String amount_update(String id, String product_code, String amount) {
		int rs = 0;
		try {

			conn = DBConnection.getConnection();
			sql = "update CART set CART_AMOUNT=? where MEMBER_ID=? and PRODUCT_CODE=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, amount);
			pstmt.setString(2, id);
			pstmt.setString(3, product_code);

			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return "update_success";
			} else {
				return "update_fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt);
		}
		return "system_error";
	}

	public String cart_delete(String id, String product_code) {
		int rs = 0;
		try {

			conn = DBConnection.getConnection();
			sql = "delete from CART where MEMBER_ID=? and PRODUCT_CODE=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, product_code);

			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return "delete_success";
			} else {
				return "delete_fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt);
		}
		return "system_error";
	}

	public String cart_list_insert(ArrayList<Cart_VO> cart_list, String id) {
		int rs = 0;
		int rs_chk = 0;
		try {

			conn = DBConnection.getConnection();

			for (Cart_VO cart_vo : cart_list) {
				System.out.println("sql 전");
				System.out.println(cart_vo.getProduct_code());
				
				sql = "insert into CART values(?, ?, cart_seq.nextval, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, cart_vo.getProduct_code());				
				pstmt.setString(3, cart_vo.getCart_name());
				pstmt.setString(4, cart_vo.getCart_color());
				pstmt.setString(5, cart_vo.getCart_size());	
				pstmt.setString(6, cart_vo.getCart_amount());
				pstmt.setString(7, cart_vo.getCart_price());
				pstmt.setString(8, cart_vo.getCart_img());

				rs = pstmt.executeUpdate();
				
				if (rs == 1) {
					rs_chk++;
					rs = 0;
				}

			}

			
			if (rs_chk == cart_list.size()) {
				return "insert_success";
			} else {
				return "insert_fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt);
		}

		return "system_error";
	}
	
	public String cart_insert(Cart_VO cart_vo, String id) {
		int rs = 0;
		int rs_chk = 0;
		try {

			conn = DBConnection.getConnection();


				System.out.println("sql 전");
				
				sql = "insert into CART values(?, ?, cart_seq.nextval, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, cart_vo.getProduct_code());				
				pstmt.setString(3, cart_vo.getCart_name());
				pstmt.setString(4, cart_vo.getCart_color());
				pstmt.setString(5, cart_vo.getCart_size());	
				pstmt.setString(6, cart_vo.getCart_amount());
				pstmt.setString(7, cart_vo.getCart_price());
				pstmt.setString(8, cart_vo.getCart_img());

				rs = pstmt.executeUpdate();

		

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt);
		}

		return "system_error";
	}

}
