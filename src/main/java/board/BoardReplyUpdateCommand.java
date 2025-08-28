package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardReplyUpdateCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyIdx = (request.getParameter("replyIdx") == null || request.getParameter("replyIdx") == "") ? 0 : Integer.parseInt(request.getParameter("replyIdx"));
		String replyContent = request.getParameter("replyContent") == null ? "" : request.getParameter("replyContent");
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setReplyUpdateOk(replyIdx, replyContent);
		response.getWriter().write(res+"");
	}

}
