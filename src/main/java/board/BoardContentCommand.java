package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardContentCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		int read = 0;
		
		BoardDAO dao = new BoardDAO();
		// 게시글 조회수 증가.
		if(session.getAttribute("sRead"+idx) == null) {
			dao.setBoardReadNumPlus(idx);
			read++;
			session.setAttribute("sRead"+idx, read);
		}
		BoardVO vo = dao.getBoardContent(idx);
		
		if(vo.getContent() != null)	request.setAttribute("vo", vo);
	}

}
