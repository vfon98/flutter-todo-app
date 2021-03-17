class Todo {
  String id;
  String title;
  String time;
  String description;
  int createdAt;

  Todo({this.id, this.title, this.time, this.description, this.createdAt});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        description: json['description'],
        createdAt: json['createdAt']);
  }
}
