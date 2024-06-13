import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application.Storage;

class CJ24BUSView extends WatchUi.View {

    var mLine = "No lines selected. Hold down menu button to choose a line.";
    var lineMapper = new LineMapper();

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    // function onLayout(dc as Dc) as Void {
    //     setLayout(Rez.Layouts.MainLayout(dc));
    // }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        mLine = lineMapper.LineName[Storage.getValue("selectedLine")];
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();

        dc.drawText(dcWidth / 2, dcHeight / 2, Graphics.FONT_GLANCE, mLine, Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
