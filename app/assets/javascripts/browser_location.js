function geoFindMe() {
  const status = document.querySelector('#status');

  function success(position) {
    const latitude  = position.coords.latitude;
    const longitude = position.coords.longitude;

    fetch(`https://spaceinyourface.herokuapp.com/geocode?longlat=${longitude},${latitude}`)
      .then((resp) => resp.json())
      .then(function(data) {
        let placeName = data.features[0]['place_name']
        document.getElementById("location").value = placeName;
      })
    status.textContent = '';
  }

  function error() {
    status.textContent = 'Unable to retrieve your location';
  }

  if (!navigator.geolocation) {
    status.textContent = 'Geolocation is not supported by your browser';
  } else {
    status.textContent = 'Locating…';
    navigator.geolocation.getCurrentPosition(success, error);
  }
}

window.onload=function(){
  document.querySelector('#browser-location').addEventListener('click', geoFindMe);
}
