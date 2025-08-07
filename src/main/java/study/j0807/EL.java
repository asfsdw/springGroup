package study.j0807;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0807/EL")
public class EL extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; setchar=utf-8");
		String name2 = request.getParameter("name2") == null ? "" : request.getParameter("name2");
		String job = request.getParameter("job") == null ? "" : request.getParameter("job");
		
		request.setAttribute("name2", name2);
		request.setAttribute("job", job);
		
		String viewPage = "/study/0807/el.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
