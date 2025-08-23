package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class GuestSearchCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx") == null || request.getParameter("idx") == "") ? 0 : Integer.parseInt(request.getParameter("idx"));
		GuestDAO dao = new GuestDAO();
		GuestVO vo = dao.setGuestSearch(idx);
		if(vo.getName() == null) response.getWriter().write("-1");
		else {
			String str = vo.getName()+"／"+vo.getvDate()+"／"+vo.getEmail()+"／"+vo.getHomePage()+"／"+vo.getContent();
			response.getWriter().write(str);
		}
	}

}
