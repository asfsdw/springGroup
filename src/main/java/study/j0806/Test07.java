package study.j0806;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/Test07")
public class Test07 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		if(mid.equals("admin") && pwd.equals("1234")) response.sendRedirect(request.getContextPath()+"/study/0806/test07_member.jsp?mid="+mid+"&msgFlag=ok");
		else response.sendRedirect(request.getContextPath()+"/study/0806/test07.jsp?msgFlag=no");
	}
}
