package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.test1")
public class Extension2Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/mapping/";
		
		if(com.equals("home")) {
			viewPage += "home";
		}
		else if(com.equals("guest")) {
			viewPage += "guest";
		}
		else if(com.equals("board")) {
			viewPage += "board";
		}
		else if(com.equals("pds")) {
			viewPage += "pds";
		}
		else viewPage += "extension2";
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
