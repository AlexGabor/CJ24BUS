import Toybox.Lang;
import Toybox.System;

(:glance)
class BusTime {

    static function stringTimeToMinutes(time as String) {
        var separatorIndex = time.find(":");
        var hour = time.substring(0, separatorIndex);
        var minute = time.substring(separatorIndex + 1, time.length());
        return hour.toNumber() * 60 + minute.toNumber();
    }

    static function findNextTime(schedule as Array<String>, now as String) {
        var nowInMinutes = stringTimeToMinutes(now);
        var time = schedule[0];
        for (var index = 0; index < schedule.size(); index++) {
            var current = stringTimeToMinutes(schedule[index]);
            if (current > nowInMinutes) {
                time = schedule[index];
                break;
            }
        }
        return time;
    }
}