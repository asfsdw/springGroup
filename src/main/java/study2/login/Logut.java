package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/login/Logout")
public class Logut extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid").toString();
		session.invalidate();
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그아웃에 성공하셨습니다.');");
		out.println("location.href='"+request.getContextPath()+"/study2/login/Login';");
		out.println("</script>");
	}
}
