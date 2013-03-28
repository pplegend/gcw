$(document).ready(function() {
          //reply topic button
		$('.reply_button').click(function(e){
		var quote_text=$(this).prev().text();
		var quote_user=$(this).next().val();
		var quote="回复 【"+ quote_user+"】 【"+quote_text+"】";
		$("#post_body").val(quote);
		$("#post_body").focus();
		})
           // Prepare layout options.
        	$('.dropdown-toggle').dropdown();
        //sign in button
            $(".dropdown-signin").click(function(e) {          
				e.preventDefault();
                $("#signin_menu").toggle();
				
            });
			
			$("#signin_menu").mouseup(function() {
				return false
			});
			$(document).mouseup(function(e) {
				if($(e.target).parent("a.dropdown-signin").length==0) {
					
					$("#signin_menu").hide();
				}
			});

		$('#new_forum_btn').click(function(){
	
		 $(this).hide();
		
		 $(".new_forum_form").css("display","block");
							
		  
	  });
	  
	$(".topic_form_cancel").click(function(){
			$("#topic_form").show();
			//$(".messagepop").css("display","none");
			deselect()
			$("#topic_list").css("display","block");
			
							
	});

});
 function deselect() {
    $(".pop").slideFadeToggle(function() { 
        $("#topic_form").removeClass("selected");
    });    
    $("#topic_form").removeAttr("disabled");
     
}

$(function() {
    $("#topic_form").live('click', function() {
        if($(this).hasClass("selected")) {
	  
            deselect();               
        } else {
            $(this).addClass("selected");
	      $(this).attr("disabled", "disabled");
	    $("#topic_list").css("display","none");
            $(".pop").slideFadeToggle(function() { 
                $("#topic_title").focus();
            });
        }
        return false;
    });

    $(".close").live('click', function() {
        deselect();
        return false;
    });
});

$.fn.slideFadeToggle = function(easing, callback) {
    return this.animate({ opacity: 'toggle', height: 'toggle' }, "fast", easing, callback);
};

$(function() {
    var $backToTopTxt = "返回顶部", $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body"))
        .text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 120);
    }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();    
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);    
        }
    };
    $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
});


		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: "url(<%= asset_path 'loading.gif' %>)",
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						bottom:-35
					},100);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						bottom:0
					},200);
				}
			});
		});
	
