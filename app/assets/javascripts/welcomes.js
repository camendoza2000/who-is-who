
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
    

    var interestsArrToSend  = {interests_ids: interestsArr};

    $.ajax({
      url: "/users",
      data: interestsArrToSend,
      success: function(data){
        $("#photo-show").html(data);
      }
    })
    
    });


  
}); 
  
