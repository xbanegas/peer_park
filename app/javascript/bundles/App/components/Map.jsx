import PropTypes from 'prop-types';
import React from 'react';
import {initMap, loadPosition, addSpacesToMap} from '../utils/mapUtils';

export default class Map extends React.Component {
  // static propTypes = { name: PropTypes.string.isRequired };

  constructor(props) {
    super(props);
    this.mapStyle = {
			position: 'relative',
			top: 0,
      bottom: 0,
      width: '100%',
      height: '80vh',
      'margin-left': 'auto',
      'margin-right': 'auto'
    };
    this.state={map:{}, userLoc:null}
  }

  async componentDidMount() {
    let userLoc = await loadPosition();
    let map = await initMap(userLoc, this.mapContainer, this.props.MAPBOX_API_KEY);
    if (userLoc){ addSpacesToMap(document, map, userLoc, this.handleReserveClick); }
    let state = {...this.state}
		state.userLoc = userLoc;
    state.map = map;
    this.setState(state);
  }

	async handleReserveClick(destLoc){
		// let reservationData = await this.getReservation(spaceLoc)
		// return reservationData;
  }
  
	render() {
    return (
      <div id="mapContainer" style={{ position: "relative", }}>
        <div style={this.mapStyle} ref={el => this.mapContainer = el} />
      </div>
    );
  }
}
