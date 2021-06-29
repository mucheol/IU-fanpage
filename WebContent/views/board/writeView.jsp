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
	Board board = new BoardDAO().getBoard(boardID);
%>
	<jsp:include page="header.jsp"></jsp:include>
    
<div id="body__container">
		<div id="tableContainer">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="3" style="text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= board.getBoardTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= board.getBoardDate().substring(0,11) + " " + board.getBoardDate().substring(11,13) + "시" + board.getBoardDate().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2"><%= board.getBoardContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" id="boardList">목록</a>
			<%
				if(userID != null && userID.equals(board.getUserID())){
			%>
				<a href="update.jsp?boardID=<%= boardID %>" id="writeUpdate" class="writeBtn">수정</a>
				<a href="deleteAction.jsp?boardID=<%= boardID %>" onclick="return confirm('정말로 삭제하시겠습니까?')" id="writedelete" class="writeBtn">삭제</a>
			<%
				}
			%>
		</div>
	</div>


	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/bootJs/bootstrap.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
</body>
</html>