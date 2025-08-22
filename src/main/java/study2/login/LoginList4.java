package study2.login;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.table.DefaultTableModel;

@SuppressWarnings({"unused", "rawtypes", "serial"})
@WebServlet("/study2/login/LoginList4")
public class LoginList4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vector vData, title;
		DefaultTableModel dtm;
		LoginDAO dao = new LoginDAO();
		
		vData = dao.getLoginListVData();
		
		String str = "";
		for(Object vo : vData) {
			str += vo+"<br/>";
		}
		response.getWriter().write(str);
	}
}
