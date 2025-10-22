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

import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class GarminAverageSpeedOverTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new GarminAverageSpeedOverTimeView() ];
    }

}

function getApp() as GarminAverageSpeedOverTimeApp {
    return Application.getApp() as GarminAverageSpeedOverTimeApp;
}