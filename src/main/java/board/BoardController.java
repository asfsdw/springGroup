package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

@SuppressWarnings("serial")
@WebServlet("*.board")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		String viewPage = "/WEB-INF/board/";
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용해주세요.");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("BoardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "boardList";
		}
		else if(com.equals("BoardInput")) {
			viewPage += "boardInput";
		}
		else if(com.equals("BoardInputOk")) {
			command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("BoardContent")) {
			command = new BoardContentCommand();
			command.execute(request, response);
			viewPage += "boardContent";
		}
		else if(com.equals("BoardGoodCheckPlusMinus")) {
			command = new BoardGoodCheckPlusMinusCommand();
			command.execute(request, response);
			return;
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
