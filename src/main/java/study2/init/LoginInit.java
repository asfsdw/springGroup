package study2.init;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/init/login")
public class LoginInit extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// web.xml에서 넘어온 공통변수를 세션에 담아준다.
		String officeName = getServletContext().getInitParameter("officeName");
		String officeEmail = getServletContext().getInitParameter("officeEmail");
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("sOfficeName", officeName);
		session.setAttribute("sOfficeEmail", officeEmail);
		
		// 어플리케이션 객체 생성
		ServletContext application = request.getServletContext();
		application.setAttribute("aTest", "값test");
		
		String viewPage = "/WEB-INF/study2/init/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
