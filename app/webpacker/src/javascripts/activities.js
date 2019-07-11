$(document).on('turbolinks:load', function() {
  $('#activity-start-at').datetimepicker({
    format: 'YYYY/MM/DD HH:mm'
  });
  $('#activity-end-at').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    useCurrent: false
  });
  $("#activity-start-at").on("change.datetimepicker", function (e) {
    $('#activity-end-at').datetimepicker('minDate', e.date);
  });
  $("#activity-end-at").on("change.datetimepicker", function (e) {
      $('#activity-start-at').datetimepicker('maxDate', e.date);
  });
})