package study2.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk3Command implements CommonInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024*1024*10;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일들의 정보 추출.
		Enumeration fNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		while(fNames.hasMoreElements()) {
			file = fNames.nextElement().toString();
			originalFileName += multipartRequest.getOriginalFileName(file) + "/";
			filesystemName += multipartRequest.getFilesystemName(file) + "/";
		}
		originalFileName = originalFileName.substring(0, originalFileName.lastIndexOf("/"));
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
		System.out.println(originalFileName);
		System.out.println(filesystemName);
		
		if(originalFileName != null && !originalFileName.equals("")) request.setAttribute("message", "파일전송 완료.");
		else request.setAttribute("message", "파일전송 실패.");
		
		request.setAttribute("url", "FileUpload3.study");
	}

}
