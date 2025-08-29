package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginJoinOk")
public class LoginJoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 프로필 사진 관련.
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		// 파일 정보 입력과 동시에 업로드.
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		// 파일의 원래 이름.
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		// 실제 저장된 파일의 이름.
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		// 기존 request를 multipartRequest로 바꿔준다.
		String mid = multipartRequest.getParameter("mid")==null ? "" : multipartRequest.getParameter("mid");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		int age = (multipartRequest.getParameter("age")==null || multipartRequest.getParameter("age").equals("")) ? 0 : Integer.parseInt(multipartRequest.getParameter("age"));
		String gender = multipartRequest.getParameter("gender")==null ? "" : multipartRequest.getParameter("gender");
		String address = multipartRequest.getParameter("address")==null ? "" : multipartRequest.getParameter("address");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO voMid = dao.getLoginIDCheck(mid);
		LoginVO voNickName = dao.getLoginNickCheck(nickName);
		
		PrintWriter out = response.getWriter();
		if(voMid.getMid() != null || voNickName.getNickName() != null) {
			out.println("<script>");
			out.println("alert('중복된 정보입니다.\n회원 아이디나 닉네임을 확인하세요');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin';");
			out.println("</script>");
		}
		
		// 비밀번호 암호화.
		int saltKey = (int)(Math.random()*99999-10001+1)+10001;
		pwd = (Integer.parseInt(pwd) ^ saltKey)+"";
		pwd = saltKey+""+pwd;
		
		LoginVO vo = new LoginVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		// 가입 폼에서 사진을 올렸다면 시스템에 업로드된 이름을 입력, 사진을 올리지 않았으면 default로 null 입력된다.
		vo.setPhoto(filesystemName);
		
		// 가입 폼에서 파일을 올렸다면 사진 테이블에 입력.
		int photoRes = 2;
		if(originalFileName != null) {
			LoginPhotoVO photoVO = new LoginPhotoVO();
			photoVO.setOriginName(originalFileName);
			photoVO.setServerName(filesystemName);
			photoRes = dao.setPhotoOk(photoVO);
		}
		
		int res = dao.setLoginJoinOk(vo);
		
		// 사진을 올렸는데 테이블에 입력이 안 돼서 0이 반환되면.
		if(photoRes < 1) {
			out.println("<script>");
			out.println("alert('프로필 사진 업로드에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin';");
			out.println("</script>");
		}
		if(res != 0) {
			out.println("<script>");
			out.println("alert('회원가입 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/Login';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin';");
			out.println("</script>");
		}
	}
}
