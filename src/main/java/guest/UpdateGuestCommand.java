package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class UpdateGuestCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		vo.setIdx(idx);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		
		int res = dao.setUpdateGuest(vo);
		if(res != 1) response.getWriter().write("방명록 수정에 실패했습니다.");
		else response.getWriter().write("방명록이 수정되었습니다.");
	}

}
