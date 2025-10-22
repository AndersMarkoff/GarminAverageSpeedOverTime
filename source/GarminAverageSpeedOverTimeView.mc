/*
Garmin Average Speed Over Time - A data field and graph that shows
average speed over the duration of an activity.
Copyright (C) 2025 Anders Markoff

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
using Toybox.FitContributor;

class GarminAverageSpeedOverTimeView extends WatchUi.SimpleDataField {

    var averageSpeedField = null;
    const AVERAGE_SPEED_FIELD_ID = 0;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Average Speed";

        // Create the custom FIT data field we want to record.
        averageSpeedField = createField(
            "average_speed",
            AVERAGE_SPEED_FIELD_ID,
            FitContributor.DATA_TYPE_FLOAT,
            {:mesgType=>FitContributor.MESG_TYPE_RECORD, :units=>"km/h"}
        );

        averageSpeedField.setData(0.0);
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        if (info != null && info.elapsedDistance != null && info.timerTime != null) {
            var distance = info.elapsedDistance; // Distance in meters
            var time = info.timerTime;           // Time in milliseconds

            // Compute average speed in meters per second
            var avgSpeedMps = distance.toFloat() / (time.toFloat() / 1000.0);
            
            // Convert to kilometers per hour
            // 1 m/s = 3.6 km/h
            var avgSpeedKmh = avgSpeedMps * 3.6;

            // Calculate and set data to be written to the Field
            averageSpeedField.setData(avgSpeedKmh);

            // Return the average speed in km/h for display
            return avgSpeedKmh; 
        }
        // Default return 0.0 if data is not available
        return 0.0;
    }

}