(function (window, document) {
//패스워드 일치 확인
$(".alert-success").hide();
$(".alert-danger").hide();
$(".passCheck").keyup(function(){
    var pwd = $("#userPassword").val();
    var pwd2 = $("#reUserPassword").val();
    if(pwd != "" || pwd2 != ""){
        if(pwd == pwd2){
            $(".alert-success").show();
            $(".alert-danger").hide();
            $("#edit").removeAttr("disabled");
        }else{
            $(".alert-success").hide();
            $(".alert-danger").show();
            $("#edit").attr("disabled","disabled");
        }
    }
});
    
    $(".button").hover(function(){
        $(this).css("background-color","rgba(153,95,243,0.3)");
    },function(){
        $(this).css("background","rgba(181,146,236,0.3)");
    });
    $("#back").click(function(){
        location.href="board.jsp";
    });
    
    
    //HEADER
    $(".headerA").hover(function() {
    	$(this).css('text-shadow','-0.1vw 0 white, 0 0.1vw white, 0.1vw 0 white, 0 -0.1vw white');
    },function(){
    	$(this).css('text-shadow','-0.1vw 0 black, 0 0.1vw black, 0.1vw 0 black, 0 -0.1vw black');
    });
})(window, document);

//유효성 검사
function form_check() {

	//변수넣기
	var userID = document.getElementById("userID");
	var userPassword = document.getElementById("userPassword");
	var userEmail = document.getElementById("userEmail");
	
	//비밀번호 정규식(영문자+숫자+특수조합[6~20자리 입력])
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
	
	if(userID == ""){
		alert("아이디를 입력해주세요");
		userID.focus();
		return false;
	}else if(userPassword == ""){
		alert("비밀번호를 입력해주세요");
		userPassword.focus();
		return false;
	}else if(!pwdCheck.test(userPassword.value)){
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 6~20자리 사용해야 합니다.");
		userPassword.focus();
		return false;
	}else if(userEmail.value == ""){
		alert("이메일 주소를 입력해주세요");
		userEmail.focus();
		return false;
	}
	return true;
	
	//입력 값 전송
//	document.userUpdate.submit();
}
    

