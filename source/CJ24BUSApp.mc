import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class CJ24BUSApp extends Application.AppBase {
    var mView;

    function initialize() {
        AppBase.initialize();
        if (Storage.getValue("selectedLine") == null) {
            Storage.setValue("selectedLine", "linia_1");
        }
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        mView = new CJ24BUSView();
        return [ mView, new CJ24BUSDelegate() ];
    }

    function getGlanceView() as  [ WatchUi.GlanceView ] or [ WatchUi.GlanceView, WatchUi.GlanceViewDelegate ] or Null {
        return [ new CJ24BUSGlance() ];
    }

}

function getApp() as CJ24BUSApp {
    return Application.getApp() as CJ24BUSApp;
}