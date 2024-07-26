<%@page import="Util.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
    .login {
        display: inline-block;
        text-align: left;
        border: 1px solid #ccc;
        padding: 20px;
    }
    
    .login1>input{
        width: 400px;
        height: 40px;
        box-sizing: border-box;
        border : 1px solid gray;
        outline: none;
        padding:0px 15px;
        font-size: 16px;
        margin-top: 3px;
    }
    
    .login2 a{
        font-size: 14px;
    }
    
    .social-login img {
        display: block;
        margin: 10px auto;
        width: 250px;
        height: 50px;
    }
    
    .flex-links {
        display: flex;
    }
    .join{
        width:100%;
        text-align:center;
    }
</style>
</head>
<body>
    <div style="text-align: center;">
        <div class="login">
            <div style="text-align: center;">
                <form method="post" action="login.jsp">
                    <h2 style="text-align: center;">MONSTERZYM</h2>
                    <table width=400 style="text-align: center;">
                        <tr>
                            <td><input type="text" name="id" placeholder="아이디" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="password" placeholder="비밀번호" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" style="text-align: center; background-color: black; width: 100%; color: white;">로그인</button>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <div style="text-align: left;">
                                    <input type="checkbox" id="rememberMe" name="rememberMe">
                                    <label for="rememberMe">자동 로그인</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="flex-links">
                                    <div style="margin-left:200px;">
                                        <a href="password_reset_request.jsp">비밀번호 찾기</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <div class="social-login">
                        <a href="https://accounts.kakao.com/">
                            <img src="../img/4.jpg" alt="카카오 로그인">
                        </a>
                        <a href="https://nid.naver.com/">
                            <img src="../img/8.png" alt="네이버 로그인">
                        </a>
                        <a href="https://appleid.apple.com/">
                            <img src="../img/6.jpg" alt="애플 로그인">
                        </a>
                    </div>
                    <br />
                    <div class="join">
                        <a href="register.jsp">회원가입</a>
                    </div>
                </form>
                
                <%
                    String userId = request.getParameter("id");
                    String userPw = request.getParameter("password");
                    String rememberMe = request.getParameter("rememberMe");

                    if (userId != null && userPw != null) {
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            conn = JDBCUtil.getConnection();
                            String sql = "SELECT * FROM member WHERE id = ? AND password = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, userId);
                            pstmt.setString(2, userPw);
                            rs = pstmt.executeQuery();

                            if (rs.next()) {
                                // 로그인 성공
                                out.println("<script>");
                                out.println("if (confirm('로그인 성공.')) {");
                                out.println("    window.location.href = '../main/main.jsp';"); // 메인 페이지 URL
                                out.println("}");
                                out.println("</script>");

                                // rememberMe가 체크되었는지 확인
                                if ("on".equals(rememberMe)) {
                                    // 쿠키 생성
                                    Cookie loginCookie = new Cookie("userId", userId);
                                    loginCookie.setMaxAge(60 * 60 * 24 * 30); // 30일간 유지
                                    response.addCookie(loginCookie);
                                }
                            } else {
                                // 로그인 실패
                                out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            JDBCUtil.close(conn);
                        }
                    }
                %>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>