(function (window, document) {
//패스워드 일치 확인
$(".alert-success").hide();
$(".alert-danger").hide();
$("#input").keyup(function(){
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
        $(this).css("background-color","black");
    },function(){
        $(this).css("background","rgba(54,45,68,0.7)");
    });

    $("#back").click(function(){
        location.href="board.jsp";
    });
})(window, document);

//유효성 검사
function sendIt(tag) {
    var ck_pwd = $("#userPassword").val();
    var ck_email = $("#userEmail").val();
    var e;
    var regexPwd =/^.*(?=^.{4,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    var pwd_check = regexPwd.test(ck_pwd);
    
    try{
    
        if(pwd_check == false){
            alert("비밀번호는 4~12자 영문,숫자,특수문자 조합으로 이루어져야 합니다.");
            document.input.userPassword.focus();
            document.input.userPassword.select();
            return false;
        }
    
        if (document.input.userEmail.value == "") {
            alert("이메일을 입력하지 않았습니다.");
            document.userEmail.focus();
            return false;
        }
        
        var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        var email_check = regex.test(ck_email);
        if (email_check == false) {
            alert("잘못된 이메일 형식입니다.");
            document.input.userEmail.value = "";
            document.input.userEmail.focus();
            return false;
        }
        alert('회원정보가 수정되었습니다.');
        return true;
    }catch(e){
        return false;
    }
}