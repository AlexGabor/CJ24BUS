import Toybox.Lang;


(:glance)
class LineMapper {
    static var LineName as Dictionary<String, String> = {
        "linia_1" => "Linia 1",
        "linia_2" => "Linia 2",
        "linia_3" => "Linia 3",
        "linia_4" => "Linia 4",
        "linia_5" => "Linia 5",
        "linia_6" => "Linia 6",
    } as Dictionary<String, String>;

    static var LineEnds as Dictionary<String, [ String, String ]> = {
        "linia_1" => [ "Start 1", "End 1"],
        "linia_2" => [ "Start 2", "End 2"],
        "linia_3" => [ "Start 3", "End 3"],
        "linia_4" => [ "Start 4", "End 4"],
        "linia_5" => [ "Start 5", "End 5"],
        "linia_6" => [ "Start 6", "End 6"],
    } as Dictionary<String, [ String, String ]>;

    static var LineScheduleWeek as Dictionary<String, [ Array<String>, Array<String> ]> = {
        "linia_1" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_2" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_3" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_4" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_5" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_6" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
    } as Dictionary<String, [ Array<String>, Array<String> ]>;

    static var LineScheduleSaturday as Dictionary<String, [ Array<String>, Array<String> ]> = {
        "linia_1" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_2" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_3" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_4" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_5" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_6" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
    } as Dictionary<String, [ Array<String>, Array<String> ]>;

    static var LineScheduleSunday as Dictionary<String, [ Array<String>, Array<String> ]> = {
        "linia_1" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_2" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_3" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_4" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_5" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
        "linia_6" => [ ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",], ["8:02","8:05","8:12","8:22","8:42","9:02","10:02","12:02","13:02","14:02","15:02","17:02","18:02","19:02","21:02","22:02","23:02",]],
    } as Dictionary<String, [ Array<String>, Array<String> ]>;

    static function getSchedule(dayOfWeek as String, selectedLine as String) {
        if(dayOfWeek == "Sat") {
            return LineScheduleSaturday[selectedLine];
        }
        if(dayOfWeek == "Sun") {
            return LineScheduleSunday[selectedLine];
        }
        return LineScheduleWeek[selectedLine];
    }
}