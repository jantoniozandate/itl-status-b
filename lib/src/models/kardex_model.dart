import 'user.dart';
import './subject_model.dart';

class Kardex {
  final String id;
  final Subject subject;
  final double grade;
  final String date;
  final int semester;
  final String userId;

  Kardex(
      {this.id,
      this.subject,
      this.grade,
      this.date,
      this.semester,
      this.userId});

  Kardex.fromData(Map<String, dynamic> data)
      : id = data['_id'] ?? '',
        subject = Subject.fromData(data['subject']),
        grade = (data['grade'] as int)?.toDouble() ?? 0,
        date = data['date'] ?? '',
        semester = data['semester'] ?? 0,
        userId = data['user'] ?? '';

  Kardex.fromJson(dynamic data)
      : id = data['_id'] ?? '',
        subject = Subject.fromData(data['subject']),
        grade = data['grade'] ?? '',
        date = data['date'] ?? '',
        semester = data['semester'] ?? '',
        userId = data['user'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "subject": subject.toJson(),
      "grade": grade,
      "date": date,
      "semester": semester,
      "user": userId
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
