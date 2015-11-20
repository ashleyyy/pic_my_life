$(function(){
 
    var $photowall = $('.photowall');
   
    $photowall.imagesLoaded( function(){
      $photowall.masonry({
        itemSelector : '.grid-item'
      });
    });
   
  });