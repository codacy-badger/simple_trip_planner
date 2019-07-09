$(document).on('turbolinks:load', function() {
  $('#trip-start-at').datetimepicker({
    format: 'YYYY/MM/DD HH:mm'
  });
  $('#trip-end-at').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    useCurrent: false
  });
  $("#trip-start-at").on("change.datetimepicker", function (e) {
    $('#trip-end-at').datetimepicker('minDate', e.date);
  });
  $("#trip-end-at").on("change.datetimepicker", function (e) {
      $('#trip-start-at').datetimepicker('maxDate', e.date);
  });
})