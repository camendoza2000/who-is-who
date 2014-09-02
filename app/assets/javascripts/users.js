$(document).ready(function(){
  $("#expand-button-responsibilities").click(function(){
     $("div#responsibilities").animate({height: "100%"})
  });

 $("#expand-button-interests").click(function(){
     $("div#interests").animate({height: "100%"})
  });

});