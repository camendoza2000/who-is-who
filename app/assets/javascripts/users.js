  function MoreLess (x){
    if ($.trim( $(x).text()) == "More") {
      $(x).text("Less");
    }
    else{
      $(x).text("More");
    };
  };

$(document).ready(function(){
  $("#expand-button-responsibilities").click(function(){
    MoreLess(this);
    $("div#responsibilities").toggleClass( "colapse", 800, "easeOutBounce"  );
     
  });

 $("#expand-button-interests").click(function(){
    MoreLess(this);
     $("div#interests").toggleClass( "colapse", 800, "easeOutBounce" );
  });


});