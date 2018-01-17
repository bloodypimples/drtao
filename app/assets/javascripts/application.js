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
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require ckeditor/init
//= require jquery3
//= require bootstrap-sprockets
function smooth_scroll(trigger_element, target_element){
  $(document).on('click', trigger_element, function(e){
    e.preventDefault();

    $('html, body').animate({
      scrollTop: $(target_element).offset().top
    }, 500);
  })
}

$(document).ready(function () {
  $(document).on('click', '.categories h2' , function(){
    $('.categories .items').toggleClass("visible");
  })

  // nav bar reveals dropdown menu upon mouseenter
  $(document).on('mouseenter', '.navbar li' , function(){
    var dropdown = $(this).find('.dropdown-menu')
    dropdown.addClass('show')
  })
  // nav bar hides dropdown menu on mouseleave
  $(document).on('mouseleave', '.navbar li' , function(){
    var dropdown = $(this).find('.dropdown-menu')
    dropdown.removeClass('show')
  })

  smooth_scroll("a[href='#contact']", "#contact")
});
