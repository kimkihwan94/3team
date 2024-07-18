<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.*" %>
<!DOCTYPE html>

<%
    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;
    
    try {
        conn = JDBCUtil.getConnection();
        String id = request.getParameter("uid");
        String pw = request.getParameter("upw");
        
        String sql = "select * from member where id = ? and pass = ?";
        state = conn.prepareStatement(sql);
        state.setString(1, id);
        state.setString(2, pw);
        
        rs = state.executeQuery();
        if(rs.next()){
            out.println("로그인 성공");        
        } else {
            out.println("로그인 실패");
        }
    } catch (SQLException e) {
        out.println("오류: " + e.getMessage());
    } finally {
      JDBCUtil.close(rs,state,conn);
    }
%>
