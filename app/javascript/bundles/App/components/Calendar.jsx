import React from 'react';
import DatePicker from 'react-datepicker';
import moment from 'moment';

// import 'node_modules/react-datepicker/dist/react-datepicker.css';

// CSS Modules, react-datepicker-cssmodules.css
// import 'react-datepicker/dist/react-datepicker-cssmodules.css';

export default class Calendar extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      startDate: moment()
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(date) {
    this.setState({
      startDate: date
    });
  }

  render() {
    return <DatePicker
      selected={this.state.startDate}
      onChange={this.handleChange}
      showTimeSelect
      dateFormat="LLL"
      name="reservation[start_time]"
      id="reservation[start_time]"
    />;
  }
}