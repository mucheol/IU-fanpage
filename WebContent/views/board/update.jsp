<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	
	<link rel="stylesheet" href="../../css/bootCss/bootstrap.css">
	<link rel="stylesheet" href="../../css/board/write.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	
	int boardID = 0;
	if(request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if(boardID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(boardID);	//글쓴사람이랑 동일한지 확인
	if(!userID.equals(board.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
%>
	<jsp:include page="header.jsp"></jsp:include>
    
<div id="body__container">
    <div id="tableContainer">
    	<form method="post" action="updateAction.jsp?boardID=<%= boardID %>">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" style="text-align: center;">게시판 글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-txt" placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-txt" placeholder="글 내용" name="boardContent" maxlength="2048"><%= board.getBoardContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="inputBtn pull-right" value="글수정">
				<input type="button" class="inputBtn pull-right" onclick="history.back(-1);"value="뒤로가기">
			</form>
    </div>
</div>


	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/bootJs/bootstrap.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
</body>
</html>