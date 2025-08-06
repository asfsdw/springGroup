package study.j0805;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0805/Test08")
public class Test08 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		
		int su = Integer.parseInt(request.getParameter("su"));
		int tot = 0;
		
		for(int i=1; i<=su; i++) {
			tot += i;
		}
		System.out.println(tot);
		
		out.println("이곳은 service 메소드 입니다.");
		out.println("<p><input type='button' value='결과보기' onclick='location.href=\""+request.getContextPath()+"/study/0805/test08Ok.jsp?tot="+tot+"\"' /></p>");
	}
}
