package study.j0806;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/Test12")
public class Test12 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = "";
		int age = 0;
		String gender = "";
		String[] hobbys = {""};
		String job = "";
		String[] mountains = {""};
		String content = "";
		String fileName = "";
		
		if(request.getParameter("name") == null || request.getParameter("name").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else {
			name = request.getParameter("name");
		}
		if(request.getParameter("age") == null || request.getParameter("age").toString().equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else {
			age = Integer.parseInt(request.getParameter("age"));
		}
		if(request.getParameter("gender") == null || request.getParameter("gender").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else {
			gender = request.getParameter("gender");
		}
		if(request.getParameterValues("hobby") == null || request.getParameterValues("hobby")[0].equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else{
			hobbys = request.getParameterValues("hobby");
		}
		if(request.getParameter("job") == null || request.getParameter("job").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else{
			job = request.getParameter("job");
		}
		if(request.getParameterValues("mountain") == null || request.getParameterValues("mountain")[0].equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else {
			mountains = request.getParameterValues("mountain");
		}
		if(request.getParameter("content") == null || request.getParameter("content").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else{
			content = request.getParameter("content");
		}
		if(request.getParameter("fileName") == null || request.getParameter("fileName").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test12_mvc.jsp?reg=fail");
		}
		else {
			fileName = request.getParameter("fileName");
		}
		
		String hobby = "";
		for(String h : hobbys) {
			hobby += h + ", ";
		}
		hobby = hobby.substring(0, hobby.length()-2);
		
		String mountain = "";
		for(String m : mountains) {
			mountain += m + ", ";
		}
		mountain = mountain.substring(0, mountain.length()-2);
		
		content = content.replace("\n", "<br/>");
		
		Test12VO vo = new Test12VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setHobby(hobby);
		vo.setJob(job);
		vo.setMountain(mountain);
		vo.setContent(content);
		vo.setFileName(fileName);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0806/test12Ok.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
