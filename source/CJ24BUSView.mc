import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application.Storage;
import Toybox.Time.Gregorian;
import Toybox.Time;

class CJ24BUSView extends WatchUi.View {

    var mScrollOffset = 0;
    var mScrollDelta = 0;
    var mLine = "No lines selected. Hold down menu button to choose a line.";
    var lineMapper = new LineMapper();
    var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);

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

        var selectedLine = Storage.getValue("selectedLine");

        mLine = lineMapper.LineName[selectedLine];
        var ends = lineMapper.LineEnds[selectedLine];
        var schedule = getSchedule(selectedLine);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();
        var textStartHeight = 10; 
        var textFontHeight = dc.getFontHeight(Graphics.FONT_SYSTEM_SMALL);
        var lineTextOffset = 5;

        dc.drawText(dcWidth / 2, textStartHeight + mScrollOffset + mScrollDelta, Graphics.FONT_SYSTEM_SMALL, mLine, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dcWidth / 2 - lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight, Graphics.FONT_SYSTEM_SMALL, ends[0], Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(dcWidth / 2 + lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight, Graphics.FONT_SYSTEM_SMALL, ends[1], Graphics.TEXT_JUSTIFY_LEFT);

        for(var index = 0; index < schedule[0].size(); index++) {
            dc.drawText(dcWidth / 2 - lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight * (index + 2), Graphics.FONT_SYSTEM_SMALL, schedule[0][index], Graphics.TEXT_JUSTIFY_RIGHT);
            dc.drawText(dcWidth / 2 + lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight * (index + 2), Graphics.FONT_SYSTEM_SMALL, schedule[1][index], Graphics.TEXT_JUSTIFY_LEFT);
        }
    }

    function getSchedule(selectedLine as String) {
        var dayOfWeek = today.day_of_week;
        if(dayOfWeek == "Sat") {
            return lineMapper.LineScheduleSaturday[selectedLine];
        }
        if(dayOfWeek == "Sun") {
            return lineMapper.LineScheduleSunday[selectedLine];
        }
        return lineMapper.LineScheduleWeek[selectedLine];
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function scrollUp(){
        mScrollOffset -= 5;
        requestUpdate();
    }


    function scrollDown(){
        mScrollOffset += 5;
        requestUpdate();
    }

    function onDeltaChange(offset as Number) {
        mScrollDelta = offset;
        requestUpdate();
    }

    function onStopScroll() {
        mScrollOffset += mScrollDelta;
        mScrollDelta = 0;
        requestUpdate();
    } 

}
