import {randomPoint} from '@turf/random';
import mapboxgl from 'mapbox-gl';
import React from 'react';
import ReactDOMServer from 'react-dom/server';
import MapPopup from '../components/MapPopup';

const addMarkerToMap = (document, map, space, popupId, handleReserveClick) => {
  // create a HTML element for each feature
  var el = document.createElement('div');
  el.className = 'marker';
  // make a marker for each feature and add to the map
  let popup = new mapboxgl.Popup({ offset: 25 })
    .setHTML(ReactDOMServer.renderToStaticMarkup(
      <MapPopup 
        styleName={popupId}
        space={space} 
      />))
  // popup.on('open', (e)=> {
  //   document.getElementById(popupId).addEventListener('click', async (f)=>{
  //     let routeData = await handleReserveClick(e.target._lngLat);
  //     addDirections(map, routeData, document);
  //   });
  // });
  space = [space["longitude"], space["latitude"]]
  let marker = new mapboxgl.Marker(el)
    .setLngLat(space)
    // add popups
    .setPopup(popup);

  marker.addTo(map);
  return map;
};






export {addMarkerToMap};