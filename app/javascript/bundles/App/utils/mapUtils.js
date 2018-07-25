import axios from 'axios';
import mapboxgl from 'mapbox-gl';
import {addMarkerToMap} from './mapboxUtils';

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

const getSpaces = async (geoLoc) => {
  // return await axios.get(`/spaces.json?lon=25&lat=-80`)
  let spaces = [ [ 25.729882845352492, -80.1634083969233 ],
  [ 25.83131328097298, -80.22819686233824 ],
  [ 25.77854550169198, -80.19334246943383 ],
  [ 25.7897505458167, -80.16055074113888 ],
  [ 25.808313449672607, -80.21170244502332 ],
  [ 25.796932877290185, -80.22308835220034 ],
  [ 25.791673017351915, -80.1555475057403 ],
  [ 25.773794136308656, -80.18269500048156 ],
  [ 25.783810715043995, -80.21168376082137 ],
  [ 25.828856847325387, -80.20906470793574 ] ];
  return spaces
}

const addSpacesToMap = async(document, map, userLoc, handleReserveClick) => {
  let position = userLoc;
  let geoLoc = [position.coords.longitude, position.coords.latitude];
  let res = await getSpaces(geoLoc);
  // let geojson = res.data;
  // geojson.features.forEach(function (space ,i) {
  res.forEach(function (space ,i) {
    let popupId = `popup-${i}`;
    map = addMarkerToMap(document, map, space, popupId, handleReserveClick);
    return map;
  });
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

export {initMap, loadPosition, addSpacesToMap}