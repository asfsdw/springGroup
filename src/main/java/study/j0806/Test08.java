package study.j0806;

import java.io.IOException;

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
		
		// null 체크
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content");
		String fileName = request.getParameter("fileName");
		
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
		hobby = mountain.substring(0, mountain.length()-1);
		System.out.println(mountain);
		
		// replace를 사용해 자기소개 \n을 <br/>로 치환
		content = content.replace("\n", "<br/>");
		
		// 서버에 정상적으로 처리된 자료를 View페이지로 전송시켜서 예쁘게 출력시켜준다.
	}
}
