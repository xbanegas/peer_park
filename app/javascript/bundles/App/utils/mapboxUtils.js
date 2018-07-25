import {randomPoint} from '@turf/random';
import mapboxgl from 'mapbox-gl';
import React from 'react';
import ReactDOMServer from 'react-dom/server';
import MapPopup from '../components/MapPopup';

const addMarkerToMap = (document, map, space, popupId, handleReserveClick) => {
  // console.log(turf.point([-75.343, 39.984]));
  // create a HTML element for each feature
  var el = document.createElement('div');
  el.className = 'marker';
  // make a marker for each feature and add to the map
  // let popup = new mapboxgl.Popup({ offset: 25 })
  //   .setHTML(ReactDOMServer.renderToStaticMarkup(
  //     <MapPopup 
  //       styleName={popupId}
  //       space={space} 
  //     />))
  // popup.on('open', (e)=> {
  //   document.getElementById(popupId).addEventListener('click', async (f)=>{
  //     let routeData = await handleReserveClick(e.target._lngLat);
  //     addDirections(map, routeData, document);
  //   });
  // });
  space = space.geometry.coordinates
  // space = [space[1], space[0]]
  // let space_point = turf.point(space);
  let marker = new mapboxgl.Marker(el)
    .setLngLat(space);
    // add popups
    // .setPopup(popup);

  marker.addTo(map);
  // console.log(el)
  return map;
};


const genRandomLocalPoints = () => {
  let topBound = 25.925716;
  let rightBound = -80.189068;
  let bottomBound = 25.734432;
  let leftBound =  -80.385792;

  // bbox = [minX, minY, maxX, maxY]
  let bbox = {bbox: [leftBound, bottomBound, rightBound, topBound] };

  let points = randomPoint(50, bbox);

  console.log(points);
  return points;
}

const genRandomBeachPoints = () => {
  let topBound = 25.822387;
  let bottomBound = 25.768215;
  let leftBound = -80.141089;
  let rightBound = -80.129888;

  let bbox = {bbox: [leftBound, bottomBound, rightBound, topBound]};
  let points = randomPoint(20, bbox);
  return points;
}



export {addMarkerToMap, genRandomLocalPoints, genRandomBeachPoints};