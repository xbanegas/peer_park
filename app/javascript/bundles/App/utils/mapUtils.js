import axios from 'axios';
import mapboxgl from 'mapbox-gl';
// import {addMarkerToMap} from './mapboxUtils';

const initMap = (userLoc, mapContainer, MAPBOX_API_KEY) =>{
  mapboxgl.accessToken = MAPBOX_API_KEY;

  let geoLoc;
  let map;

  // get current location
  let position = userLoc;
  geoLoc = [position.coords.longitude, position.coords.latitude];

  // initialize map
  map = new mapboxgl.Map({
    container: mapContainer,
    style: 'mapbox://styles/mapbox/streets-v9',
    center: geoLoc,
    zoom: 12
  });

  // add Nav control
  var nav = new mapboxgl.NavigationControl();
  map.addControl(nav, 'top-right');

  // add GeoLocation Control
  map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
        enableHighAccuracy: true
    },
    trackUserLocation: true
  }));
  return map
};

const loadPosition = async () => {
  try {
    const position = await getCurrentPosition();
    return position
  } catch (error) {
    console.log(error);
  }
};

const getCurrentPosition = (options = {}) => {
  return new Promise((resolve, reject) => {
    navigator.geolocation.getCurrentPosition(resolve, reject, options);
  });
};

export {initMap, loadPosition, addVendorsToMap}