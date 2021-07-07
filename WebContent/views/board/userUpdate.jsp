<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IU 팬페이지</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
/* 		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		} */

		if(request.getParameter("userID") == null || request.getParameter("userID").equals("") 
				|| request.getParameter("userName") == null || request.getParameter("userName").equals("")
				|| request.getParameter("userPassword") == null || request.getParameter("userPassword").equals("")
				|| request.getParameter("userEmail") == null || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')"); 
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userEmail"));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정보 수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {				//정상 작성 완료
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'logoutAction.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>