<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.mail.*, javax.mail.internet.*, java.util.*" %>
<%@ page import="Util.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정 요청 처리</title>
</head>
<body>
    <%
        String email = request.getParameter("email");
        String message = "";
        boolean success = false;
        
        if (email != null && !email.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                // 데이터베이스 연결
                conn = JDBCUtil.getConnection();
                
                // 이메일 검증
                String sql = "SELECT * FROM member WHERE email = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    // 비밀번호 재설정 링크 생성
                    String token = UUID.randomUUID().toString();
                    String resetLink = "http://10.100.205.22:8080/qwe/login/reset_password.jsp?token=" + token;
                    
                    // 토큰을 데이터베이스에 저장
                    sql = "UPDATE member SET reset_token = ? WHERE email = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, token);
                    stmt.setString(2, email);
                    stmt.executeUpdate();

                    try {
                        // 이메일 전송 설정
                        final String from = "star8795@naver.com";
                        final String host = "smtp.naver.com";
                        String senderEmail = "star8795@naver.com"; // 발신자 메일 주소
                        String password = "NRBC8Q24MH8V"; // 발신자 메일 비밀번호

                        Properties props = new Properties();
                        props.put("mail.smtp.host", host);
                        props.put("mail.smtp.port", 587);
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.starttls.enable", "true");
                        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

                        Session mailSession = Session.getInstance(props, new Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(senderEmail, password);
                            }
                        });

                        MimeMessage mimeMessage = new MimeMessage(mailSession);
                        mimeMessage.setFrom(new InternetAddress(from));
                        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                        mimeMessage.setSubject("비밀번호 재설정 링크");
                        mimeMessage.setText("다음 링크를 클릭하여 비밀번호를 재설정하십시오: " + resetLink);

                        Transport.send(mimeMessage);
                        success = true;
                        message = "비밀번호 재설정 링크를 이메일로 보냈습니다.";
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        message = "이메일 전송에 실패했습니다.";
                    }
                } else {
                    message = "이메일 주소를 찾을 수 없습니다.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "오류가 발생했습니다.";
            } finally {
                JDBCUtil.close(rs);
                JDBCUtil.close(stmt);
                JDBCUtil.close(conn);
            }
        } else {
            message = "이메일을 입력해 주세요.";
        }
    %>
    <p><%= message %></p>
    <a href="password_reset_request.jsp">돌아가기</a>
</body>
</html>
