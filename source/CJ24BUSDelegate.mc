import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;

class CJ24BUSDelegate extends WatchUi.BehaviorDelegate {

    var mDragStart;

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.LinesMenu(), new CJ24BUSMenuDelegate(), WatchUi.SLIDE_RIGHT);
        return true;
    }

    function onKey(event) {
        if(WatchUi.KEY_DOWN == event.getKey()) {
            Application.getApp().mView.scrollUp();
        } else if(WatchUi.KEY_UP == event.getKey()) {
            Application.getApp().mView.scrollDown();
        }
        return true;
    }

    function onDrag(dragEvent) {
        if(WatchUi.DRAG_TYPE_START == dragEvent.getType()) {
            mDragStart = dragEvent.getCoordinates()[1];
        } else {
            if(WatchUi.DRAG_TYPE_CONTINUE == dragEvent.getType()) {
                Application.getApp().mView.onDeltaChange(dragEvent.getCoordinates()[1] - mDragStart);
            } else {
                Application.getApp().mView.onStopScroll();
            }
        }
        return true;
    }

}