// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:load', function(){
  $('a[target]').click(function(e){
    e.preventDefault();
    $("iframe[name='message-frame']").prop('src', this.href).show();

  });
});
