// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/dist/js/bootstrap
//= require moment
//= require moment/ru
//= require bootstrap-datetimepicker
//= require select2-full
//
//= require_tree .
//

$(function() {
  $('.datetimepicker').datetimepicker({
    locale: 'ru',
    maxDate: new Date(),
    allowInputToggle: true
  });

  $('.tag-select').select2({
    theme: 'bootstrap',
    placeholder: 'Выберете теги',
    tokenSeparators: [','],
    allowClear: true,
    tags: true
  })
});
