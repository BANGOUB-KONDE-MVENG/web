$(document).ready(function(){
    
	
	$("#navbar .img-search").click(function(){
	   if( $("#container-search").hasClass("open")){
		   //alert("fermeture de la recherche");
		   
		  $("#container-search").removeClass("open") ;
		  $("#container-search").slideUp("slow");
	   }
	   else{
		  //alert("ouverture de la recherche");  
          $("#container-search").addClass("open") ;	
           $("#container-search").slideDown("slow");		  
	   }
   }); 
   
   //--------------
   
   $(".search-critere .top input").each(function(index){
	      $(".search-critere .bottom").find(".byDefault").addClass("open");
		  $(this).click(function(){
			  if($(this).is(':checked') ) {
				 $(".search-critere .top input").attr('checked', false);  
				 $(this).attr('checked', true);  
				  val = $(this).val();
				  $(".search-critere .bottom > div").removeClass("open");
				  $(".search-critere .bottom").find("."+val).addClass("open");
			  }else{
				  $(".search-critere .top input").attr('checked', false); 
				  $(".search-critere .top li:first-child input").attr('checked', true); 
				  
				  $(".search-critere .bottom > div").removeClass("open");
				  $(".search-critere .bottom").find(".byDefault").addClass("open");
			  }
		  });
       });
   
   
	
});