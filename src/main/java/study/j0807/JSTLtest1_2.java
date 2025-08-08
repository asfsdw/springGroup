package study.j0807;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.j0806.Test12VO;

@SuppressWarnings("serial")
@WebServlet("/j0807/JSTLtest1_2")
public class JSTLtest1_2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		List<Test12VO> vos = new ArrayList<Test12VO>();

		String[] members = request.getParameter("member").split(",");
		for(String member : members) {
			System.out.println(member);
			
			Test12VO vo = new Test12VO();
			String[] items = member.split("/");
			
			vo.setName(items[0]);
			vo.setAge(Integer.parseInt(items[1]));
			vo.setGender(items[2]);
			vo.setJob(items[3]);
			
			vos.add(vo);
		}
		
		// 작업(DB) 처리 완료 후, view에 넘겨준다.
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/0807/jstl01_1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
