
$(document).ready(function(){
  $(".table_image").click(function(){
    var userId = this.id
    $("#photo-show").load("/users/"+ userId);
  });

  $("div#accordionButton").click(function(){
    $("div#accordionContent").slideUp("normal");
    $(this).next().slideDown("normal");
  });

  $("div#accordionContent").hide();

}); 
  



/*// getter
var active = $( ".selector" ).accordion( "option", "active" );
// setter
$( ".selector" ).accordion( "option", "active", 2 );

// getter
var animate = $( ".selector" ).accordion( "option", "animate" );
// setter
$( ".selector" ).accordion( "option", "animate", 200 );

// getter
var collapsible = $( ".selector" ).accordion( "option", "collapsible" );
// setter
$( ".selector" ).accordion( "option", "collapsible", true );

// getter
var disabled = $( ".selector" ).accordion( "option", "disabled" );
// setter
$( ".selector" ).accordion( "option", "disabled", true );

// getter
var event = $( ".selector" ).accordion( "option", "event" );
// setter
$( ".selector" ).accordion( "option", "event", "mouseover" );

// getter
var header = $( ".selector" ).accordion( "option", "header" );
// setter
$( ".selector" ).accordion( "option", "header", "h3" );

// getter
var heightStyle = $( ".selector" ).accordion( "option", "heightStyle" );
// setter
$( ".selector" ).accordion( "option", "heightStyle", "fill" );
*/
