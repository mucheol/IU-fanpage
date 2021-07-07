<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	<link rel="stylesheet" href="../../css/board/info.css">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}

	

	User user = new UserDAO().getUser(userID);
	if(!userID.equals(user.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="body__container">
    <div id="container__frame">
        <div id="container__inner">
            <form method="post" name="userUpdate" action="userUpdate.jsp?userID=<%= userID %>" onsubmit="return form_check()">
				<table class="info_table">
                    <tr class="update_txt">
						<td>이름</td>
						<td><input id="userName" class="txtBox" name="userName" type="text" value="<%= user.getUserName() %>" /></td>
					</tr>
                    <tr id="gerderTr">
						<td>성별</td>
						<td>
                            <input type="radio" name="gender" checked><label for="male">남성</label>
                            <input type="radio" name="gender"><label for="female">여성</label>
                        </td>
					</tr>
					<tr class="update_txt">
						<td>아이디</td>
						<td><input id="userID" class="txtBox" name="userID" type="text" value="<%= user.getUserID() %>" readonly/></td>
					</tr>
					<tr class="update_txt">
						<td>비밀번호</td>
						<td><input type="password" id="userPassword" class="txtBox passCheck" name="userPassword" placeholder="6~20자 영문,숫자,특수문자 조합"></td>
					</tr>
					<tr class="update_txt">
						<td>비밀번호 확인</td>
						<td><input type="password" id="reUserPassword" class="txtBox passCheck" name="reUserPassword" placeholder="6~20자 영문,숫자,특수문자 조합"></td>
					</tr>
					<tr class="alert-success alert">
						<td></td>
						<td><input type="text" class="alert-success" id="success" value="비밀번호가 일치합니다" style="color:white" readonly></td>
					</tr>				
					<tr class="alert-danger alert">
						<td></td>
						<td><input type="text" class="alert-danger" id="danger" value="비밀번호가 일치하지 않습니다." style="color:white" readonly></td>
					</tr>

					<tr class="update_txt">
						<td>이메일</td>
						<td><input type="email" id="userEmail" class="txtBox" name="userEmail"  value="<%= user.getUserEmail() %>"></td>
					</tr>
				</table>
				<div class="info_btn">
					<input type="reset" id="reset" class="button" value="리셋">
					<input type="submit" id="edit" class="button" value="회원정보수정"  disabled>
					<input type="button" id="back" class="button" value="돌아가기">
				</div>
				</form>
        </div>
    </div>
</div>
	
	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/info.js"></script>
</body>
</html>