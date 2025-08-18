package study2.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/filter/Test01_OK")
public class Test01_OK extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String introduce = request.getParameter("introduce") == null ? "" : request.getParameter("introduce");
		
		System.out.println(content);
		System.out.println(introduce);
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 Test01_OK 컨트롤러입니다.");
		out.println();
		
		request.setAttribute("message", "Test01_OK 컨트롤러에서 보냅니다.");
		
		String viewPage = "/WEB-INF/study2/filter/test01_filterRes.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
