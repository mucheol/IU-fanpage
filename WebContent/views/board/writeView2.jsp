<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="cheer.Cheer" %>
<%@ page import="cheer.CheerDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	<link rel="shortcut icon" href="../../img/logo.png">
	<link rel="stylesheet" href="../../css/bootCss/bootstrap.css">
	<link rel="stylesheet" href="../../css/board/writeView2.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int cheerID = 0;
	if(request.getParameter("cheerID") != null){
		cheerID = Integer.parseInt(request.getParameter("cheerID"));
	}
	if(cheerID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'cheer.jsp'");
		script.println("</script>");
	}
	Cheer cheer = new CheerDAO().getCheer(cheerID);
%>
	<jsp:include page="header.jsp"></jsp:include>
    
<div id="body__container">
		<div id="cheer__container">
			<div id="cheerContainer__box">
				<div id="cheerContainer__des">
					<textarea  readonly><%= cheer.getCheerContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></textarea>
				</div>
				
				<div id="submitBox">
					<input type="button" onClick="location.href='board.jsp'" id="cheer__exitBtn" class="cheerBtn" value="뒤로가기">
					<%
						if (userID != null && userID.equals(cheer.getUserID())) {
					%>
					<a href="update2.jsp?cheerID=<%=cheerID%>" id="writeUpdate2" class="cheerA cheerBtn">수정</a> 
					<a href="deleteAction2.jsp?cheerID=<%=cheerID%>"	onclick="return confirm('정말로 삭제하시겠습니까?')" id="writedelete" class="cheerA cheerBtn">삭제</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
		
			
	</div>


	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/bootJs/bootstrap.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/write2.js"></script>
</body>
</html>