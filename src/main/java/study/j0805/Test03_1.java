package study.j0805;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/test03Ok")
public class Test03_1 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		response.setContentType("text/html; charset=utf-8");
	
		response.getWriter().append("name: "+name+"<br/>");
		response.getWriter().append("age: "+age+"<br/>");
		response.getWriter().append("<a href='0805/test03.jsp'>return</a><br/><hr/>");
		PrintWriter out = response.getWriter();
		out.println("이름: "+name+"<br/>");
		out.println("나이: "+age+"<br/>");
		out.println("<a href='0805/test03.jsp'>돌아가기</a><br/><hr/>");
	}
}
