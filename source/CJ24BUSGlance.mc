import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application.Storage;
import Toybox.Time.Gregorian;


(:glance)
class CJ24BUSGlance extends WatchUi.GlanceView {

    var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);


    function initialize() {
        GlanceView.initialize();
    }

    // // Load your resources here
    // function onLayout(dc as Dc) as Void {
    //     setLayout(Rez.Layouts.MainLayout(dc));
    // }

    // // Called when this View is brought to the foreground. Restore
    // // the state of this View and prepare it to be shown. This includes
    // // loading resources into memory.
    // function onShow() as Void {
    // }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var selectedLine = Storage.getValue("selectedLine");
        var schedule = LineMapper.getSchedule(today.day_of_week, selectedLine);
        var nowString = today.hour.toString() + ":" + today.min.toString();
        var end0 = BusTime.findNextTime(schedule[0], nowString);
        var end1 = BusTime.findNextTime(schedule[1], nowString);

        var ends = LineMapper.LineEnds[selectedLine];
        var lineName = LineMapper.LineName[selectedLine];

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        
        var glanceNumberHeight = dc.getFontHeight(Graphics.FONT_GLANCE_NUMBER);
        var textFontHeight = dc.getFontHeight(Graphics.FONT_SYSTEM_XTINY);
        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();

        dc.drawText(dcWidth / 2, dcHeight * 0.58, Graphics.FONT_SYSTEM_XTINY, lineName, Graphics.TEXT_JUSTIFY_CENTER);

        dc.drawText(0, dcHeight - glanceNumberHeight, Graphics.FONT_GLANCE_NUMBER, end0, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(dcWidth, dcHeight - glanceNumberHeight, Graphics.FONT_GLANCE_NUMBER, end1, Graphics.TEXT_JUSTIFY_RIGHT);

        dc.drawText(0, 0, Graphics.FONT_SYSTEM_XTINY, ends[0], Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(dcWidth, 0, Graphics.FONT_SYSTEM_XTINY, ends[1], Graphics.TEXT_JUSTIFY_RIGHT);
    }

    // // Called when this View is removed from the screen. Save the
    // // state of this View here. This includes freeing resources from
    // // memory.
    // function onHide() as Void {
    // }
}
