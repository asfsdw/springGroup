package study.exam;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/exam/Ex04Ok")
public class Ex04Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		// 아이디 저장 체크.
		boolean reMid = request.getParameter("rememberMid") != null;
		// 비밀번호 저장 체크.
		boolean rePwd = request.getParameter("rememberPwd") != null;
		
		if((mid.equals("") || Objects.isNull(mid) || !mid.equals("admin"))
				|| (pwd.equals("") || Objects.isNull(pwd) || !pwd.equals("1234!"))) {
			response.sendRedirect(request.getContextPath()+"/study/exam/ex04_cookie.jsp?loginSF=fail");
			return;
		}
		
		Cookie cookieMid = new Cookie("cMid", mid);
		Cookie cookiePwd = new Cookie("cPwd", pwd);
		// 패스 지정 안 해주면 Ex04Ok에서만 쿠키가 저장되고, ex04_cookie에서 불러오지 못함.
		cookieMid.setPath(request.getContextPath());
		cookiePwd.setPath(request.getContextPath());
		// 아이디 저장에 체크했을 시.
		if(reMid) {
			cookieMid.setMaxAge(60*60*24);
			response.addCookie(cookieMid);
		}
		else {
			cookieMid.setMaxAge(0);
			response.addCookie(cookieMid);
		}
		// 비밀번호 저장에 체크했을 시.
		if(rePwd) {
			cookiePwd.setMaxAge(60*60*24);
			response.addCookie(cookiePwd);
		}
		else {
			cookiePwd.setMaxAge(0);
			response.addCookie(cookiePwd);
		}
		
		String viewPage = "/study/exam/ex04_loginOk.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
