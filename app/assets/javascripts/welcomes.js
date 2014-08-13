
$(document).ready(function(){
  $(".table_image").click(function(){
    var user_id = this.id
    $("#photo-show").load("/users/"+ user_id);
  });
}); 
    
