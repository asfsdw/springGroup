package study2.sha;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;
import common.SecurityUtil;

public class SHAOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String rePwd = pwd;
		
		String salt = UUID.randomUUID().toString().substring(0, 4);
		SecurityUtil security = new SecurityUtil();
		
		pwd = security.encryptSHA256(pwd + salt);
		rePwd = security.encryptSHA256(rePwd + salt);
		
		response.getWriter().write(pwd+"<br/>"+rePwd);
	}

}
