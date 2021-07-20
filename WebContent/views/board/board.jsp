<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="cheer.CheerDAO" %>
<%@ page import="cheer.Cheer" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU Board</title>
	<link rel="shortcut icon" href="../../img/logo.png">
	<link rel="stylesheet" href="../../css/openSource/jquery.fullpage.css">
	<link rel="stylesheet" href="../../css/openSource/jquery.fullpage.min.css">
	<link rel="stylesheet" href="../../css/board/board.css">
	
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){	//파라메터 값 넣기
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		int pageNumber2 = 1;
		if(request.getParameter("pageNumber2") != null){	//파라메터 값 넣기
			pageNumber2 = Integer.parseInt(request.getParameter("pageNumber2"));
		}
	%>
	
	<jsp:include page="header.jsp"></jsp:include>


	<%
		if (userID == null) { //로그인이 안되어있는 경우
	%>
	<!-- 로그인 박스 -->
	<div id="loginBox">
		<form method="post" action="loginAction.jsp">
			<div id="loginForm">
				<input type="text" class="login__id" placeholder="아이디" name="userID" maxlength="16">
				<input type="password" class="login__pwd" placeholder="패스워드" name="userPassword" maxlength="20">
			</div>
			
			<div id="loginBtnBox">
				<input type="submit" id="btn__loginSubmit" value="로그인">	
				<input type="button" id="join" value="회원가입">
			</div>
		</form>
	</div>
	<%
		} else { //로그인이 되어있는경우
	%>
	<!-- 마이페이지 박스 -->
	<div id="myPageBox">
		<div id="welcomeDiv">
			<%=session.getAttribute("userID") %>님 환영합니다.
		</div>
		<div id="myPage__btnBox">
			<a href="info.jsp">정보수정</a>
			<a href="logoutAction.jsp">로그아웃</a>
		</div>
	</div>
	<%
		}
	%>






	<div id="fullpage">
    
	<!-- First Page -->
        <div id="section__comments"  class="section first">
            <div id="contentsBox__comments">
                <table>
                	<thead>
                    	<tr>
                        	<th>No.</th>
                        	<th>제목</th>
                        	<th>작성자</th>
                        	<th>작성시간</th>
                    	</tr>
                    </thead>
                    <tbody>
                    <%
                    	BoardDAO boardDAO = new BoardDAO();
                    	ArrayList<Board> list = boardDAO.getList(pageNumber);
                    	for(int i=0; i<list.size(); i++){
                    %>
                    	<tr>
                    		<td><%= list.get(i).getBoardID() %></td>
                    		<td><a href="writeView.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle() %></a></td>
                    		<td><%= list.get(i).getUserID() %></td>
                    		<td><%= list.get(i).getBoardDate().substring(0,11) + " " + list.get(i).getBoardDate().substring(11,13) + ":" + list.get(i).getBoardDate().substring(14,16) %></td>
                    	</tr>
                    <%
                    	}
                    %>
                    </tbody>
                </table>
                <div id="boardBtnBox">
                	<%
                		if(pageNumber != 1){
               		%>
                		<a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
                	<%		
                		}else if(boardDAO.nextPage(pageNumber)){
                	%>
                    	<a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-right">다음</a>
                	<%
                		}
                	%>
                <a href="write.jsp" onClick="loginCheck()" id="newComment__btn" class="btn">글쓰기</a>
                </div>
            </div>
        </div>
        
            
    
<!-- Second Page -->
        <div id="section__cheer" class="section second">

            <div id="contentsBox__cheer">
            	 <%
                 	CheerDAO cheerDAO = new CheerDAO();
                 	ArrayList<Cheer> list2 = cheerDAO.getList(pageNumber2);
                 	for(int i=0; i<list2.size(); i++){
                 %>
                <div class="note">
                    <div class="note__des">
                        	<p><a href="writeView2.jsp?cheerID=<%= list2.get(i).getCheerID() %>"><textarea readonly><%= list2.get(i).getCheerContent() %></textarea></a></p>
                    </div>
                </div>
                <%
                	}
                %>
            </div>
            
            <div id="newCheer">
            	<%
                	if(pageNumber2 != 1){
               	%>
                	<a href="board.jsp?pageNumber2=<%=pageNumber2 - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
                <%		
                	}else if(cheerDAO.nextPage(pageNumber2)){
                %>
                    <a href="board.jsp?pageNumber2=<%=pageNumber2 + 1 %>" class="btn btn-success btn-arraw-right">다음</a>
                <%
                	}
                %>
            	<a href="write2.jsp" onClick="loginCheck()" id="newCheer__btn">글쓰기</a>
            </div>
            

        </div>
	</div>
    
    
    
    
<!-- Join Page Modal -->
	<div id="joinModal">
    	<div id="join__container">
    		<form method="post" action="joinAction.jsp">
        		<div id="floor1" class="floor">
            		<p>이름</p><span>:</span><input type="text" name="userName" maxlength="20">
        		</div>
        		<div id="floor2" class="floor">
            		<p>성별</p><span>:</span>
            		<label><input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자</label>
                	<label><input type="radio" name="userGender"  autocomplete="off" value="여자"  >여자</label>
        		</div>
        		<div id="floor3" class="floor">
            		<p>아이디</p><span>:</span><input type="text" name="userID" maxlength="16">
        		</div>
        		<div id="floor4" class="floor">
            		<p>비밀번호</p><span>:</span><input type="password" name="userPassword" maxlength="20">
        		</div>
        		<div id="floor5" class="floor">
            		<p>이메일</p><span>:</span><input type="email" name="userEmail" maxlength="50">
        		</div>
        		<div id="floor6" class="floor">
            		<input type="submit" value="회원가입">
            		<input type="button" onClick="window.location.reload()" id="joinModal__exitBtn" value="뒤로가기">
        		</div>
        	</form>
    	</div>
    <div id="join__container__background1" class="join__container__background"></div>
    <div id="join__container__background2" class="join__container__background"></div>
    <div id="join__container__background3" class="join__container__background"></div>
    <div id="join__container__background4" class="join__container__background"></div>
</div>

	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/openSource/jquery.fullpage.js"></script>
	<script src="../../js/openSource/jquery.fullpage.min.js"></script>
	<script src="../../js/openSource/jquery.fullpage.extensions.min.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/board.js"></script>
	<script>
    function loginCheck(){ 
          if(userID == null){ 
             alert("로그인이 필요한 기능입니다."); 
          }
    }   
</script>
</body>
</html>