<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%
	// profileImage.jsp
	String fileName = request.getParameter("file");
	String original = fileName.substring(fileName.indexOf("_")+1);
	
	String savePath = "C:\\Temp\\TeamProject";
	
	String filePath = savePath + File.separator + fileName;
	
	String mimeType = application.getMimeType(filePath);
	
	System.out.println(mimeType);
	
	response.setContentType(mimeType);
	response.setHeader("Content-Disposition","attachment; fileName="+original);
	
	FileInputStream fis = new FileInputStream(filePath);
	byte[] bytes = new byte[4096];
	OutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(bytes,0,bytes.length)) != -1){
		os.write(bytes,0,numRead);
	}
	os.flush();
	os.close();
	fis.close();
%>