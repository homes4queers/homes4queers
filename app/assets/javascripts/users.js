// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//toggle radio button users index page
$(function() {
  $.when($('.7-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".8-radio-button-label").hasClass("radio-label-colour")){
      $(".8-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".9-radio-button-label").hasClass("radio-label-colour")){
      $(".9-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});

$(function() {
  $.when($('.8-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".7-radio-button-label").hasClass("radio-label-colour")){
      $(".7-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".9-radio-button-label").hasClass("radio-label-colour")){
      $(".9-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});

$(function() {
  $.when($('.9-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".7-radio-button-label").hasClass("radio-label-colour")){
      $(".7-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".8-radio-button-label").hasClass("radio-label-colour")){
      $(".8-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});

//radio buttons for sign up page
$(function() {
  $.when($('.a-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".b-radio-button-label").hasClass("radio-label-colour")){
      $(".b-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".c-radio-button-label").hasClass("radio-label-colour")){
      $(".c-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".d-radio-button-label").hasClass("radio-label-colour")){
      $(".d-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});
$(function() {
  $.when($('.b-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".a-radio-button-label").hasClass("radio-label-colour")){
      $(".a-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".c-radio-button-label").hasClass("radio-label-colour")){
      $(".c-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".d-radio-button-label").hasClass("radio-label-colour")){
      $(".d-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});$(function() {
  $.when($('.c-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".a-radio-button-label").hasClass("radio-label-colour")){
      $(".a-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".b-radio-button-label").hasClass("radio-label-colour")){
      $(".b-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".d-radio-button-label").hasClass("radio-label-colour")){
      $(".d-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});

$(function() {
  $.when($('.d-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".a-radio-button-label").hasClass("radio-label-colour")){
      $(".a-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".b-radio-button-label").hasClass("radio-label-colour")){
      $(".b-radio-button-label").removeClass("radio-label-colour")
    }
    if ($(".c-radio-button-label").hasClass("radio-label-colour")){
      $(".c-radio-button-label").removeClass("radio-label-colour")
    }
  }));
});
