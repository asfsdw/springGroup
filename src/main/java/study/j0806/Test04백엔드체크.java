package study.j0806;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/Test04")
public class Test04백엔드체크 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = (request.getParameter("name") == null || request.getParameter("name").equals("")) ? "홍길동" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		
		name = URLEncoder.encode(name, "utf-8");
		
		response.sendRedirect(request.getContextPath()+"/study/0806/test04Ok.jsp?name="+name+"&age="+age);
	}
}
