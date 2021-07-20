<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어있지 않습니다.')"); 
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		if(request.getParameter("userID") != null){
			userID = request.getParameter("userID");
		}

		if(request.getParameter("userName") == null || request.getParameter("userName").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 입력해주세요.')"); 
			script.println("history.back()");
			script.println("</script>");
		}else if(request.getParameter("userPassword") == null || request.getParameter("userPassword").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력해주세요.')"); 
			script.println("history.back()");
			script.println("</script>");
		}else if(request.getParameter("userEmail") == null || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력해주세요.')"); 
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