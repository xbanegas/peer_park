import ReactOnRails from 'react-on-rails';
import "babel-polyfill";
import Map from '../bundles/App/components/Map.jsx';
import Calendar from '../bundles/App/components/Calendar.jsx';
import Reservation from '../bundles/App/components/Reservation.jsx';

ReactOnRails.register({
  Map,
  Calendar,
  Reservation
});
