import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Application.Storage;

class CJ24BUSMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        Storage.setValue("selectedLine", item.toString());
    }

}