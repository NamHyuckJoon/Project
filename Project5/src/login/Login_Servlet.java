package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart_DAO;
import cart.Cart_VO;

public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (request.getParameter("action") == null ) {
			response.sendRedirect("/login/Login.jsp");
		}
	
		else if (request.getParameter("action") != null && request.getParameter("action").equals("login")) {
			// 로그인 요청 처리

			Login_DAO login_dao = new Login_DAO();
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			String result = login_dao.login(id, pw);
			System.out.println("login result : " + result + "  /  ID : " + id);
			
			if (result.equalsIgnoreCase("User") || result.equalsIgnoreCase("Admin")) {
				// 일반(Login) / Admin으로의 로그인 체크
				session.setAttribute("id", id);
				session.setAttribute("header", result);
				
				
				if (session.getAttribute("cart_list") != null) {
					// 장바구니에 상품이 담긴채로 로그인했는지 체크
					@SuppressWarnings("unchecked")
					ArrayList<Cart_VO> cart_list = (ArrayList<Cart_VO>)session.getAttribute("cart_list");
					String insert_result = new Cart_DAO().cart_list_insert(cart_list, id);
					System.out.println(insert_result);
					
					session.removeAttribute("cart_list");
				}
				
				response.sendRedirect("/Main");
			}
			
			else {
				// 로그인 실패시 js? 무언가 알림이 하나정도는 필요함.
				System.out.println("로그인실패 ID/PW 오류");
				request.setAttribute("fail", "fail");
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 또는 패스워드를 확인해주세요.'); history.go(-1);</script>");
				out.close();
				 

			} // action = Login 종료
		}
		
		else {
			System.out.println("시스템 에러");
			response.sendRedirect("/login/Login.jsp");
		}
	
	}

}
