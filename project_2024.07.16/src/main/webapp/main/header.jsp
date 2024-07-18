<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title> main header </title>

<style>
	
	@media screen and (max-width:960px){
		#header > .right{
			display:none;
		}
	}
	
	#header{
		margin-left: 100px;
		white-space: nowrap;
	}
	
    div>.header {
        display: inline-block; /* 요소들을 가로로 배치 */
        margin-right: 20px; /* 오른쪽 여백 설정 */
        vertical-align: middle; /* 세로 정렬을 위한 중앙 정렬 */
    }
    div>.header>h3>a{
    	text-decoration-line: none;
    	color: gray;
    }
    div>.right>.header>h3>a{
    	text-decoration-line: none;
    	color: #333;
    }
    
    div>.right {
        display: inline-block; /* 요소들을 가로로 배치 */
        margin-right: 20px; /* 오른쪽 여백 설정 */
        vertical-align: middle; /* 세로 정렬을 위한 중앙 정렬 */
        float: right;
    }
    
    .ad{
      position: fixed; 
	  top: 180px; 
	  margin-left: 100px;
    }
    
</style>
</head>
<body>
    <div id="header">
        <div class="header">
            <a href="../main/main.jsp">
                <img alt="이미지 설명" src="../img/zㅣ존기환.png">
            </a>
        </div>
        <div class="header">
            <h3><a href="../community/community.jsp">커뮤니티(진우의 게시물 확인 페이지)</a></h3>
        </div>
        
        <div class="header">
            <h3><a href="../community/write.jsp">인기 게시물(게시물 작성)</a></h3>
        </div>
        
        <div class="header">
            <h3><a href="../community/community.jsp">카테고리</a></h3>
        </div>
       
       <div class="right">
	        <div class="header">
	        	<h3><a href="../login/login.jsp">로그인</a></h3>
	        </div>
	        <div class="header">
	        	<h3><a href="../login/register.jsp">회원가입</a></h3>
	        </div>
       </div>
    </div>
<!-- 
    <div class="ad">
		<img alt="" src="../img/영웅동찬.png">
	</div>
 -->
