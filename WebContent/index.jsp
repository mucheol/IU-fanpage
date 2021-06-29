<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IU 팬페이지</title>
	<link rel="stylesheet" href="./css/index.css">
	
</head>
<body>
	<div id=header>
        <div class="header-left">
            <a href="./views/profile.jsp">Profile</a>
            <a href="./views/dramaMovie.jsp">Drama & Movie</a>
        </div>
            <a href="index.jsp"><img src="./img/logo.png" id="headerLogo"></a>
        <div class="header-right">
            <a href="./views/music.jsp">Music</a> 
            <a href="./views/video.jsp">Video</a>
            <a href="./views/board/board.jsp">Board</a>
        </div>
    </div>
    
    	<p id="notice">지속적으로 업데이트 중이며 아직은 미완성 입니다 :)</p>
    
    
    <div id="bodyContainer">
        <div id="videoBox">
            <iframe width="857" height="482" src="https://www.youtube.com/embed/86BST8NIpNM?rel=0&autoplay=1&vq=hd1080&mute=1&playlist=86BST8NIpNM,v7bnOxV4jAc&loop=1&disablekb=1&modestbranding=1&showinfo=0" title="IU player"  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    </div>
    
    
    <div id="footer">
        <div id="footer-top">
            <p style="cursor:default">IU 링크</p>
        </div>
        <div id="footer-bottom">
        	<a href="https://www.youtube.com/channel/UC3SyT4_WLHzN7JmHQwKQZww" target="blank">IU Youtube</a>
        	<a href="https://www.youtube.com/channel/UCU8MOmf9frN_60TIGvwlQEQ" target="blank">EDAM Youtube</a>
            <a href="https://www.instagram.com/dlwlrma/?hl=ko" target="blank">Instargram</a>
            <a href="https://twitter.com/_iuofficial?lang=ko" target="blank">Twitter</a>
            <a href="https://www.facebook.com/iu.loen" target="blank">Facebook</a>
            <a href="https://www.vlive.tv/channel/FA895" target="blank">V Live</a>
            <a href="https://m.cafe.daum.net/IU" target="blank">UAENA 공식카페</a>
            <a href="https://gall.dcinside.com/board/lists?id=iu_new" target="blank">IU 갤러리</a>
            <a href="https://madeedam.com/" target="blank">Made EDAM</a>
        </div>
    </div>




	<script src="./js/openSource/jquery-3.6.0.min.js"></script>
	<script src="./js/openSource/mouseEffect.js"></script>
	<script src="./js/common.js"></script>
</body>
</html>