import React from 'react';

export default class Reservation extends React.Component {
  constructor(){
    super()
    this.state = {duration:"", amount:""}
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleChange(event) {
    let duration = event.target.value;
    let amount = duration * this.props.hourly_rate;
    this.setState({duration: duration, amount: amount});

  }
  handleSubmit(e){
    e.preventDefault();
    let amount = this.props.hourly_rate * this.state.duration
    let sp = document.getElementById('stripebutton');
    sp.setAttribute('data-amount',`${amount}`);
    let wrap = document.getElementById('stripeWrapper').classList.replace('hidden', 'visible');
    console.log(sp.classList);
  }
  render(){
    return(
      <div className="required field">
        <label>Enter Duration</label>
        <input class="duration ui input" type="number" name="reservation[duration]" id="reservation_duration" value={this.state.duration} onChange={this.handleChange} />
        <div class="total">Total: {(this.state.amount/100.0).toLocaleString('en-US', {style: "currency", currency:"USD"})}</div>
      </div>
    )
  }
}
