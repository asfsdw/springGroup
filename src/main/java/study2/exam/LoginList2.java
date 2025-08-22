package study2.exam;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginList2")
public class LoginList2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = "";
		LoginDAO dao = new LoginDAO();
		List<LoginVO> vos = dao.getLoginList();
		// 향상된 for문으로 회원마다 줄바꿈, 필요없는 loginVO 문구 삭제.
		for(LoginVO vo : vos) {
			str += vo+"<br/>";
			str = str.replace("loginVO", "");
		}
		response.getWriter().write(str);
	}
}
