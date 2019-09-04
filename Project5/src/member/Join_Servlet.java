package member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Join_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if (request.getParameter("action") == null ) {
			System.out.println("Join : action=null");
			
			response.sendRedirect("/member/Join.jsp");
		}
		
		else if (request.getParameter("action") != null && request.getParameter("action").equals("join")) {
			System.out.println("Join : action=join");
			
			Member_VO vo = new Member_VO();
			vo.setId(request.getParameter("id"));
			vo.setPw(request.getParameter("pw"));
			vo.setName(request.getParameter("username"));
			
			StringBuffer phone_buffer = new StringBuffer();
			phone_buffer.append(request.getParameter("txtMobile1")+"-");
			phone_buffer.append(request.getParameter("txtMobile2")+"-");
			phone_buffer.append(request.getParameter("txtMobile3"));
			
			String phone = phone_buffer.toString();
			phone_buffer.delete(0, phone_buffer.length());
			
			vo.setPhone(phone);
			
			StringBuffer address_buffer = new StringBuffer();
			address_buffer.append(request.getParameter("postcode")+"/");
			address_buffer.append(request.getParameter("address")+"/");
			address_buffer.append(request.getParameter("detailAddress"));
			
			String address = address_buffer.toString();
			address_buffer.delete(0, address_buffer.length());
			
			vo.setAddress(address);
			
			
			Member_DAO dao = new Member_DAO();
			String result = dao.join(vo);
			
			request.setAttribute("result", result);
			request.setAttribute("join_vo", vo);
			
			
			String page = "member/Join_Success.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);

			rd.forward(request, response);
		}
		
		else if (request.getParameter("action") != null && request.getParameter("action").equals("join_id_chk")) {
			System.out.println("Join : action=join_id_chk");
			
			Member_DAO dao = new Member_DAO();
			String id = request.getParameter("id");
			Boolean result = dao.join_select(id);
			
			PrintWriter out = response.getWriter();
			out.print(result);
			out.close();
			
			
			System.out.println(result);
		}
	
	}

}
