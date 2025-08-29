package PDS;

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
@WebServlet("*.pds")
public class PDSController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		String viewPage = "/WEB-INF/pds/";
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용해주세요.");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("PDSList")) {
			command = new PDSListCommand();
			command.execute(request, response);
			viewPage += "pdsList";
		}
		else if(com.equals("PDSInput")) {
			request.setAttribute("part", request.getParameter("part"));
			viewPage += "pdsInput";
		}
		else if(com.equals("PDSInputOk")) {
			command = new PDSInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
//		else if(com.equals("BoardGoodCheckPlusMinus")) {
//			command = new BoardGoodCheckPlusMinusCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("BoardDelete")) {
//			command = new BoardDeleteCommand();
//			command.execute(request, response);
//			viewPage = "/include/message";
//		}
//		else if(com.equals("BoardUpdate")) {
//			command = new BoardUpdateCommand();
//			command.execute(request, response);
//			viewPage += "boardUpdate";
//		}
//		else if(com.equals("BoardUpdateOk")) {
//			command = new BoardUpdateOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message";
//		}
//		else if(com.equals("BoardSearchList")) {
//			command = new BoardSearchListCommand();
//			command.execute(request, response);
//			viewPage += "boardSearchList";
//		}
//		else if(com.equals("BoardReplyInput")) {
//			command = new BoardReplyInputCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("BoardReplyDelete")) {
//			command = new BoardReplyDeleteCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("BoardReplyUpdate")) {
//			command = new BoardReplyUpdateCommand();
//			command.execute(request, response);
//			return;
//		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
