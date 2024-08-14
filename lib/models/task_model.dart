// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;
  String userId;
  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      this.isDone = false,
      required this.date,
      required this.userId});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            userId: json['userId'],
            title: json['title'],
            description: json['description'],
            date: json['date'],
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'userId': userId
    };
  }
}
