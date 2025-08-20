package study2.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.login.LoginDAO;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginJoinOk")
public class LoginJoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String address = request.getParameter("address") == null? "" : request.getParameter("address");
		
		LoginDAO dao = new LoginDAO();
		// 아이디, 닉네임 중복검사(DB에서 중복 불가능 한 항목이 idx, mid, nickName)).
		// 검색 결과가 없으면(중복이 아니면)flase.
		boolean tf = dao.getLoginJoinIDCheck(mid, nickName);
		if(!tf) {
			int res = 0;
			// DB에 회원정보 입력.
			res = dao.getLoginJoin(mid, pwd, nickName, name, age, gender, address);
			if(res == 1) {
				out.println("<script>");
				out.println("alert('회원가입에 성공하셨습니다.');");
				out.println("location.href='"+request.getContextPath()+"/study2/login/Login'");
				out.println("</script>");
			}
			// DB입력에 실패했을 경우.
			else {
				out.println("<script>");
				out.println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
				out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin'");
				out.println("</script>");
			}
		}
		// 아이디와 닉네임 검색 결과가 있으면(중복이면)
		else {
			out.println("<script>");
			out.println("alert('아이디 혹은 닉네임이 중복되었습니다. 아이디나 닉네임을 바꾸고 다시 시도해주세요.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin'");
			out.println("</script>");
		}
	}
}
