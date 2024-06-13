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
    var showingSchedule = true;
    
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
        if (showingSchedule) {
            drawSchedule(dc);
        } else {
            drawPayment(dc);
        }
    }

    function drawSchedule(dc as Dc) {
        var selectedLine = Storage.getValue("selectedLine");
        var schedule = LineMapper.getSchedule(today.day_of_week, selectedLine);

        var newLine = lineMapper.LineName[selectedLine];
        if (newLine != mLine) {
            mLine = lineMapper.LineName[selectedLine];
            mScrollOffset = 0;
        }
        var ends = lineMapper.LineEnds[selectedLine];

        var nowString = today.hour.toString() + ":" + today.min.toString();
        // var nowString = "05:30";
        var nowMin = BusTime.stringTimeToMinutes(nowString);

        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();
        var textStartHeight = 10; 
        var textFontHeight = dc.getFontHeight(Graphics.FONT_SYSTEM_SMALL);
        var lineTextOffset = 5;


        for(var index = 0; index < schedule[0].size(); index++) {
            var end0 = schedule[0][index];
            var end1 = schedule[1][index];
            var end0Min = BusTime.stringTimeToMinutes(end0);
            var end1Min = BusTime.stringTimeToMinutes(end1);
            if (end0Min < nowMin) {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            }
            dc.drawText(dcWidth / 2 - lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight * (index + 2), Graphics.FONT_SYSTEM_SMALL, schedule[0][index], Graphics.TEXT_JUSTIFY_RIGHT);

            if (end1Min < nowMin) {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            }
            dc.drawText(dcWidth / 2 + lineTextOffset, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight * (index + 2), Graphics.FONT_SYSTEM_SMALL, schedule[1][index], Graphics.TEXT_JUSTIFY_LEFT);
        }

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.fillRectangle(0, 0, dcWidth, textFontHeight * 2);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        dc.drawText(dcWidth / 2, max(0, textStartHeight + mScrollOffset + mScrollDelta), Graphics.FONT_SYSTEM_SMALL, mLine, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dcWidth / 2 - lineTextOffset, max(textFontHeight, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight), Graphics.FONT_SYSTEM_SMALL, ends[0], Graphics.TEXT_JUSTIFY_RIGHT);
        dc.drawText(dcWidth / 2 + lineTextOffset, max(textFontHeight, textStartHeight + mScrollOffset + mScrollDelta + textFontHeight), Graphics.FONT_SYSTEM_SMALL, ends[1], Graphics.TEXT_JUSTIFY_LEFT);
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

    function onStartPressed() {
        showingSchedule = false;
        requestUpdate();
    }


    function onBack() {
        showingSchedule = true;
        requestUpdate();
    }

    function drawPayment(dc as Dc) {
        var textFontHeight = dc.getFontHeight(Graphics.FONT_SYSTEM_SMALL);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();
        dc.drawText(dcWidth / 2, dcHeight / 2 - textFontHeight / 2, Graphics.FONT_SYSTEM_SMALL, "Press Start to Buy", Graphics.TEXT_JUSTIFY_CENTER);
        requestUpdate();
    }

}
