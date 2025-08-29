package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk2Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName1 = multipartRequest.getOriginalFileName("fName1");
		String originalFileName2 = multipartRequest.getOriginalFileName("fName2");
		String originalFileName3 = multipartRequest.getOriginalFileName("fName3");
		String filesystemName1 = multipartRequest.getFilesystemName("fName1");
		String filesystemName2 = multipartRequest.getFilesystemName("fName2");
		String filesystemName3 = multipartRequest.getFilesystemName("fName3");
		System.out.println(originalFileName1);
		System.out.println(originalFileName2);
		System.out.println(originalFileName3);
		System.out.println(filesystemName1);
		System.out.println(filesystemName2);
		System.out.println(filesystemName3);
		
		if(originalFileName1 != null && !originalFileName1.equals("")) request.setAttribute("message", "파일전송 완료.");
		if(originalFileName2 != null && !originalFileName2.equals("")) request.setAttribute("message", "파일전송 완료.");
		if(originalFileName3 != null && !originalFileName3.equals("")) request.setAttribute("message", "파일전송 완료.");
		else request.setAttribute("message", "파일전송 실패.");
		
		request.setAttribute("url", "FileUpload2.study");
	}

}
