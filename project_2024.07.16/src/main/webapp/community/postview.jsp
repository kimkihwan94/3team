<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 상세보기 </title>
<%
	Connection conn = null;
	PreparedStatement state = null;
	String postNum = request.getParameter("post_num");
	
	try{
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM post_list WHERE post_num = ?;";
		state = conn.prepareStatement(sql);
		state.setString(1, postNum);
		
		ResultSet rs = state.executeQuery();
		
		if(rs.next()){
			 String viewCount = rs.getString("view_count");
             String category = rs.getString("category");
             String title = rs.getString("title");
             String nickname = rs.getString("nickname");
             String link = rs.getString("link");
             String main = rs.getString("main");
             String file = rs.getString("file");
             String postDate = rs.getString("post_date");
%>

</head>
<style>

</style>
<body>
<%@ include file="../community/communityHeader.jsp" %>
	<div>
    <!-- <h1 style="display: inline-block;">게시물 정보</h1> -->
    <div style="width: 1000px; margin: 50px auto;">
    	<div style="display: flex;">
	    	<div>
	    		<h4>제목: <%= title %></h4>
	    		<h6>닉네임: <%= nickname %></h6>
	    	</div>
    		<h5 style="margin-left: auto; margin-top: 30px;">날짜: <%= postDate %></h5>
    	</div>
    	<hr>
    	본문: <%= main %>
       <%--  <ul style="width: auto; text-align: left; display: inline-block;">
            <li>게시글 번호: <%= postNum %></li>
            <li>조회수: <%= viewCount %></li>
            <li>카테고리: <%= category %></li>
            <li>제목: <%= title %></li>
            <li>닉네임: <%= nickname %></li>
            <li>링크: <%= link %></li>
            <li>본문: <%= main %></li>
            <li>파일 링크: <%= file %></li>
            <li>날짜: <%= postDate %></li>
        </ul> --%>
        <div style="display: flex;">
        	<button onclick="nextPage('-')">이전글</button>
        	<button  onclick="nextPage('+')" style="margin-left: auto;">다음글</button>
        </div>
        
        <div style="text-align: center;"> 
        	<h1>댓글</h1>
        	<jsp:include page="comment.jsp" />
        	
        </div>
        
        
         <div style="text-align: center;"> 
        	<h1>다른 게시물들</h1>
        	<jsp:include page="../community/communityBody.jsp"/>
        </div>
        
    </div>
</div>
<%@ include file="../main/footer.jsp" %>
</body>
<script type="text/javascript">
	function nextPage(next) {
		var postNum = '<%= postNum %>';
	    
	    // 새로운 URL 생성
	    if(next == '+'){
	    	var nextPostNum = parseInt(postNum) + 1; // postNum을 숫자로 변환하여 1을 더함
	    }else {
	    	var nextPostNum = parseInt(postNum) - 1;
		}
	    
    	var newUrl = 'postview.jsp?post_num=' + nextPostNum;
	    // 페이지 이동
	    window.location.href = newUrl;
	}
</script>
    <%
}	else {
    out.println("해당 게시물을 찾을 수 없습니다.");
	}
		
	} catch (Exception e) {
        out.println("오류: " + e.getMessage());
    } finally {
      JDBCUtil.close(state,conn);
    }
%>
</html>