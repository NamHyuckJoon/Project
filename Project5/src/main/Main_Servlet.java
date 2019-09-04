package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.Notice_VO;
import product.Product_DAO;
import product.Product_VO;

public class Main_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Main Servlet 진입");
		HttpSession session = request.getSession();
		
		ArrayList<Product_VO> product_list = new Product_DAO().product_select_mainview();
		session.setAttribute("product_list", product_list);
		
		//========================================================================================================
		
		ArrayList<Notice_VO> notice_list = new ArrayList<Notice_VO>();
		
		Notice_VO notice_vo = new Notice_VO();
		notice_vo.setTitle("24시간 내 입금확인이 완료됩니다.");
		notice_vo.setTime("2018-08-23");
		notice_list.add(notice_vo);
		
		notice_vo = new Notice_VO();
		notice_vo.setTitle("페이스북 좋아요 이벤트 !");
		notice_vo.setTime("2018-08-23");
		notice_list.add(notice_vo);
		
		notice_vo = new Notice_VO();
		notice_vo.setTitle("무료배송 이벤트가 진행중 입니다.");
		notice_vo.setTime("2018-08-23");
		notice_list.add(notice_vo);
		
		//DAO 제작시 가장 최근 3~5개만 가져오게끔. 
		
		session.setAttribute("notice_list", notice_list);
		
		
		System.out.println("Main Servlet Redirect 직전");
		response.sendRedirect("/Main.jsp");
		
	}

}
