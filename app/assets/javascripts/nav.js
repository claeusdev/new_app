$(document).on("turbolinks:load", function () {
  'use strict';
    // $(".userNav .menuNav").hide();
  $(".account-action").on("click", function(){
    $(".userNav .menuNav").toggle();
    if ($(".notifications .menuNav").show()) {
      $(".notifications .menuNav").hide();
    }
  });

  $(".nav-action-notifications").on("click", function(){
    $(".notifications .menuNav").toggle();
    if ($(".userNav .menuNav").show()) {
      $(".userNav .menuNav").hide();
    }
  });


  $(".show-search").on("click", function(){
    $('body').addClass('showingMobileSearch');
    $('.navUserSection').hide();
    $('.mobileSearch').css('display', 'block');
  });

});