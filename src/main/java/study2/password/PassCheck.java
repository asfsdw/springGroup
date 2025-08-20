package study2.password;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/password/PassCheck")
public class PassCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		int flag = (request.getParameter("flag") == null || request.getParameter("flag").equals("")) ? 0 : Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("원본자료");
		System.out.println(pwd);
		System.out.println(flag);
		System.out.println("===========");
		
		if(flag == 1) {
			int saltKey = 0x1234ABCD;
			int encPwd, decPwd;
			
			encPwd = Integer.parseInt(pwd) ^ saltKey;
			
			System.out.println("암호화된 비밀번호");
			System.out.println(encPwd);
			System.out.println("===========");
			
			decPwd = encPwd ^ saltKey;
			
			System.out.println("복호화된 비밀번호");
			System.out.println(decPwd);
			System.out.println("===========");
		}
		else if(flag == 2) {
			int saltKey = (int)(Math.random()*99999-10001+1)+10001;
			int encPwd, decPwd;
			
			encPwd = Integer.parseInt(pwd) ^ saltKey;
			
			System.out.println("암호화된 비밀번호");
			System.out.println(encPwd);
			System.out.println("===========");
			
			decPwd = encPwd ^ saltKey;
			
			System.out.println("복호화된 비밀번호");
			System.out.println(decPwd);
			System.out.println("===========");
			
			// encPwd와 saltKey 둘 다 DB에 저장해야한다.
			System.out.println(encPwd+""+saltKey);
		}
		String viewPage = "/WEB-INF/study2/password/passForm.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
