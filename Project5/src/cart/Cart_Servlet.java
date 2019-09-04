package cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Cart_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Cart_DAO cart_dao = new Cart_DAO();
	String id = null;
	String product_code = null;
	String amount = null;
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Post 이동
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
			
			if (session.getAttribute("id") == null) { 									// 비회원 일 때
				System.out.println("비회원 처리 시작");

//action 처리 시작					
				if (request.getParameter("action") == null) {
					System.out.println("action null처리");
				}
				
				else if (request.getParameter("action").equals("cart_insert")) { 		// 장바구니 등록요청
					
					if (session.getAttribute("cart_list") == null) {					// 장바구니가 비었을 때
						System.out.println("장바구니 비었을 때");
						ArrayList<Cart_VO> cart_list = new ArrayList<Cart_VO>();
						//Cart_VO cart_vo = new Cart_VO();
						
						String list = request.getParameter("cart_list");
						String[] split_list = list.split(",");
						
						for(int i=0;i<split_list.length;i++)
							System.out.println(split_list[i]);
						
						for(int i=0;i<(split_list.length/6);i++) {
							for(int j=(6*(i+1)-6);j<(6*(i+1)-6)+1;j++) {
								Cart_VO cart_vo = new Cart_VO();
								cart_vo.setCart_img(split_list[j]);
								cart_vo.setCart_name(split_list[j+1]);
								cart_vo.setCart_price(split_list[j+2]);
								cart_vo.setCart_amount(split_list[j+3]);
								cart_vo.setCart_size(split_list[j+4]);
								cart_vo.setProduct_code(split_list[j+5]);
								cart_list.add(cart_vo);
							}
						}
						session.setAttribute("cart_list", cart_list);			
						
					}
					else if (session.getAttribute("cart_list") != null) {				// 장바구니가 존재할 때	
						System.out.println("회원 장바구니 있을 때");

						@SuppressWarnings("unchecked")
						ArrayList<Cart_VO> cart_list = (ArrayList<Cart_VO>) session.getAttribute("cart_list");
						//Cart_VO cart_vo = new Cart_VO();
						
						String list = request.getParameter("cart_list");
						String[] split_list = list.split(",");
						
						for(int i=0;i<(split_list.length/6);i++) {
							for(int j=(6*(i+1)-6);j<(6*(i+1)-6)+1;j++) {
								Cart_VO cart_vo = new Cart_VO();
								cart_vo.setCart_img(split_list[j]);
								cart_vo.setCart_name(split_list[j+1]);
								cart_vo.setCart_price(split_list[j+2]);
								cart_vo.setCart_amount(split_list[j+3]);
								cart_vo.setCart_size(split_list[j+4]);
								cart_vo.setProduct_code(split_list[j+5]);
								cart_list.add(cart_vo);
							}							
						}
						session.setAttribute("cart_list", cart_list);	
					}	
				}
				
				else if (request.getParameter("action").equals("amount_update")) {				// 장바구니 수량 변경 요청
					System.out.println("amount_update 처리 요청");
					
					@SuppressWarnings("unchecked")
					ArrayList<Cart_VO> cart_list = (ArrayList<Cart_VO>) session.getAttribute("cart_list");
					product_code = request.getParameter("product_code");
			
					@SuppressWarnings("rawtypes")
					int amount_map = (int) ((HashMap) session.getAttribute("amount_map")).get(product_code); // product_code : 상품 행  (key : value)
					String[] cart_amount = request.getParameterValues("cart_amount"); // 수량 name 전부 읽어옴
					
					for (Cart_VO cart_vo : cart_list) {
						if (cart_vo.getProduct_code().equals(product_code))
							cart_vo.setCart_amount(cart_amount[amount_map]);				
					}
					
					session.setAttribute("cart_list", cart_list);
	
				}	
			
				else if (request.getParameter("action").equals("order_delete")) {				// 장바구니 하나 삭제 요청
					System.out.println("order_delete 처리 요청");
					
					@SuppressWarnings("unchecked")
					ArrayList<Cart_VO> cart_list = (ArrayList<Cart_VO>) session.getAttribute("cart_list");
					product_code = request.getParameter("product_code");
					
					for (Cart_VO cart_vo : cart_list) {
						if (cart_vo.getProduct_code().equals(product_code))
							cart_list.remove(cart_vo);	
						break;
					}
					
					session.setAttribute("cart_list", cart_list);
				}
				
				
				else if (request.getParameter("action").equals("")) {				// action 다른요청
					
				}
				
			}
			
			
//			 ===================================== 비회원 end =========================================
			
//			 ===================================== 회원 start =========================================			
			
			
// id 비교 처리			
			else if (session.getAttribute("id") != null) {							
				id = (String) session.getAttribute("id");
				System.out.println("회원 처리 시작");
				// LoginServlet : if ? cart_list != null - true -  DB save & "cart_list session" remove
//action 처리 시작				
				if (request.getParameter("action") == null) {
					System.out.println("action null처리");
				}
				
				else if (request.getParameter("action").equals("cart_insert")) { 		// 장바구니 등록 요청
					System.out.println("등록 요청");
					
					/*String list = request.getParameter("cart_list");
					String[] split_list = list.split(",");
					
				
						Cart_VO cart_vo = new Cart_VO();
						cart_vo.setCart_img(split_list[0]);
						cart_vo.setCart_name(split_list[1]);
						cart_vo.setCart_price(split_list[2]);
						cart_vo.setCart_amount(split_list[3]);
						cart_vo.setCart_size(split_list[4]);
						cart_vo.setProduct_code(split_list[5]);
				
					new Cart_DAO().cart_insert(cart_vo, id);*/
					
					ArrayList<Cart_VO> cart_list = new ArrayList<Cart_VO>();
					
					String list = request.getParameter("cart_list");
					String[] split_list = list.split(",");
					Cart_VO cart_vo=null;
					
					for(int i=0;i<split_list.length;i++)
						System.out.println(split_list[i]);
					
					for(int i=0;i<(split_list.length/6);i++) {
						for(int j=(6*(i+1)-6);j<(6*(i+1)-6)+1;j++) {
							cart_vo = new Cart_VO();
							cart_vo.setCart_img(split_list[j]);
							cart_vo.setCart_name(split_list[j+1]);
							cart_vo.setCart_price(split_list[j+2]);
							cart_vo.setCart_amount(split_list[j+3]);
							cart_vo.setCart_size(split_list[j+4]);
							cart_vo.setProduct_code(split_list[j+5]);
							cart_list.add(cart_vo);
						}
					}
					new Cart_DAO().cart_list_insert(cart_list, id);
				}
				
				else if (request.getParameter("action").equals("amount_update")) {	// 장바구니 수량 변경 요청
					product_code = request.getParameter("product_code");
					System.out.println(product_code);
					
					@SuppressWarnings("rawtypes")
					int amount_map = (int) ((HashMap) session.getAttribute("amount_map")).get(product_code); // product_code : 상품 행  (key : value)
					
					System.out.println(amount_map);

					String[] cart_amount = request.getParameterValues("cart_amount"); // 수량 name 전부 읽어옴
					System.out.println(cart_amount[0]);
					System.out.println(cart_amount[amount_map]);

					String result = cart_dao.amount_update(id, product_code, cart_amount[amount_map]);
					System.out.println(result);
				}
				
				else if (request.getParameter("action").equals("order_delete")) { // 장바구니 한 줄 삭제 요청
					product_code = request.getParameter("product_code");
					System.out.println(product_code);
					cart_dao.cart_delete(id, product_code);
				}
// action 분기 처리 종료
			
				ArrayList<Cart_VO> cart_list = cart_dao.cart_select(id);  	// 일반조회 / 수정,삭제 등 변경 뒤 재조회 등  	최종 조회
				session.setAttribute("cart_list", cart_list);				// 및 저장
			}
			
// ID 비교 종료, else ID관련 오류 발생시			
			else
				System.out.println("회원검사 오류");
			
// 최종문단 종료, Cart.jsp 이동			
			response.sendRedirect("/cart/Cart.jsp");	

	}

}
