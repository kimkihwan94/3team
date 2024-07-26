<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="Util.JDBCUtil" %>

<%
    HttpSession ses = request.getSession();
    String userId = (String) ses.getAttribute("userId");

    // 세션에 userId가 없으면 쿠키를 확인
    if (userId == null) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    userId = cookie.getValue();
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        conn = JDBCUtil.getConnection();
                        String sql = "SELECT * FROM member WHERE id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, userId);
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            // 세션에 사용자 정보 저장
                            session.setAttribute("userId", userId);
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        JDBCUtil.close(conn);
                    }
                    break;
                }
            }
        }
    }

    if (userId == null) {
        // 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
    }
%>
