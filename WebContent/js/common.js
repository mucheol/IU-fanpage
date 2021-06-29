(function (window, document) {
    $("#headerLogo").hover(function(){
    	$(this).css('width','10vw');
    	$(this).css('top','0');
    },function(){
    	$(this).css('width','9vw');
    	$(this).css('top','0.4vw');
    });
})(window, document);