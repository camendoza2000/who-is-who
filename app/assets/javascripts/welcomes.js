
$(document).ready(function(){
  $(".table_image").click(function(){
    var userId = this.id
    $("#photo-show").load("/users/"+ userId);
  });

    $("#accordion").accordion({
      collapsible: true
    });
 
    var interestsArr = [];
    $(".interests-checkbox").click(function() {
      if ($(this).is(":checked")){
        interestsArr.push(parseInt(this.id));
      }
      else{
        var index = interestsArr.indexOf(parseInt(this.id));
        interestsArr.splice(index,1);
      }
   
       for (var x in interestsArr){
      $("table").filter($(x)).fadeOut();
    }

    })

    var test = [1,2];


}); 
  
