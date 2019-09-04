package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import database.DBConnection;
import vo.Product_VO;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = null;
	String sql = null;
	
	/******************************** 페이지 조회 *****************************************/
	public int selectPage(int category_code) {
		
		int result=0;
		Connection con=null;
		
		try {
			//con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1522:xe", "project", "project");
			conn = DBConnection.getConnection();
			System.out.println("연결성공");
			
		
			String selectsql = "select count(*) from product where category_code=? ";
			
			pstmt = conn.prepareStatement(selectsql); // 실행준비		
			pstmt.setInt(1,category_code);
			rs = pstmt.executeQuery();
			
			rs.next();
			result=rs.getInt("count(*)");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
				
		return result;
	}//selectPage end
	
	/*************************************** 각 category별 제품 리스트 전체 출력 ***********************************************/
	public ArrayList<Product_VO> selectCategory(int category_code,int pagenum,int recordnum) {
		
		ArrayList<Product_VO> arr = new ArrayList<Product_VO>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("연결성공");
			
			/******************************************** 페이지별 리스트 조회  **********************************************************/
			String selectsql = 
								"select r,product_code,product_name, product_price,product_date, "
								+"category_code,product_img "
								+"from(select rownum r,product_code,product_name,product_price,product_date,"
								+		"category_code,product_img from product where category_code=? order by product_code desc ) "
								+"where r>= ? and r<= ?";
			 
			pstmt = conn.prepareStatement(selectsql); // 실행준비		
			pstmt.setInt(1, category_code);
			pstmt.setInt(2, pagenum);
			pstmt.setInt(3, recordnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product_VO vo = new Product_VO();
				
				vo.setProduct_code(rs.getString("product_code"));
				vo.setProduct_name(rs.getString("product_name"));			
				vo.setProduct_price(rs.getString("product_price"));
				vo.setProduct_date(rs.getString("product_date"));
				vo.setCategory_code(rs.getString("category_code"));
				vo.setProduct_img(rs.getString("product_img"));
				
				arr.add(vo);			
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
			
		
		return arr;
		
	}//selectCategory end
	
	/********************************************** 제품 클릭했을 때 ****************************************************************/
	public ArrayList<Product_VO> selectProductList(int product_code){
		
		ArrayList<Product_VO> arr = new ArrayList<Product_VO>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("연결성공");
			
			
			String selectsql = "select * from product where product_code=?";
			
			pstmt = conn.prepareStatement(selectsql); // 실행준비				
			pstmt.setInt(1,product_code);
			rs = pstmt.executeQuery();
			
			String product_name = null;
			String product_price = null;
			String product_date = null;
			String category_code = null;
			String product_img = null;
			
			if(rs.next()) {
				product_name = rs.getString("product_name");
				product_price = rs.getString("product_price");
				product_date = rs.getString("product_date");
				category_code = rs.getString("category_code");
				product_img = rs.getString("product_img");
				
				arr.add(new Product_VO(Integer.toString(product_code), product_name, product_price,
						product_date, category_code,  category_code,product_img));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}	
		
		return arr;
	}//selectProductList end
}
