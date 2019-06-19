function geoFindMe() {
  const status = document.querySelector('#status');

  function success(position) {
    const latitude  = position.coords.latitude;
    const longitude = position.coords.longitude;

    // Testing with localhost
    // fetch(`http://localhost:3000/geocode?longlat=${longitude},${latitude}`)
    fetch(`https://spaceinyourface.herokuapp.com/geocode?longlat=${longitude},${latitude}`)
      .then((resp) => resp.json())
      .then(function(data) {
        let placeName = data.features[0]['place_name']
        document.getElementById("location").value = placeName;
        document.querySelector('#browser-location').setAttribute('class', 'location-success')

      })
    status.textContent = '';
  }

  function error() {

    document.querySelector('#browser-location').setAttribute('class', 'location-default')

    status.textContent = 'Unable to retrieve your location';
  }

  if (!navigator.geolocation) {
    status.textContent = 'Geolocation is not supported by your browser';
  } else {
    status.textContent = 'Finding your location...';

    document.querySelector('#browser-location').setAttribute('class', 'location-default')

    navigator.geolocation.getCurrentPosition(success, error);
  }
}

// window.onload=function(){
document.addEventListener("turbolinks:load", function() {
  let browserLocation = document.querySelector('#browser-location')
  if (browserLocation) { browserLocation.addEventListener('click', geoFindMe); }
  }
)
