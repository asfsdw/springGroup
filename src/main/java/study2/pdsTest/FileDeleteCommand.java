package study2.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class FileDeleteCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");
		String fNames[] = request.getParameterValues("fNames") == null ? new String[0] : request.getParameterValues("fNames");
		// 체크박스에 하나만 체크하고 선택삭제를 클릭했을 경우.
		if(fNames.length == 1) fName = fNames[0];
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		String res = "0";
		
		File file = null;
		
		// 선택삭제를 눌러 fNames가 넘어왔다면.
		if(fNames.length > 1) {
			for(String fNameDelete : fNames) {
				file = new File(realPath+fNameDelete);
				if(file.exists()) file.delete();
			}
			res = "1";
		}
		// 삭제를 눌러서 fName이 넘어왔다면.
		else {
			file = new File(realPath+fName);
			if(file.exists()) file.delete();
			file.delete();
			res = "1";
		}
		response.getWriter().write(res);
	}

}
