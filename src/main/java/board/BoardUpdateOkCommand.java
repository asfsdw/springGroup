package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardUpdateOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag") == null || request.getParameter("pag") == "") ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize") == null || request.getParameter("pageSize") == "") ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String title = request.getParameter("title") == null ? "" : request.getParameter("title");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIP = request.getParameter("hostIP") == null ? "" : request.getParameter("hostIP");
		String openSW = request.getParameter("openSW") == null ? "" : request.getParameter("openSW");
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIP(hostIP);
		vo.setOpenSW(openSW);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardUpdateOk(vo);
		if(res > 0) {
			request.setAttribute("message", "게시글을 수정했습니다.");
			request.setAttribute("url", "BoardContent.board?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("message", "게시글을 수정하지 못했습니다.");
			request.setAttribute("url", "BoardUpdate.board?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}

}
