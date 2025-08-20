package study2.login;

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

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginUpdate")
public class LoginUpdata extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String update = request.getParameter("update") == null ? "" : request.getParameter("update");
		String updateValue = request.getParameter("updateValue") == null ? "" : request.getParameter("updateValue");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIDCheck(mid);
		
		// 수정해야할 mid가 존재하면.
		if(vo.getMid() != null) {
			int res = dao.setMemberUpdate(mid, update, updateValue);
			// 수정 성공했을 시.
			if(res == 1) {
				// 수정 후, vo 입력.
				vo = dao.getLoginIDCheck(mid);
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("mid", vo.getMid());
				map.put("nickName", vo.getNickName());
				map.put("name", vo.getName());
				map.put("age", vo.getAge()+"");
				map.put("gender", vo.getGender());
				map.put("address", vo.getAddress());
				
				Gson gson = new GsonBuilder().create();
				response.getWriter().write(gson.toJson(map));
			}
			else response.getWriter().write("회원정보 수정에 실패했습니다.");
		}
	}
}
