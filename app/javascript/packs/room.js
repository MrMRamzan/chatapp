$(function() {
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
    // $(this).find('input[type="text"]').val('text from success');
  });
});