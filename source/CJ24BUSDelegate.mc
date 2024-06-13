import Toybox.Lang;
import Toybox.WatchUi;

class CJ24BUSDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new CJ24BUSMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}