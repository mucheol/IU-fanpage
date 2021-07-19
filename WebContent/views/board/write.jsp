<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	<link rel="shortcut icon" href="../../img/logo.png">
	
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

%>
	<jsp:include page="header.jsp"></jsp:include>
    
<div id="body__container">
    <div id="tableContainer">
    	<form method="post" action="writeAction.jsp">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" style="text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-txt" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-txt" placeholder="글 내용" name="boardContent" maxlength="2048"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="inputBtn pull-right" value="글쓰기">
				<input type="button" class="inputBtn pull-right" onclick="history.back(-1);"value="뒤로가기">
			</form>
    </div>
</div>


	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/bootJs/bootstrap.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/write.js"></script>
</body>
</html>