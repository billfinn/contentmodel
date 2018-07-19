// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require smart_listing
//= require popper
//= require bootstrap

//= require active_admin.js
//= require tree
//= require treelayout
//= require radarchart
//= require radarchartlayout

//= require tinymce
//= require chosen-jquery


$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $('.chosen-select').chosen({
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '100%'
    });
});

$(document).on("turbolinks:load", function() {
  // Disable ajax remote loading of smart listing links
  // See https://github.com/sology/smart_listing/issues/135
  $(".smart-listing a").on("click", function(e) {
    e.preventDefault();
    Turbolinks.visit(this.href);
  });
});
