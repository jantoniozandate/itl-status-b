class Subject {
  final String id;
  final String name;
  final String key;

  Subject({this.id, this.name, this.key});

  Subject.fromData(Map<String, dynamic> data)
      : id = data['_id'] ?? '',
        name = data['name'] ?? '',
        key = data['key'] ?? '';

  Subject.fromJson(dynamic data)
      : id = data['_id'] ?? '',
        name = data['name'] ?? '',
        key = data['key'] ?? '';
  
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "key": key
    };
  }
}
