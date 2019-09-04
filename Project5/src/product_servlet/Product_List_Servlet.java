package product_servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.Product_VO;

public class Product_List_Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String category_code = request.getParameter("category_code");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<Product_VO> arr =null;
		ArrayList<Product_VO> arr1=null;

		
		//페이지 번호
        int totalRecord = dao.selectPage(Integer.parseInt(category_code));
        int totalPage=0;
        if(totalRecord % 8 ==0) {
            totalPage = totalRecord  / 8;
        }else {
            totalPage = totalRecord  / 8 + 1;
        }    
        request.setAttribute("totalPage",totalPage);
        
        //페이지에 따른 리스트 
        String pnum = request.getParameter("pagenum");
		int pagenum=1;
		int endnum=1;
		if(pnum != null){
			pagenum = Integer.parseInt(pnum);
			if(pagenum>=2) {
				pagenum = ((pagenum-1)*8)+1;
			}
			endnum= pagenum+7;
			arr1 = dao.selectCategory(Integer.parseInt(category_code),pagenum,endnum);
		}else{
			pagenum=1;
			endnum= pagenum*8;
			arr1 = dao.selectCategory(Integer.parseInt(category_code),pagenum,endnum);
		}
		
		//setAttribute
		request.setAttribute("category_code",category_code);
		request.setAttribute("product_List",arr1);
		
		RequestDispatcher rd = request.getRequestDispatcher("/product/product_List.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
