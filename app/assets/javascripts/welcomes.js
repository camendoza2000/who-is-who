
$(document).ready(function(){
  console.log("CARGADO");
  $(".table_image").click(function(){
    var user_id = this.id
    //$("#photo-show").load("/users/"+ user_id);
    $.get("/users/"+ user_id, function(data){
      $("#photo-show").html(data);
    });
  });
}); 
    
