$(document).ready(function() {

    //home page ul roate

    function run() {
    //$("li").click(function() {  
    var prev = $("#rotated li:first-child");
    $.unique(prev).each(function(i) {
      $(this).delay(i*600).slideUp(function() {
        $(this).appendTo(this.parentNode).slideDown();
      });
    });
  //});
}
  
  window.setInterval(run,1500);
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


// js for forum slides

$(document).ready(
				  
function() {

	//Set Default State of each portfolio piece
	$(".paging").show();
	$(".paging a:first").addClass("active");

	//Get size of images, how many there are, then determin the size of the image reel.
	var imageWidth = $(".window").width();
	var imageSum = $(".image_reel img").size();
	var imageReelWidth = imageWidth * imageSum;
	
	//Adjust the image reel to its new size
	$(".image_reel").css({'width' : imageReelWidth});

	//Paging + Slider Function
	rotate = function(){	
	    var triggerID = $active.attr("rel") - 1; //Get number of times to slide
	    var image_reelPosition = triggerID * imageWidth; //Determines the distance the image reel needs to slide
	
	    $(".paging a").removeClass('active'); //Remove all active class
	    $active.addClass('active'); //Add active class (the $active is declared in the rotateSwitch function)
	    
		$(".desc").stop(true,true).slideUp('slow');
		
		$(".desc").eq( $('.paging a.active').attr("rel") - 1 ).slideDown("slow"); 
		
	    //Slider Animation
	    $(".image_reel").animate({ 
	        left: -image_reelPosition
	    }, 500 ); 
	
		
	}; 

	//Rotation + Timing Event
	rotateSwitch = function(){	
	$(".desc").eq( $('.paging a.active').attr("rel") - 1 ).slideDown("slow");	
	    play = setInterval(function(){ //Set timer - this will repeat itself every 3 seconds
	        $active = $('.paging a.active').next();
	        if ( $active.length === 0) { //If paging reaches the end...
	            $active = $('.paging a:first'); //go back to first
	        }
	        rotate(); //Trigger the paging and slider function
	    }, 6000); //Timer speed in milliseconds (3 seconds)	
	
	};
	
	rotateSwitch(); //Run function on launch

 //On Click
    $(".paging a").click(function() {    
        $active = $(this); //Activate the clicked paging
        //Reset Timer
        clearInterval(play); //Stop the rotation
        rotate(); //Trigger rotation immediately
        rotateSwitch(); // Resume rotation
        return false; //Prevent browser jump to link anchor
    });    

	
	
});
//返回顶部

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

