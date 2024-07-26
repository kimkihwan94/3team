<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Update"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Collection"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.*" %>

<title> 게시물 작성 검사 </title>  

<%
    Connection conn = null;
    PreparedStatement state = null;
    int rs = 0;
    
    String fileName = null;
    String path = "C:\\Temp\\TeamProject";
    File file = new File(path);
	if(!file.exists()){
		file.mkdirs();
	}
    Collection<Part> parts = request.getParts();
    if(parts != null){
    	for(Part p : parts){
    		if(p.getContentType() != null && p.getName().equals("file")){
    			fileName = p.getSubmittedFileName();
    			UUID uuid = UUID.randomUUID();
    			fileName = uuid.toString()+"-"+fileName;
    			String uploadPath = path + File.separator + fileName;
    			p.write(uploadPath);
    			p.delete();
    		}
    	}
    }
    
    // String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String title = request.getParameter("title");
    String link = request.getParameter("link");
    String main = request.getParameter("main");
    String category = request.getParameter("category");
    
    try {
		conn = JDBCUtil.getConnection();
        
		String sql = "INSERT INTO post_list (category, title, nickname, link, main, post_date,view_count,file) VALUES (?, ?, ?, ?,?, ?, ?,?)";
		state = conn.prepareStatement(sql);
		state.setString(1, category);
		state.setString(2, title);
		state.setString(3, nickname);
		state.setString(4, link);
		state.setString(5, main);
		state.setString(6, "오늘");
		state.setString(7, "0");
		state.setString(8, fileName);
		
		rs = state.executeUpdate();
		
        if(rs>0){
            out.println("게시물 작성 성공");
        } else {
            out.println("게시물 작성 실패");
        }
    } catch (SQLException e) {
        out.println("오류: " + e.getMessage());
    } finally {
      JDBCUtil.close(state,conn);
    }
%>
<a href="../index.jsp">처음으로</a>