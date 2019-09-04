package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import database.DBConnection;

public class Product_DAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = null;
	String sql = null;
	
	
	public ArrayList<Product_VO> product_select_mainview() {
		ArrayList<Product_VO> product_list = new ArrayList<Product_VO>();
		
		try {
			conn = DBConnection.getConnection();

			sql = "select PRODUCT.PRODUCT_CODE, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_IMG from PRODUCT_MAIN, PRODUCT where "
					+ "PRODUCT_MAIN.PRODUCT_CODE = PRODUCT.PRODUCT_CODE order by PRODUCT_DATE desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				Product_VO product_vo = new Product_VO();
				
				product_vo.setProduct_code(rs.getString("PRODUCT_CODE"));
				product_vo.setProduct_name(rs.getString("PRODUCT_NAME"));
				product_vo.setProduct_img(rs.getString("PRODUCT_IMG"));
				product_vo.setProduct_price(rs.getString("PRODUCT_PRICE"));	
				
				product_list.add(product_vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		
		return product_list;
	}
	
	
	// 얘네 입력실패시 처리해줘야하는데..하..
	
	public String product_insert (ArrayList<Product_VO> product_list, Product_VO vo) {
		String result;
		
		try {
			conn = DBConnection.getConnection();

			sql = "insert into PRODUCT(CATEGORY_CODE, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_IMG) "
					+ "values (?," + (vo.getCategory_code() + "||product_seq.nextval") + ", ?, ?, ?)";
			
			// 시간나면 스트링버퍼
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCategory_code());
			pstmt.setString(2, vo.getProduct_name());
			pstmt.setString(3, vo.getProduct_price());
			pstmt.setString(4, vo.getProduct_img());
			
			rs = pstmt.executeQuery();
			
			
			sql = "insert into PRODUCT_OPTION values("+ (vo.getCategory_code() + "||product_seq.currval") + ", ?, ?, ?)";
			
			for (Product_VO vo_option : product_list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo_option.getProduct_color());
				pstmt.setString(2, vo_option.getProduct_size());
				pstmt.setString(3, vo_option.getProduct_amount());
				
				rs = pstmt.executeQuery();

			}
			result = "insert success";

		} catch (Exception e) {
			result = "insert fail";
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return result;
		
	}

}
