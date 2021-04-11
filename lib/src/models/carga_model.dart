import 'package:itlstatusb/src/models/schedule_model.dart';

import 'schedule_model.dart';
import 'subject_model.dart';

class Carga {
  final String id;
  final List<String> students;
  final String group;
  final Subject subject;
  final String professor;
  final ScheduleWeek schedule;

  ScheduleDay getTodaySchedule() {
    int dayOfWeek = DateTime.now().day;
    return schedule.getFromDayOfWeekNumber(dayOfWeek);
  }

  Carga(
      {this.id,
      this.students,
      this.group,
      this.subject,
      this.professor,
      this.schedule});

  Carga.fromData(Map<String, dynamic> data)
      : id = data['_id'] ?? '',
        students = (data['students'] as List)
                ?.map((studentId) => studentId as String)
                ?.toList() ??
            [''],
        group = data['group'] ?? '',
        professor = data['professor'] ?? '',
        subject = Subject.fromData(data['subject']),
        schedule = ScheduleWeek.fromData(data['schedule']);

  Carga.fromJson(dynamic data)
      : id = data['_id'] ?? '',
        students = data['students'] ?? [''],
        group = data['group'] ?? '',
        professor = data['professor'] ?? '',
        subject = Subject.fromData(data['subject']),
        schedule = ScheduleWeek.fromData(data['schedule']);


  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "students": students.join(),
      "group": group,
      "professor": professor,
      "subject": subject.toJson().toString(),
      "schedule": schedule.toJson().toString()
    };
  }
}
