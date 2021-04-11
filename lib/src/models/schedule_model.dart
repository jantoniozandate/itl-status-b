class ScheduleWeek {
  final ScheduleDay monday, tuesday, wednesday, thursday, friday;

  ScheduleDay getFromDayOfWeekNumber(int dayOfWeekNumber) {
    var dayOfWeekDictionary = {
      1: monday,
      2: tuesday,
      3: wednesday,
      4: thursday,
      5: friday
    };
    return dayOfWeekDictionary[dayOfWeekNumber] ?? monday;
  }

  ScheduleWeek(
      this.monday, this.tuesday, this.wednesday, this.thursday, this.friday);

  ScheduleWeek.fromData(Map<String, dynamic> data)
      : monday = ScheduleDay.fromData(data['1']),
        tuesday = ScheduleDay.fromData(data['2']),
        wednesday = ScheduleDay.fromData(data['3']),
        thursday = ScheduleDay.fromData(data['4']),
        friday = ScheduleDay.fromData(data['5']);

  ScheduleWeek.fromJson(dynamic data)
      : monday = ScheduleDay.fromData(data['1']),
        tuesday = ScheduleDay.fromData(data['2']),
        wednesday = ScheduleDay.fromData(data['3']),
        thursday = ScheduleDay.fromData(data['4']),
        friday = ScheduleDay.fromData(data['5']);

  Map<String, dynamic> toJson() {
    return {
      "1": monday.toJson(),
      "2": tuesday.toJson(),
      "3": wednesday.toJson(),
      "4": thursday.toJson(),
      "5": friday.toJson()
    };
  }
}

class ScheduleDay {
  final String from;
  final String to;
  final String room;

  ScheduleDay({this.from, this.to, this.room});

  ScheduleDay.fromData(Map<String, dynamic> data)
      : from = data['from'] ?? '',
        to = data['to'] ?? '',
        room = data['room'] ?? '';

  Map<String, dynamic> toJson() {
    return {"from": from, "to": to, "room": room};
  }
}
