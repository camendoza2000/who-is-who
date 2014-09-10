
$(document).ready(function(){
  $(".table_image").click(function(){
    var userId = this.id
    $("#photo-show").load("/users/"+ userId);
  });

    $("#accordion").accordion({
      collapsible: true
    });
 
  $(".interest-list").click(function(){
    $("input[type=checkbox]:checked").each ( function() {
      var checkboxId = this.id
      console.log(checkboxId)
    })
  })

}); 
  
