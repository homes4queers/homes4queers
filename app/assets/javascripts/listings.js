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

var results = document.getElementById('results');
results.innerHTML = '<h3>You scored <span>'+score+'</span> out of <span>'+total+'</span></h3>';
alert('You scored '+score+' out of '+total);
