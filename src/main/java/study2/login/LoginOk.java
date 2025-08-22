package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		// DB에서 아이디와 비밀번호 일치하는지 확인.
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIDCheck(mid);
		
		
		if(vo.getMid() != null) {
			// 아이디가 admin이 아닐경우 pwd ^ saltKey 로 DB에 저장된 비밀번호 비교.
			if(!mid.equals("admin")) {
				String saltKey = vo.getPwd().substring(0,5);
				pwd = (Integer.parseInt(pwd) ^ Integer.parseInt(saltKey))+"";
				pwd = saltKey+""+pwd;
			}
			
			if(pwd.equals(vo.getPwd())) {
				// 정상적으로 로그인이 된 후의 처리.
				String idSave = request.getParameter("idSave") == null ? "off" : request.getParameter("idSave");
				Cookie cookieMid = new Cookie("cMid", mid);
				cookieMid.setPath("/");
	
				if(idSave.equals("on")) cookieMid.setMaxAge(60*60*24*7);
				else cookieMid.setMaxAge(0);
				response.addCookie(cookieMid);
				
				// 기억해야할 로그인 중인 회원의 정보가 있다면 session 에 저장.
				HttpSession session = request.getSession();
				session.setAttribute("sMid", mid);
				session.setAttribute("sNickName", vo.getNickName());
				
				out.println("<script>");
				out.println("alert('"+vo.getName()+"님 로그인에 성공하셨습니다.');");
//				out.println("location.href='"+request.getContextPath()+"/study2/login/LoginMain';");
				out.println("location.href='"+request.getContextPath()+"/main';");
				out.println("</script>");
			}
		}
		else {
			out.println("<script>");
			out.println("alert('로그인에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/Login';");
			out.println("</script>");
		}
	}
}
