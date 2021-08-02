(function (window, document) {
    $(".headerA").hover(function() {
    	$(this).css('text-shadow','-0.25vw 0 white, 0 0.25vw white, 0.25vw 0 white, 0 -0.25vw white');
    },function(){
    	$(this).css('text-shadow','-0.25vw 0 black, 0 0.25vw black, 0.25vw 0 black, 0 -0.25vw black');
    });
})(window, document);