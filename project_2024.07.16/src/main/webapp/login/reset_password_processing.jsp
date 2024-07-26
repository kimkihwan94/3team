<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Util.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정 처리</title>
</head>
<body>
    <%
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");
        boolean success = false;
        String message = "";

        if (token != null && newPassword != null && !newPassword.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                // 데이터베이스 연결
                conn = JDBCUtil.getConnection();

                // 비밀번호 업데이트 쿼리 준비
                String sql = "UPDATE member SET password = ?, reset_token = NULL WHERE reset_token = ?";
                stmt = conn.prepareStatement(sql);

                // 비밀번호 해싱 처리 (예: SHA-256, bcrypt 등) 필요
                // 예: String hashedPassword = hashPassword(newPassword);
                // 이 예제에서는 간단하게 직접 입력된 비밀번호를 사용
                String hashedPassword = newPassword; // 해싱 처리 필요

                stmt.setString(1, hashedPassword);
                stmt.setString(2, token);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    success = true;
                    message = "비밀번호가 성공적으로 재설정되었습니다.";
                } else {
                    message = "유효하지 않은 링크입니다.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "오류가 발생했습니다. 관리자에게 문의하십시오.";
            } finally {
                // 자원 해제
                JDBCUtil.close(stmt);
                JDBCUtil.close(conn);
            }
        } else {
            message = "비밀번호와 토큰을 입력해 주세요.";
        }
    %>
    <p><%= message %></p>
    <a href="login.jsp">로그인 페이지로 돌아가기</a>
</body>
</html>
