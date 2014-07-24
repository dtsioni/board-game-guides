

$(document).ready(function(){

  //$('#up_submit').submitWithAjax();
  /*upvote not clicked
    when clicked, create upvote for request*/
  
  $('#request_vote').submit(function(){
    $.post($(this).attr("action"), $(this).serialize(), null, "script");
    return false;
  })
/*
  $('.upvote').click(function(){
    $(this).toggleClass('upvote_clicked');

  });
  
  $('.upvote_clicked').click(function(){
    $(this).toggleClass('upvote_clicked');
    


  })
  $('.downvote').click(function(){
    $(this).toggleClass('downvote_clicked');
    


  });  
  $('.downvote_clicked').click(function(){
    $(this).toggleClass('downvote_clicked');
   


  })
*/

});