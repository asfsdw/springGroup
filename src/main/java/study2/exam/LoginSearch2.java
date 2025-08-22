package study2.exam;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginSearch2")
public class LoginSearch2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIDCheck(mid);
		
		// 입력한 순서대로 저장되는 Map
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("mid", vo.getMid());
		map.put("nickName", vo.getNickName());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+"");
		map.put("gender", vo.getGender());
		map.put("address", vo.getAddress());
		
		// 입력한 순서 바뀌진 않는 Gson
		Gson gson = new GsonBuilder().create();
		response.getWriter().write(gson.toJson(map));
	}
}
