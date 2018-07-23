import React, { Component } from 'react';
import {Button} from 'semantic-ui-react'

export default class Map extends Component {
  render(){
    return(
      <div className="map-popup">
        {/* <p>{this.props.vendor.properties.category}</p>
        <h3>{this.props.vendor.properties.title}</h3> */}
        <div>
          <Button 
            color="green"
            id={this.props.styleName} 
            className="startNav" 
            onClick={this.props.handleDirectionClick}
          >
            Go
          </Button>
        </div>
      </div>
    )
  }
}