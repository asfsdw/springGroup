package study.j0806;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/Test06")
public class Test06 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		String loginOk = "NO";
		
		if(mid.equals("admin") && pwd.equals("1234")) loginOk = "OK";
		
		PrintWriter out = response.getWriter();
		if(loginOk.equals("OK")) {
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/0806/test06_member.jsp?mid="+mid+"';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('로그인에 실패했습니다..');");
			out.println("location.href='"+request.getContextPath()+"/study/0806/test06.jsp';");
			out.println("</script>");
		}
	}
}
