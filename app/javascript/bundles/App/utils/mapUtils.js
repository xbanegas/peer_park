import axios from 'axios';
import * as turf from 'turf';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import mapboxgl from 'mapbox-gl';
import {addMarkerToMap, genRandomLocalPoints, genRandomBeachPoints} from './mapboxUtils';

// Initialize The Map
const initMap = (userLoc, mapContainer, MAPBOX_API_KEY) =>{
  mapboxgl.accessToken = MAPBOX_API_KEY;

  // initialize map
  let map = new mapboxgl.Map({
    container: mapContainer,
    style: 'mapbox://styles/mapbox/streets-v9',
    center: userLoc,
    zoom: 12
  });

  // add Nav control
  var nav = new mapboxgl.NavigationControl();
  map.addControl(nav, 'top-right');

  // add GeoLocation Control
  map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: { enableHighAccuracy: true },
    trackUserLocation: true
  }));
  
  // Handle Map Events
  // map.on('click', function(e){
    // console.log(e);
    // console.log(map.queryRenderedFeatures(e.point));
  // });
  map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken
    }), 'bottom-left'
  );
  return map;
};

//  Request nearby Spaces and add them to the Map
const addSpacesToMap = async(document, map, userLoc, handleReserveClick) => {
  let res = await getSpaces(userLoc);
  let space = res.data;
  space.forEach(function (space ,i) {
    let popupId = `popup-${i}`;
    map = addMarkerToMap(document, map, space, popupId, handleReserveClick);
    return map;
  });

};

// Get Spaces from Rails Given User Location
const getSpaces = async (geoLoc) => {
  let spacesReqURL = `/spaces.json?lon=${geoLoc[0]}&lat=${geoLoc[1]}`
  let spaces = await axios.get(spacesReqURL)
  return spaces
}


// Handle Getting the Current Position
// Return [lon, lat]
const loadPosition = async () => {
  try {
    const position = await getCurrentPosition();
    return  [position.coords.longitude, position.coords.latitude];
  } catch (error) {
    console.log(error);
  }
};
const getCurrentPosition = (options = {}) => {
  return new Promise((resolve, reject) => {
    navigator.geolocation.getCurrentPosition(resolve, reject, options);
  });
};

export {initMap, loadPosition, addSpacesToMap}