<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";

    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // MySQL JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            connection = DriverManager.getConnection(URL, USER, PASSWORD);

            // 데이터 삽입 SQL 문
            String sql = "INSERT INTO member (id, pass, name, nickName) VALUES (?, ?, ?, ?)";

            // PreparedStatement 생성 및 값 설정
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "test_id");
            preparedStatement.setString(2, "test_pass");
            preparedStatement.setString(3, "test_name");
            preparedStatement.setString(4, "test_nickName");

            // SQL 문 실행
            int rows = preparedStatement.executeUpdate();
            System.out.println(rows + " row(s) inserted.");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
</body>
</html>