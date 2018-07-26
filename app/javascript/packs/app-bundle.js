import ReactOnRails from 'react-on-rails';
import "babel-polyfill";
import Map from '../bundles/App/components/Map.jsx';
import Calendar from '../bundles/App/components/Calendar.jsx';

ReactOnRails.register({
  Map,
  Calendar
});
