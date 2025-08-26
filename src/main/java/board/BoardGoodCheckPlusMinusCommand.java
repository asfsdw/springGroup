package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardGoodCheckPlusMinusCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		int goodCnt = (request.getParameter("goodCnt") == null || request.getParameter("goodCnt") == "") ? 0 : Integer.parseInt(request.getParameter("goodCnt"));
		int good = 0;
		
		BoardDAO dao = new BoardDAO();
		// 게시글 좋아요 증감.
		if(session.getAttribute("sGood"+idx) == null) {
			int res = dao.setBoardGoodCheck(idx, goodCnt);
			good++;
			session.setAttribute("sGood"+idx, good);
			response.getWriter().write(res+"");
		}
	}

}
