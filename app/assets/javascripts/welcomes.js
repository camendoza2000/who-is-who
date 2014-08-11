

$(document).ready(function(){
  $("img").click(function(){
    var user_id = this.id
    $("#photo-show").load("/users/"+ user_id);
  });
}); 
    
