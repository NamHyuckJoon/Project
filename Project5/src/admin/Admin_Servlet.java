package admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.Product_DAO;
import product.Product_VO;

import org.apache.commons.net.ftp.*;

public class Admin_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Admin_Servlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (request.getParameter("test") != null && request.getParameter("test").equals("1")) {
			Product_VO product_vo = new Product_VO();

			int maxSize = 5 * 1024 * 1024; // 5MB
			String encoding = "utf-8";

			String realFolder = request.getSession().getServletContext().getRealPath("/") + "upload/";
			System.out.println(realFolder);

			File targetDir = new File(realFolder);
			if (!targetDir.exists()) {
				targetDir.mkdirs();
			}

			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encoding,
					new DefaultFileRenamePolicy());

			String category_folder = multi.getParameter("category_code")+"/";
			
			if (multi.getFile("userFile") != null) {
				System.out.println("파일 있음");

				String userName = multi.getParameter("userName");
				String fileName = multi.getFilesystemName("userFile");
				String originFileName = multi.getOriginalFileName("userFile");

				File file = multi.getFile("userFile");
				String filePath = realFolder;

				String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
				String realfileName = now + fileName;

				FTPClient ftpClient = null;

				try {
					ftpClient = new FTPClient();
					ftpClient.setControlEncoding("utf-8");
					ftpClient.connect("211.218.150.109", 5001);

					int reply = ftpClient.getReplyCode(); //
					if (!FTPReply.isPositiveCompletion(reply)) {
						ftpClient.disconnect();
						System.out.println("FTP server refused connection.");
					} else {

						System.out.print(ftpClient.getReplyString());

						ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
						ftpClient.setSoTimeout(10000);
						ftpClient.login("ci2017whiteday", "2017whiteday");
						ftpClient.enterLocalPassiveMode();

						File put_file = new File(filePath + fileName);
						InputStream inputStream = new FileInputStream(put_file);

						boolean result = ftpClient.storeFile("/www/JSP/" + category_folder + realfileName, inputStream);
						inputStream.close();

						ftpClient.logout();
						product_vo.setProduct_img("http://ci2017whiteday.dongyangmirae.kr/JSP/" + category_folder + realfileName);
						
					}
				} catch (Exception e) {
					System.out.println(e);
					e.printStackTrace();
				} finally {
					if (ftpClient != null && ftpClient.isConnected()) {
						try {
							ftpClient.disconnect();
						} catch (IOException ioe) {
							ioe.printStackTrace();
						}
					}
				}
				
			}
			// file true false end
			else {
				product_vo.setProduct_img("/Project/IMG/admin/NO_IMAGE.PNG"); // 하드코딩 수정 필
			}
			
			

			product_vo.setCategory_code(multi.getParameter("category_code"));
			product_vo.setProduct_name(multi.getParameter("product_name"));
			product_vo.setProduct_price(multi.getParameter("product_price"));


			// 이미지 뭐줄꺼니

			ArrayList<Product_VO> product_list = new ArrayList<Product_VO>();

			if (multi.getParameter("option_cnt") != null) {
				for (int i = 0; i <= Integer.parseInt(multi.getParameter("option_cnt")); i++) {
					Product_VO product_vo_option = new Product_VO();

					if (multi.getParameterValues("product_color")[i] != null)
						product_vo_option.setProduct_color(multi.getParameterValues("product_color")[i]);

					if (multi.getParameterValues("product_size")[i] != null)
						product_vo_option.setProduct_size(multi.getParameterValues("product_size")[i]);

					if (multi.getParameterValues("product_amount")[i] != null)
						product_vo_option.setProduct_amount(multi.getParameterValues("product_amount")[i]);

					product_list.add(product_vo_option);

				}
			}

			String result = new Product_DAO().product_insert(product_list, product_vo);
			/*session.setAttribute("Admin_result", result);
			System.out.println(result);*/
/*			response.sendRedirect("/Project/result/Result.jsp");*/
			
			//순서가 너무 뒤죽박죽인데. 마음 가라앉히고 정리가 한번 필요함.

		} // action 종료

		System.out.println("들렀다갑니다.");
		response.sendRedirect("/admin/Admin.jsp");
	}

}
