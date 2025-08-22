package study2.ajax.friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.login.LoginDAO;

@SuppressWarnings("serial")
@WebServlet("/study2/ajax/friend/FriendDelete")
public class FriendDelete extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		LoginDAO dao = new LoginDAO();
		System.out.println(mid);
		int res = dao.setFriendDelete(mid);
		
		response.getWriter().write(res+"");
	}
}
