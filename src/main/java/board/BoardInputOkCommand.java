package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardInputOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title") == null ? "" : request.getParameter("title");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIP = request.getParameter("hostIP") == null ? "" : request.getParameter("hostIP");
		String openSW = request.getParameter("openSW") == null ? "" : request.getParameter("openSW");
		
		BoardVO vo = new BoardVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIP(hostIP);
		vo.setOpenSW(openSW);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoardInputOk(vo);
		if(res > 0) {
			request.setAttribute("message", "게시글이 등록되었습니다.");
			request.setAttribute("url", "BoardList.board");
		}
		else {
			request.setAttribute("message", "게시글 등록에 실패했습니다.");
			request.setAttribute("url", "BoardInput.board");
		}
	}

}
