package study.j0805;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/j0805/Test05_1","/j0805/Test05_2","/j0805/test05Ok"})
public class Test05_1 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("이곳은 "+flag+"번 플래그의 Get 메소드입니다.");
		response.getWriter().append("<input type='button' value='돌아가기(Servlet"+flag+")' onclick='history.back()' />");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("이곳은 post("+flag+") 메소드입니다.");
		response.getWriter().append("<input type='button' value='돌아가기(Servlet"+flag+")' onclick='history.back()' />");
	}
}
