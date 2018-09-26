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
// require turbolinks
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require_tree .


$(document).ready(function(){
  $( "#guestLogin" ).click(function(){
    $(".guestSignIn").removeClass("hide")
    });
  $( "#guestClose" ).click(function(){
    $(".guestSignIn").addClass("hide")
    });
  $( "#logIn" ).click(function(){
    $(".logIn").removeClass("hide")
    });
  $( "#loginClose" ).click(function(){
    $(".logIn").addClass("hide")
    });
  });

$(document).ready(function(){

  });

  scrollPos = 0;
  window.addEventListener("scroll", function() {
    scrollPos = window.scrollY;
    if (scrollPos > 50) {
      section1 = document.getElementById("aboutSectionOne");
      section1.classList.add("revealed");
      section1.classList.remove("hidden");
    }
  });
