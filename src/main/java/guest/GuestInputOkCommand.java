package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class GuestInputOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String hostIp = request.getParameter("hostIp") == null ? "" : request.getParameter("hostIp");
		
		GuestVO vo = new GuestVO();
		vo.setName(name);
		vo.setContent(content);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setHostIP(hostIp);
		
		GuestDAO dao = new GuestDAO();
		int res = dao.setGuestInputOk(vo);
		if(res != 0) {
			request.setAttribute("message", "방명록이 작성되었습니다.");
			request.setAttribute("url", "GuestList.guest");
		}
		else {
			request.setAttribute("message", "방명록 작성에 실패했습니다.");
			request.setAttribute("url", "GuestInput.guest");
		}
	}

}
