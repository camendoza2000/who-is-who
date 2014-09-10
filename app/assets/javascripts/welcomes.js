
$(document).ready(function(){
  $(".table_image").click(function(){
    var userId = this.id
    $("#photo-show").load("/users/"+ userId);
  });

    $("#accordion").accordion({
      collapsible: true
    });
 
    $("input[type=checkbox]").click(function() {
    var arr = [];
      $("input[type=checkbox]:checked").each(function(){
        arr.push(parseInt(this.id));
        console.log(arr);
      })  
    })

}); 
  
