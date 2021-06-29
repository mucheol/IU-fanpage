(function (window, document) {
    $('#fullpage').fullpage({
        autoScrolling:true,
        scrollHorizontally: true,
        keyboardScrolling: true,
        loopTop : true,
        loopBottom : true,
        lockAnchors: false,
        anchors:['first','second'],
        navigation: true,
        navigationPosition: 'right',
        navigationTooltips: ['게시판','응원글'],
        sectionSelector: '.section'
    });
    
//HEADER
    $(".headerA").hover(function() {
    	$(this).css('text-shadow','-0.1vw 0 white, 0 0.1vw white, 0.1vw 0 white, 0 -0.1vw white');
    },function(){
    	$(this).css('text-shadow','-0.1vw 0 black, 0 0.1vw black, 0.1vw 0 black, 0 -0.1vw black');
    });
    
    
    //JOIN MODAL
    $("#join").click(function() {
    	$("#joinModal").fadeIn('slow');
    });
    $("#joinModal__exitBtn").click(function() {
        $("#joinModal").css('display','none');
    });
    
})(window, document);