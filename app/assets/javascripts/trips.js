$(document).on('turbolinks:load', function() {
  $('#start-at-datetimepicker').datetimepicker({
    format: 'YYYY/MM/DD HH:mm'
  });
  $('#end-at-datetimepicker').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    useCurrent: false
  });
  $("#start-at-datetimepicker").on("change.datetimepicker", function (e) {
    $('#end-at-datetimepicker').datetimepicker('minDate', e.date);
  });
  $("#end-at-datetimepicker").on("change.datetimepicker", function (e) {
      $('#start-at-datetimepicker').datetimepicker('maxDate', e.date);
  });
})