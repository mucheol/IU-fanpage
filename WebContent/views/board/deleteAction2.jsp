<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cheer.CheerDAO" %>
<%@ page import="cheer.Cheer" %>
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
		if(userID == null){	//로그인이 되어있지 않을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 기능입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		int cheerID = 0;
		if(request.getParameter("cheerID") != null){
			cheerID = Integer.parseInt(request.getParameter("cheerID"));
		}
		if(cheerID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Cheer cheer = new CheerDAO().getCheer(cheerID);	//글쓴사람이랑 동일한지 확인
		if(!userID.equals(cheer.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}else{
				CheerDAO cheerDAO = new CheerDAO();
				int result = cheerDAO.delete(cheerID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else {				//정상 삭제 완료
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
				}
		}
	%>
</body>
</html>