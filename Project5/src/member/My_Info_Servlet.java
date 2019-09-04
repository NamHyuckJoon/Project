package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class My_Info_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if (request.getParameter("action") == null ) {
			System.out.println("myinfo : action=null");
			
			HttpSession session = request.getSession();
			
			Member_DAO dao = new Member_DAO();
			Member_VO vo = new Member_VO();
			String id = (String)session.getAttribute("id");
			
			vo = dao.my_info_select(id);
			request.setAttribute("member", vo);	
			

			String page = "/member/My_Info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			// response.sendRedirect("/member/Join.jsp");
		}
		
		else if (request.getParameter("action") != null && request.getParameter("action").equals("myinfo")) {
			System.out.println("myinfo : action=myinfo");
			
			Member_VO mem_vo = new Member_VO();
			mem_vo.setId(request.getParameter("id"));
			mem_vo.setPw(request.getParameter("pw"));
			
			StringBuffer phone_buffer = new StringBuffer();
			phone_buffer.append(request.getParameter("txtMobile1")+"-");
			phone_buffer.append(request.getParameter("txtMobile2")+"-");
			phone_buffer.append(request.getParameter("txtMobile3"));
			
			String phone = phone_buffer.toString();
			phone_buffer.delete(0, phone_buffer.length());
			
			mem_vo.setPhone(phone);
			
			StringBuffer address_buffer = new StringBuffer();
			address_buffer.append(request.getParameter("postcode")+"/");
			address_buffer.append(request.getParameter("address")+"/");
			address_buffer.append(request.getParameter("detailAddress")+"/");
			address_buffer.append(request.getParameter("extraAddress"));
			
			String address = address_buffer.toString();
			address_buffer.delete(0, address_buffer.length());
			
			mem_vo.setAddress(address);
			
			Member_DAO dao = new Member_DAO();
			String result = dao.my_info_update(mem_vo);
			
			request.setAttribute("result", result);
			
			
			
			response.sendRedirect("/Main");
		}
		
	}

}
