$(document).ready(function(){
	
    $('.contents').hover(function() {
        if($(this).find('.contents__title').css('display') == 'none'){
            $(this).find('.contents__title__back').fadeIn(400);
            $(this).find('.contents__title').fadeIn(400);
        }else{
            $(this).find('.contents__title__back').css('display','none');
            $(this).find('.contents__title').css('display','none');
        }
    });

    $("#modal__exit").click(function(){
        $(".modal").fadeOut();
    });
});
