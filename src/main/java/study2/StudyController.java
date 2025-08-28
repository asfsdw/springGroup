package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;
import study2.pdsTest.FileDeleteCommand;
import study2.pdsTest.FileListCommand;
import study2.pdsTest.FileUploadOk1Command;
import study2.uuid.UUIDProcessCommand;

@SuppressWarnings("serial")
@WebServlet("*.study")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/";
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용해주세요.");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("UUID")) {
			viewPage += "uuid/uuid";
		}
		else if(com.equals("UUIDProcess")) {
			command = new UUIDProcessCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("FileUpload")) {
			viewPage += "pdsTest/fileUpload";
		}
		else if(com.equals("FileUpload1")) {
			viewPage += "pdsTest/fileUpload1";
		}
		else if(com.equals("FileUploadOk1")) {
			command = new FileUploadOk1Command();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("FileList")) {
			command = new FileListCommand();
			command.execute(request, response);
			viewPage += "pdsTest/fileList";
		}
		else if(com.equals("FileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
//		else if(com.equals("PDSInput")) {
//			viewPage += "pdsInput";
//		}
//		else if(com.equals("PDSInputOk")) {
//			command = new PDSInputOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message";
//		}
//		else if(com.equals("BoardDelete")) {
//			command = new BoardDeleteCommand();
//			command.execute(request, response);
//			viewPage = "/include/message";
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
