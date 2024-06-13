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
}