package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/login/MidSearch")
public class MidSearch extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age") == "") ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = new LoginVO();
		if(gender.equals("")) {
			vo = dao.getLoginIDCheck(mid);
			gender = vo.getGender();
		}
		
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		
		PrintWriter out = response.getWriter();
		int res = dao.setLoginUpdate(vo);
		if(res != 0) {
			out.println("<script>");
			out.println("alert('회원정보가 수정되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/ajax/friend/FriendMain';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원정보 수정 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/study2/ajax/friend/FriendMain';");
			out.println("</script>");
		}
	}
}
