<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Util.JDBCUtil" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료</title>
    <script>
        function showAlert(message, redirectUrl) {
            alert(message);
            if (redirectUrl) {
                location.href = redirectUrl;
            }
        }
    </script>
</head>
<body>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;
        String errorMessage = "회원가입에 실패하였습니다. 다시 시도해 주세요.";

        try {
            // 데이터베이스 연결
            conn = JDBCUtil.getConnection();

            // 사용자 입력값 받기
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String nickname = request.getParameter("nickname");
            String birthdate = request.getParameter("birthdate");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            // SQL 쿼리 준비
            String sql = "INSERT INTO member (id, name, nickname, password, birthdate, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, nickname);
            pstmt.setString(4, password); // 비밀번호는 해시화하여 저장하는 것이 좋습니다.
            pstmt.setDate(5, java.sql.Date.valueOf(birthdate));
            pstmt.setString(6, phone);
            pstmt.setString(7, email);

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            JDBCUtil.close(pstmt);
            JDBCUtil.close(conn);
        }

        if (success) {
    %>
            <script>
                // 회원가입 성공 시 알림창을 띄우고 로그인 페이지로 리디렉션
                showAlert("회원가입이 완료되었습니다.", "../login/login.jsp");
            </script>
    <%
        } else {
    %>
            <script>
                // 회원가입 실패 시 알림창을 띄우고 확인 클릭 시 회원가입 페이지로 리디렉션
                showAlert("<%= errorMessage %>", "../login/register.jsp");
            </script>
    <%
        }
    %>
</body>
</html>
