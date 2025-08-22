package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.test5")
public class Extension5Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Extension4Interface command = null;
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/mapping/";
		
		if(com.equals("Home5")) {
			command = new Home5Command();
			command.execute(request, response);
			viewPage += "home5";
		}
		else if(com.equals("Guest5")) {
			command = new Guest5Command();
			command.execute(request, response);
			viewPage += "guest5";
		}
		else if(com.equals("Board5")) {
			command = new Board5Command();
			command.execute(request, response);
			viewPage += "board5";
		}
		else if(com.equals("PDS5")) {
			command = new PDS5Command();
			command.execute(request, response);
			viewPage += "pds5";
		}
		else viewPage += "extension5";
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
