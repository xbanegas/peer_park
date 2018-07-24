import PropTypes from 'prop-types';
import React from 'react';
import {initMap, loadPosition, addVendorsToMap} from '../utils/mapUtils';

export default class Map extends React.Component {
  // static propTypes = { name: PropTypes.string.isRequired };

  constructor(props) {
    super(props);
    this.mapStyle = {
			position: 'relative',
			top: 0,
			bottom: 0,
      width: '75%',
      height: 400,
      'margin-left': 'auto',
      'margin-right': 'auto'
		};
  }

  async componentDidMount() {
    let userLoc = await loadPosition();
    let map = await initMap(userLoc, this.mapContainer, this.props.MAPBOX_API_KEY)
  }


	render() {
		console.log(this.props);
    return (
      <div id="mapContainer" style={{ position: "relative", }}>
        <div style={this.mapStyle} ref={el => this.mapContainer = el} />
      </div>
    );
  }
}
