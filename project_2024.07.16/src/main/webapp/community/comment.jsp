<%@page import="com.mysql.cj.xdevapi.Table"%>
<%@ page import="java.sql.*,Util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>

<style>
.body2{ 
 	position: relative; 
 	margin: 0 auto; 
 	bottom: 44px; 
 	width: 1000px; 
 }

.commentList {
border-top:1px solid gray;
border-collapse: collapse;
}

.showpost {
	display: flex;
	height: 25px;	
}

.comment{
	border-bottom: 2px dashed gray;
	padding: 10px;
	cursor: pointer;
}

</style>
</head> 
<body>
	<h1>댓글 css 수정필요</h1>
	<%
	String postNum = request.getParameter("post_num");
	Connection conn = null;
	PreparedStatement state = null;

	try {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM comment WHERE post_num = ?;";
		state = conn.prepareStatement(sql);
		state.setString(1, postNum);

		ResultSet rs = state.executeQuery();
	%>
	<table class="commentList">
		<%
		while (rs.next()) {
			String nickname = rs.getString(2);
			String main = rs.getString(3);
			String post_date = rs.getString(4);
		%>
		<tr>
			<td>
			<div class="comment">
				<div class="nickname"><%=nickname%></div> <br />
				<div class="date"><%=post_date%></div> <br />
				<div class="main"><%=main%></div> <br /> <br />
				</div>
			</td>
		</tr>


	<%
	}
	%>
		</table>
</body>
<%
} catch (Exception e) {
out.println("오류: " + e.getMessage());
} finally {
JDBCUtil.close(state, conn);
}
%>
</html>