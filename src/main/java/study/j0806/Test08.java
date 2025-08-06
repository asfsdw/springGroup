package study.j0806;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/Test08")
public class Test08 extends HttpServlet {
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
		
		// null 체크
		if(request.getParameter("name") == null || request.getParameter("name").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else {
			name = request.getParameter("name");
		}
		if(request.getParameter("age") == null || request.getParameter("age").toString().equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else {
			age = Integer.parseInt(request.getParameter("age"));
		}
		if(request.getParameter("gender") == null || request.getParameter("gender").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else {
			gender = request.getParameter("gender");
		}
		if(request.getParameterValues("hobby") == null || request.getParameterValues("hobby").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else{
			hobbys = request.getParameterValues("hobby");
		}
		if(request.getParameter("job") == null || request.getParameter("job").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else{
			job = request.getParameter("job");
		}
		if(request.getParameterValues("mountain") == null || request.getParameterValues("mountain").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else {
			mountains = request.getParameterValues("mountain");
		}
		if(request.getParameter("content") == null || request.getParameter("content").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else{
			content = request.getParameter("content");
		}
		if(request.getParameter("fileName") == null || request.getParameter("fileName").equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/0806/test08.jsp?reg=fail");
		}
		else {
			fileName = request.getParameter("fileName");
		}
		
		// 정상적으로 넘어왔는지를 서버에서 체크
		System.out.println("성명: "+name);
		System.out.println("나이: "+age);
		System.out.println("성별: "+gender);
		System.out.println("취미");
		for(int i=0; i<hobbys.length; i++) {
			System.out.print(hobbys[i]+" ");
		}
		System.out.println();
		System.out.println("직업: "+job);
		System.out.println("가본 산");
		for(int i=0; i<mountains.length; i++) {
			System.out.print(mountains[i]+" ");
		}
		System.out.println();
		System.out.println("자기소개: "+content);
		System.out.println("파일명: "+fileName);
		
		// 넘어온 자료를 DB에 넣기 위해 편집
		String hobby = "";
		for(String h : hobbys) {
			hobby += h + "/";
		}
		hobby = hobby.substring(0, hobby.length()-1);
		System.out.println(hobby);
		
		// 가본 산
		String mountain = "";
		for(String m : mountains) {
			mountain += m + "/";
		}
		mountain = mountain.substring(0, mountain.length()-1);
		System.out.println(mountain);
		
		// replace를 사용해 자기소개 \n을 <br/>로 치환
		content = content.replace("\n", "<br/>");
		
		name = URLEncoder.encode(name,"utf-8");
		gender = URLEncoder.encode(gender,"utf-8");
		hobby = URLEncoder.encode(hobby,"utf-8");
		job = URLEncoder.encode(job,"utf-8");
		mountain = URLEncoder.encode(mountain,"utf-8");
		content = URLEncoder.encode(content,"utf-8");
		fileName = URLEncoder.encode(fileName,"utf-8");
		
		// 서버에 정상적으로 처리된 자료를 View페이지로 전송시켜서 예쁘게 출력시켜준다.
		response.sendRedirect(request.getContextPath()+"/study/0806/test08Ok.jsp?name="+name+"&age="+age+"&gender="+gender+"&hobbys="+hobby+"&job="+job+
				"&mountains="+mountain+"&content="+content+"&fileName="+fileName);
	}
}
