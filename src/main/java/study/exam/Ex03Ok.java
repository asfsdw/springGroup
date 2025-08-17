package study.exam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/exam/Ex03Ok")
public class Ex03Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		List<Ex03VO> vos = new ArrayList<>();
		
		String[] members = request.getParameter("member").split(",");
		for(String member : members) {
			Ex03VO vo = new Ex03VO();
			String[] student = member.split("/");
			
			vo.setHakbun(Integer.parseInt(student[0]));
			vo.setKor(Integer.parseInt(student[1]));
			vo.setEng(Integer.parseInt(student[2]));
			vo.setMat(Integer.parseInt(student[3]));
			vo.setSci(Integer.parseInt(student[4]));
			vo.setSoc(Integer.parseInt(student[5]));
			vo.setTot(vo.getKor()+vo.getEng()+vo.getMat()+vo.getSci()+vo.getSoc());
			vo.setAvr(vo.getTot()/5.0);
			if(vo.getAvr() >= 90) vo.setGrade("A");
			else if(vo.getAvr() >= 80) vo.setGrade("B");
			else if(vo.getAvr() >= 70) vo.setGrade("C");
			else if(vo.getAvr() >= 60) vo.setGrade("D");
			else vo.setGrade("F");
			
			vos.add(vo);
		}
		
		// 순위처리.
		Collections.sort(vos, Comparator.comparingInt(Ex03VO::getTot).reversed());
		int rank = 1;
		for(int i=0; i<vos.size(); i++) {
			if(i> 0 && vos.get(i).getTot() == vos.get(i-1).getTot()) vos.get(i).setRanking(vos.get(i-1).getRanking());
			else vos.get(i).setRanking(rank);
			rank++;
		}
		
		request.setAttribute("vos", vos);
		String viewPage = "/study/exam/ex03_vos1_View.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
