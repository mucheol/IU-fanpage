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
	<link rel="stylesheet" href="../../css/board/write2.css">
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
        <div id="cheer__container">
        	<form method="post" action="writeAction2.jsp">
                <div id="cheerContainer__box">
                    <div id="cheerContainer__des">
                        <textarea class="form-txt" name="cheerContent" maxlength="128"></textarea>
                    </div>
                    <div id="submitBox">
                    	<input type="button" onClick="location.href='board.jsp'" id="cheer__exitBtn"  class="cheerBtn" value="뒤로가기">
                        <button id="cheer__submit" class="cheerBtn">글 올리기</button>
                    </div>
                </div>
            </form>
        </div>
</div>


	<script src="../../js/openSource/jquery-3.6.0.min.js"></script>
	<script src="../../js/bootJs/bootstrap.js"></script>
	<script src="../../js/openSource/mouseEffect.js"></script>
	<script src="../../js/common.js"></script>
	<script src="../../js/write2.js"></script>
</body>
</html>