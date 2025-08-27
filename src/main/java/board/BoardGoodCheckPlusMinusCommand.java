package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardGoodCheckPlusMinusCommand implements CommonInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		int goodCnt = (request.getParameter("goodCnt") == null || request.getParameter("goodCnt") == "") ? 0 : Integer.parseInt(request.getParameter("goodCnt"));
		int res = 0;
		
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		List<String> contentReadNum = (List<String>)session.getAttribute("sContentIdx");
		
		// 게시글 좋아요 증가.
		if(contentReadNum == null) contentReadNum = new ArrayList<String>();
		String tempContentReadNum = "boardGood"+idx;	// 게시판 이름 + 게시글 번호
		if(!contentReadNum.contains(tempContentReadNum)) {
			res = dao.setBoardGoodCheck(idx, goodCnt);
			contentReadNum.add(tempContentReadNum);
		}
		session.setAttribute("sContentIdx", contentReadNum);
		response.getWriter().write(res+"");
	}

}
