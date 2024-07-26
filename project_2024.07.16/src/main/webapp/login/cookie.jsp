<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="Util.JDBCUtil"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자동 로그인</title>
</head>
<body>
    <%
        // 쿠키를 통해 자동 로그인 처리
        String userId = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    userId = cookie.getValue();
                    break;
                }
            }
        }

        if (userId != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // 데이터베이스 연결
                conn = JDBCUtil.getConnection();
                // 사용자 검증 쿼리
                String sql = "SELECT * FROM member WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // 자동 로그인 성공
                    session.setAttribute("userId", userId); // 세션에 사용자 정보 저장
                    response.sendRedirect("main.jsp"); // 메인 페이지로 리다이렉트
                } else {
                    // 사용자 정보가 없거나 잘못된 경우
                    out.println("<p>자동 로그인 실패. 다시 로그인 해주세요.</p>");
                    out.println("<a href='login.jsp'>로그인 페이지로 돌아가기</a>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>데이터베이스 오류가 발생했습니다.</p>");
            } finally {
                JDBCUtil.close(rs);
                JDBCUtil.close(pstmt);
                JDBCUtil.close(conn);
            }
        } else {
            // 쿠키가 없는 경우
            out.println("<p>자동 로그인 쿠키가 없습니다. 로그인 페이지로 이동합니다.</p>");
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>