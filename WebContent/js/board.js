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
    
    //JOIN MODAL
    $("#join").click(function() {
    	$("#joinModal").fadeIn('slow');
    });
    $("#joinModal__exitBtn").click(function() {
        $("#joinModal").css('display','none');
    });
    
})(window, document);