package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.test4")
public class Extension4Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Extension4Interface command = null;
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/mapping/";
		
		if(com.equals("Home4")) {
			command = new Home4Command();
			command.execute(request, response);
			viewPage += "home4";
		}
		else if(com.equals("Guest4")) {
			command = new Guest4Command();
			command.execute(request, response);
			viewPage += "guest4";
		}
		else if(com.equals("Board4")) {
			command = new Board4Command();
			command.execute(request, response);
			viewPage += "board4";
		}
		else if(com.equals("PDS4")) {
			command = new PDS4Command();
			command.execute(request, response);
			viewPage += "pds4";
		}
		else viewPage += "extension4";
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
