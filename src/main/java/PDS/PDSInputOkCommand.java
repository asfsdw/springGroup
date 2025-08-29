package PDS;

import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;
import common.SecurityUtil;

public class PDSInputOkCommand implements CommonInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());

		Enumeration fNames = multipartRequest.getFileNames();
		String file = "";
		String fName = "";
		String fsName = "";
		while(fNames.hasMoreElements()) {
			file = fNames.nextElement().toString();
			if(multipartRequest.getFilesystemName(file) != null) {
				fName += multipartRequest.getOriginalFileName(file) + "/";
				fsName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		fName = fName.substring(0, fName.lastIndexOf("/"));
		fsName = fsName.substring(0, fsName.length()-1);
		
		String mid = multipartRequest.getParameter("mid") == null ? "" : multipartRequest.getParameter("mid");
		String nickName = multipartRequest.getParameter("nickName") == null ? "" : multipartRequest.getParameter("nickName");
		String fSize = multipartRequest.getParameter("fSize") == null ? "" : multipartRequest.getParameter("fSize");
		String part = multipartRequest.getParameter("part") == null ? "" : multipartRequest.getParameter("part");
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		String openSW = multipartRequest.getParameter("openSW") == null ? "공개" : multipartRequest.getParameter("openSW");
		String pwd = multipartRequest.getParameter("pwd") == null ? "" : multipartRequest.getParameter("pwd");
		String hostIP = multipartRequest.getParameter("hostIP") == null ? "" : multipartRequest.getParameter("hostIP");
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		String salt = UUID.randomUUID().toString().substring(0, 4);
		pwd = salt + security.encryptSHA256(pwd+salt);
		
		// VO에 담아 DB에 저장.
		PDSVO vo = new PDSVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(fName);
		vo.setfsName(fsName);
		vo.setfSize(fSize);
		vo.setPart(part);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSW(openSW);
		vo.setPwd(pwd);
		vo.setHostIP(hostIP);
		
		PDSDAO dao = new PDSDAO();
		int res = dao.setPDSInputOk(vo);
		if(res > 0) {
			request.setAttribute("message", "자료글이 등록되었습니다.");
			request.setAttribute("url", "PDSList.pds");
		}
		else {
			request.setAttribute("message", "자료글 등록에 실패했습니다.");
			request.setAttribute("url", "PDSInput.pds");
		}
	}

}
