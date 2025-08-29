package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk4Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		// 파일 업로드.
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보 추출.(테이블에 저장하기 위해 원본 이름과 저장된 이름을 각각 출력.
		String fName = request.getParameter("fName");
		System.out.println(fName);
		request.setAttribute("url", "FileUpload4.study");
	}

}
