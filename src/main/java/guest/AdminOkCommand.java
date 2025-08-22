package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;
import study2.login.LoginDAO;
import study2.login.LoginVO;

public class AdminOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIDCheck(mid);
		
		if(vo.getMid() != null) {
			if(pwd.equals(vo.getPwd())) {
				// 정상적으로 로그인이 된 후의 처리.
				HttpSession session = request.getSession();
				session.setAttribute("sAdmin", "adminOK");
				
				request.setAttribute("message", "관리자 인증 성공");
				request.setAttribute("url", "GuestList.guest");
			}
		}
		else {
			request.setAttribute("message", "관리자 인증 실패");
			request.setAttribute("url", "Admin.guest");
		}
	}

}
