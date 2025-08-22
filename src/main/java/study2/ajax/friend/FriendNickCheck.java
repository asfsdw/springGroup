package study2.ajax.friend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/study2/ajax/friend/FriendNickCheck")
public class FriendNickCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginNickCheck(nickName);
		
		int res = 0;
		if(vo.getNickName() == null) res = 1;
		
		request.setAttribute("res", res);
		request.setAttribute("nickName", nickName);
		
		String viewPage = "/WEB-INF/study2/ajax/friend/friendNickCheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
