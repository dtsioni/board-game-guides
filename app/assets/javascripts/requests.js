$(document).ready(function(){  
  
  $('.request_vote').submit(function(){
    $.post($(this).attr("action"), $(this).serialize(), null, "script");
    return false;
  })

});