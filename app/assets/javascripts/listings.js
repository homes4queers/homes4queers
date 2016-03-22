$(document).on('ready page:load', function() {
  $('#search-nearby').on('click', function() {
    if("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(works, worksNot)
    }
  });
});

function works(position){
  var lat = position.coords.latitude
  var lon = position.coords.longitude
  $.ajax({
    url: '/listings',
    method: 'GET',
    data: {latitude: lat, longitude: lon},
    dataType: 'script'
  })
}

function worksNot(error){
  console.log('AAAAAAAAAH' + error.message);
}

// $('#listing_search_fields').html("<%= escape_javascript( render :partial => 'advanced_search' %>");

//image carousel


//change radio label colours on click
$(function() {
  $('.check-box-label').click(function() {
    $(this).toggleClass("check-label-colour")
  });
});


//change radio label colours on click
$(function() {
  $('.radio-button-label').click(function() {
    $(this).addClass("radio-label-colour")
  });
});
//toggle between private or shared space option
$(function() {
  $.when($('.1-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".2-radio-button-label").hasClass("radio-label-colour"))
      $(".2-radio-button-label").removeClass("radio-label-colour")
  }))
})
$(function() {
  $.when($('.2-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".1-radio-button-label").hasClass("radio-label-colour"))
      $(".1-radio-button-label").removeClass("radio-label-colour")
  }))
})
//toggle between unfurnished or furnished
$(function() {
  $.when($('.3-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".4-radio-button-label").hasClass("radio-label-colour"))
      $(".4-radio-button-label").removeClass("radio-label-colour")
  }))
})
$(function() {
  $.when($('.4-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".3-radio-button-label").hasClass("radio-label-colour"))
      $(".3-radio-button-label").removeClass("radio-label-colour")
  }))
})
//toggle between smoking/nonsmoking
$(function() {
  $.when($('.5-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".6-radio-button-label").hasClass("radio-label-colour"))
      $(".6-radio-button-label").removeClass("radio-label-colour")
  }))
})
$(function() {
  $.when($('.6-radio-button-label').click(function(){
    $(this).addClass("radio-label-colour")
    if ($(".5-radio-button-label").hasClass("radio-label-colour"))
      $(".5-radio-button-label").removeClass("radio-label-colour")
  }))
})
