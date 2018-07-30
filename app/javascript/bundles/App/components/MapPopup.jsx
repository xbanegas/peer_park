import React, { Component } from 'react';
import {Button} from 'semantic-ui-react'

export default class Map extends Component {
  render(){
    let url = `reservations/new?space=${this.props.space.id}`
    return(
      <div className="map-popup">
        <p>{this.props.space.address}</p>
        <h3>${this.props.space.hourly_rate/100}</h3>
        <div>
          <Button 
            href={url}
            // color="green"
          >
          Reserve
          </Button>
        </div>
      </div>
    )
  }
}