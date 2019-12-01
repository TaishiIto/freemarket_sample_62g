$(document).on('turbolinks:load', function() {
  $(function(){
    $('.thumbnai').click(function(){
      var $thisImg = $(this).attr('src');
      var $thisAlt = $(this).attr('alt');
      $('#main-picture').attr({src:$thisImg,alt:$thisAlt});
    });
  });
});