(function (window, document) {
    $(".headerA").hover(function() {
    	$(this).css('text-shadow','-0.1vw 0 white, 0 0.1vw white, 0.1vw 0 white, 0 -0.1vw white');
    },function(){
    	$(this).css('text-shadow','-0.1vw 0 black, 0 0.1vw black, 0.1vw 0 black, 0 -0.1vw black');
    });
})(window, document);