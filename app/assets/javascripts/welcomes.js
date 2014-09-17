
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
    
    //console.log(interestsArr);

    function sleep(ms) {
      var start = new Date().getTime();
      for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > ms){
          break;
        }
      }
    }

    //sleep(2000);
    var interestsArrToSend  = {interests_ids: interestsArr};
    console.log(interestsArrToSend);
    $.ajax({
      url: "/users",
      data: interestsArrToSend,
      success: function(data){
        //console.log(data)
        $("#photo-show").html(data);
      }
    })
    
    });


  
}); 
  
