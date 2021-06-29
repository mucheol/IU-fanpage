<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	<link rel="stylesheet" href="../../css/openSource/jquery.fullPage.css">
	<link rel="stylesheet" href="../../css/board/board.css">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="body__container">
    <div id="container__frame">
        <div id="container__inner">
            <form method="post" action="userUpdate.jsp" onsubmit="return sendIt();">
				<table class="info_table">
                    <tr>
						<td>이름</td>
						<td><input id="userName" class="txtBox" name="userName" type="text" /></td>
					</tr>
                    <tr id="gerderTr">
						<td>성별</td>
						<td>
                            <input type="radio" name="gender"><label for="male">남성</label>
                            <input type="radio" name="gender"><label for="female">여성</label>
                        </td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input id="userID" class="txtBox" name="userID" type="text" readonly/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userPassword" class="txtBox" name="userPassword" placeholder="4~12자 영문,숫자,특수문자 조합"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="reUserPassword" class="txtBox" name="reUserPassword" placeholder="4~12자 영문,숫자,특수문자 조합"></td>
					</tr>
					<tr class="alert-success alert">
						<td colspan="2"><input type="text" class="alert-success" id="success" value="비밀번호가 일치합니다" style="color:white" readonly></td>
					</tr>				
					<tr class="alert-danger alert">
						<td colspan="2"><input type="text" class="alert-danger" id="danger" value="비밀번호가 일치하지 않습니다." style="color:white" readonly></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="email" id="userEmail" class="txtBox" name="userEmail"></td>
					</tr>
				</table>
				<div class="info_btn">
					<input type="reset" id="reset" class="button" value="리셋">
					<input type="submit" id="edit" class="button" value="회원정보수정" disabled>
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