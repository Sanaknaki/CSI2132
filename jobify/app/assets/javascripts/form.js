//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var Switch = function(){
  $('.switch label').on('click', function(){
    var indicator = $(this).parent('.switch').find('span');
    if ( $(this).hasClass('right') ){
      $(indicator).addClass('right');
    } else {
      $(indicator).removeClass('right');
    }
  });
  $('input[type="radio"][name="user_type"]').change(
    function() {
      if ( document.getElementById('student').checked ){
        $('.student-number').show()
      }else{
        $('.student-number').hide()
      }
    }
  )
}
$(document).on('turbolinks:load', function() {
  Switch();
})
