  function toggleText (x){
    if ($.trim( $(x).text()) === "More") {
      $(x).text("Less");
    }
    else{
      $(x).text("More");
    };
  };

$(document).ready(function(){
  $("#expand-button-responsibilities").click(function(){
    toggleText(this);
    $("div#responsibilities").toggleClass( "collapse", 800, "easeOutBounce"  );
     
  });

 $("#expand-button-interests").click(function(){
    toggleText(this);
    $("div#interests").toggleClass( "collapse", 800, "easeOutBounce" );
  });

  $("#expand-button-interests_chooser").click(function(){
    toggleText(this);
    $("div#interests_chooser").toggleClass( "collapse", 800, "easeOutBounce" );
  });

});