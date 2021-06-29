<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cheer.CheerDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cheer" class="cheer.Cheer" scope="page" />
<jsp:setProperty name="cheer" property="cheerContent" />

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
		}else{				//로그인이 되어있을 때
			if(cheer.getCheerContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 입력이 되지 않았습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				CheerDAO cheerDAO = new CheerDAO();
				int result = cheerDAO.write(userID, cheer.getCheerContent());
				if(result == -1){	//DB오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else {				//정상 작성 완료
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
				}
			}
		}

	%>
</body>
</html>