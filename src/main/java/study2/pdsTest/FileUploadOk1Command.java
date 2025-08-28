package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk1Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		// 파일 업로드.
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보 추출.
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		System.out.println(originalFileName);
		System.out.println(filesystemName);
		
		if(originalFileName != null && !originalFileName.equals("")) request.setAttribute("message", "파일전송 완료.");
		else request.setAttribute("message", "파일전송 실패.");
		
		request.setAttribute("url", "FileUpload1.study");
	}

}
