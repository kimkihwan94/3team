<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <style>
        .container {
            margin: 50px auto;
			padding: 2rem;
			border: 1px solid #000;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			max-width: 500px;
			width: 100%;
			background-color: #fff;
			line-height: 50px;
			text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center; /* 제목을 가운데 정렬 */
        }
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* 패딩을 포함한 너비 계산 */
        }
        input[type="submit"] {
            background-color: #000; /* 검은색 배경 */
            color: white; /* 흰색 텍스트 */
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #333; /* 마우스 오버 시 어두운 회색 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>비밀번호 재설정</h2>
        <form action="reset_password_processing.jsp" method="post">
            <input type="hidden" name="token" value="<%= request.getParameter("token") %>">
            <input type="password" name="password" placeholder="새 비밀번호 입력" required>
            <input type="submit" value="비밀번호 재설정">
        </form>
    </div>
    <%@ include file="../main/footer.jsp"%>
</body>
</html>
