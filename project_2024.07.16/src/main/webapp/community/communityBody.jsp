<%@page import="java.sql.*, Util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 메인 플랫폼</title>
<style type="text/css">


.postlist {
	border-top: 3px solid black;
	border-collapse: collapse;
}

.post {
	border-bottom: 2px dashed gray;
	padding: 10px 0px;
	cursor: pointer;
}

.a {
	border-bottom: 3px solid black;
	padding: 10px;
	cursor: pointer;
}

.a>a {
	color: gray;
}

.body2 {
	position: relative;
	margin: 0 auto;
	bottom: 44px;
	width: 1000px;
}

.showpost {
	display: flex;
	height: 25px;
}

.title, .date, .nickName, .viewCount {
	line-height: 20px;
}

.title {
	width: 400px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	margin-right: 200px;
}

.postdate {
	width: 100px;
	margin-right: 50px;
}

.nickName {
	width: 100px;
	margin-right: 100px;
}

.viewCount {
	width: 50px;
}
</style>
</head>
<body>
	<div class="body2"> <%
 int pageCount = 25;
 int currentPage = 1;
 String paramPage = request.getParameter("page");
 if (paramPage != null) {
 	currentPage = Integer.parseInt(paramPage);
 }

 int startRow = (currentPage - 1) * pageCount;

 Connection conn = JDBCUtil.getConnection();

 String sql = "SELECT post_num, view_count, post_date, title, nickname FROM post_list "
 		+ "ORDER BY post_num DESC limit ? , ?";
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setInt(1, startRow);
 pstmt.setInt(2, pageCount);
 ResultSet rs = pstmt.executeQuery();
 %>


	<table class="postlist">
		<%
		while (rs.next()) {
			int post_num = rs.getInt("post_num");
			String view_count = rs.getString("view_count");
			String post_date = rs.getString("post_date");
			String title = rs.getString("title");
			String nickname = rs.getString("nickname");
		%>
		<tr>
			<td class="post" onclick="viewPost('<%=post_num%>')">
				<div class="showpost">

					<div class="title"><%=title%></div>
					<br />
					<div class="nickName"><%=nickname%></div>
					<br />
					<div class="postdate"><%=post_date%></div>
					<br />
					<div class="viewCount"><%=view_count%></div>
					<br />
				</div>
			</td>
		</tr>
		<%
		}
		JDBCUtil.close(rs, pstmt, conn);
		%>

		<%
		sql = "SELECT count(*) FROM post_list";
		conn = JDBCUtil.getConnection();
		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		int totalCount = 0;
		if (rs.next()) {
			totalCount = rs.getInt(1);
		}

		JDBCUtil.close(rs, stmt, conn);

		int maxPage = (totalCount - 1) / pageCount + 1;

		maxPage = (int) (Math.ceil((double) totalCount / pageCount));
		int startPage = 0;
		int endPage = 0;
		int displayPageNum = 5;
		startPage = (currentPage - 1) / displayPageNum * displayPageNum + 1;
		endPage = startPage + (displayPageNum - 1);

		// endPage 가 maxPage 보다 크면 이동할 수 없는 페이지 번호가 출력
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		%>
		<tr style="width: 100%;">
			<th class="a">
				<!-- 사용자가 요청한 출력된 현재 페이지가 1페이지가 아니면 출력 --> <%
 if (currentPage != 1) {
 %> <a href="community.jsp?page=1">처음 페이지</a> <%
 }
 %> <%
 if (startPage != 1) {
 %> <a href="community.jsp?page=<%=startPage - 1%>">&#60;이전</a> <%
 }
 %> <!-- 이동가능한 페이지 번호 출력 --> <%
 for (int i = startPage; i <= endPage; i++) {
 %> <a href="community.jsp?page=<%=i%>">[<%=i%>]
			</a> <%
 }
 %> <%
 if (endPage < maxPage) {
 %> <a href="community.jsp?page=<%=endPage + 1%>">다음&#62;</a> <%
 }
 %> <%
 if (currentPage < maxPage) {
 %> <!-- 마지막 페이지 이동 --> <a href="community.jsp?page=<%=maxPage%>">마지막
					페이지</a> <%
 }
 %>
			</th>
		</tr>

	</table>
	</div>
</body>

<script type="text/javascript">
	function viewPost(post_num) {
		window.location.href = '../community/postview.jsp?post_num=' + post_num;
	}
</script>
</html>