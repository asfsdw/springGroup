package study2.pdsTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class JavaFileDownloadCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		File file = new File(realPath+fName);
		
		if(file.exists()) {
			// HTTP 통신에 따른 HTTP 프로토콜(통신규약) 형식에 맞도록 헤더에 전송할 파일의 정보를 담아준다.
			String mimeType = request.getServletContext().getMimeType(file.toString());
			if(mimeType == null) response.setContentType("application/octet-stream");	// 2진 바이너리 형식으로 변환.
			
			// 유지보수 때 보게될지도 모르는 것.
			String downLoadName = "";
			if(request.getHeader("user-agent").indexOf("MSIE") == -1) downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
			else downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
			
			// 변경한 사항들을 헤더에 첨부처리.
			response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
			
			// 다운로드 받을 파일을 Byte단위로 처리해서 전송한다. (실제론 bit단위지만 java에서는 Byte로 바꿔서 전송한다.)
			FileInputStream fis = new FileInputStream(file);	// 서버'가' 인풋시켜준다.
			// FileOutputStream fos = new FileOutputStream(file);	// 서버'가' 서버에 아웃풋시켜준다.
			ServletOutputStream sos = response.getOutputStream();	// 클라이언트에 아웃풋시켜준다.
			
			byte[] buffer = new byte[2048];
			int size = 0;
			while((size = fis.read(buffer)) != -1) {
				sos.write(buffer, 0, size);
			}
			sos.flush();
			
			sos.close();
			fis.close();
		}
	}

}
