
<html>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<head>
<style type="text/css">
  div#map {
    position: relative;
  }

  div#crosshair {
    position: absolute;
    top: 192px;
    height: 19px;
    width: 19px;
    left: 50%;
    margin-left: -8px;
    display: block;
    background: url(crosshair.gif);
    background-position: center center;
    background-repeat: no-repeat;
}
</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var map;
  var geocoder;
  var centerChangedLast;
  var reverseGeocodedLast;
  var currentReverseGeocodeResponse;
  var markersArray = [];

  function initialize() {
    var latlng = new google.maps.LatLng(-33.4456,-70.6544);
    var myOptions = {
      zoom: 6,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    geocoder = new google.maps.Geocoder();


    setupEvents();
    centerChanged();
  }

  function setupEvents() {
    reverseGeocodedLast = new Date();
    centerChangedLast = new Date();

    // setInterval(function() {
    //   if((new Date()).getSeconds() - centerChangedLast.getSeconds() > 1) {
    //     if(reverseGeocodedLast.getTime() < centerChangedLast.getTime())
    //       reverseGeocode();
    //   }
    // }, 1000);

    google.maps.event.addListener(map, 'zoom_changed', function() {
      document.getElementById("zoom_level").innerHTML = map.getZoom();
    });

    // google.maps.event.addListener(map, 'center_changed', centerChanged);

    // google.maps.event.addDomListener(document.getElementById('crosshair'),'dblclick', function() {
    //    map.setZoom(map.getZoom() + 1);
    // });

  }

  function geocodePosition(pos) {
    geocoder.geocode({
      latLng: pos
    }, function(responses) {
      if (responses && responses.length > 0) {
        updateMarkerAddress(responses[0].formatted_address);
      } else {
        updateMarkerAddress('Cannot determine address at this location.');
      }
    });
  }

  function updateMarkerPosition(latLng) {
    document.getElementById('latlng').innerHTML = [
      latLng.lat(),
      latLng.lng()
    ].join(', ');
    document.getElementById('latitud').value = latLng.lat();
    document.getElementById('longitud').value = latLng.lng();
  }

  function updateMarkerAddress(str) {
    // document.getElementById('formatedAddress').innerHTML = str;
  }

  function getCenterLatLngText() {
    return '(' + map.getCenter().lat() +', '+ map.getCenter().lng() +')';
  }

  function centerChanged() {
    centerChangedLast = new Date();
    var latlng = getCenterLatLngText();
    document.getElementById('latlng').innerHTML = latlng;
    document.getElementById('formatedAddress').innerHTML = '';
    currentReverseGeocodeResponse = null;
  }

  function reverseGeocode() {
    reverseGeocodedLast = new Date();
    geocoder.geocode({latLng:map.getCenter()},reverseGeocodeResult);
  }

  function reverseGeocodeResult(results, status) {
    currentReverseGeocodeResponse = results;
    if(status == 'OK') {
      if(results.length == 0) {
        document.getElementById('formatedAddress').innerHTML = 'None';
      } else {
        document.getElementById('formatedAddress').innerHTML = results[0].formatted_address;
      }
    } else {
      document.getElementById('formatedAddress').innerHTML = 'Error';
    }
  }


  function geocode() {
    var address = document.getElementById("address").value;
    geocoder.geocode({
      'address': address,
      'partialmatch': true}, geocodeResult);
    clearOverlays();
  }

  function geocodeResult(results, status) {
    if (status == 'OK' && results.length > 0) {
      map.fitBounds(results[0].geometry.viewport);
      addMarkerAtCenter();
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  }

  function clearOverlays() {
    for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].setMap(null);
    }
    markersArray = [];
  }

  function addMarkerAtCenter() {
    var marker = new google.maps.Marker({
        position: map.getCenter(),
        map: map,
        draggable:true
    });

    markersArray.push(marker);
    google.maps.event.addListener(marker,"click",function(){});

        // Add dragging event listeners.
    google.maps.event.addListener(marker, 'dragstart', function() {
      // updateMarkerAddress('Dragging...');
    });
    
    google.maps.event.addListener(marker, 'drag', function() {
      // updateMarkerStatus('Dragging...');
      updateMarkerPosition(marker.getPosition());
    });
    
    google.maps.event.addListener(marker, 'dragend', function() {
      // updateMarkerStatus('Drag ended');
      geocodePosition(marker.getPosition());
    });

    document.getElementById('latitud').value = marker.getPosition().lat();
    document.getElementById('longitud').value = marker.getPosition().lng();

    var text = 'Lat/Lng: ' + getCenterLatLngText();
    if(currentReverseGeocodeResponse) {
      var addr = '';
      if(currentReverseGeocodeResponse.size == 0) {
        addr = 'None';
      } else {
        addr = currentReverseGeocodeResponse[0].formatted_address;
      }
      text = text + '<br>' + 'address: <br>' + addr;
    }

    var infowindow = new google.maps.InfoWindow({ content: text });

    google.maps.event.addListener(marker, 'click', function() {
      // infowindow.open(map,marker);
    });
  }

</script>
</head>
<body onload="initialize()">
  <!-- Find Place: <input type="text" id="address"/><input type="button" value="Go" onclick="geocode()"><input type="button" value="Clear Markers" onclick="clearOverlays()"/> -->
  <div id="map">
    <div id="map_canvas" style="width:100%; height:400px; float:left;"></div>
    <!-- <div id="crosshair"></div> -->
  </div>

  <table style="display:none;">
    <tr><td>Lat/Lng:</td><td><div id="latlng"></div></td></tr>
    <tr><td>Address:</td><td><div id="formatedAddress"></div></td></tr>
    <tr><td>Zoom Level</td><td><div id="zoom_level">2</div></td></tr>
  </table>
</body>
</html>
