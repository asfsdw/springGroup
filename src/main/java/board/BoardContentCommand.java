package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardContentCommand implements CommonInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag") == null || request.getParameter("pag") == "") ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize") == null || request.getParameter("pageSize") == "") ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		
		HttpSession session = request.getSession();
		List<String> contentReadNum = (List<String>)session.getAttribute("sContentIdx");
		
		BoardDAO dao = new BoardDAO();
		// 게시글 조회수 증가.
		if(contentReadNum == null) contentReadNum = new ArrayList<String>();
		String tempContentReadNum = "board"+idx;	// 게시판 이름 + 게시글 번호
		if(!contentReadNum.contains(tempContentReadNum)) {
			dao.setBoardReadNumPlus(idx);
			contentReadNum.add(tempContentReadNum);
		}
		session.setAttribute("sContentIdx", contentReadNum);
		
		BoardVO vo = dao.getBoardContent(idx);
		
		// 이전글, 다음글 처리.
		BoardVO preVO = dao.getPreNextSearch(idx, "preVO");
		BoardVO nextVO = dao.getPreNextSearch(idx, "nextVO");
		
		List<BoardReplyVO> replyVOS = dao.getBoardReplyList(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("replyVOS", replyVOS);
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
	}

}
