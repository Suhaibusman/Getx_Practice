
class TodoModel {
  String? title;
  String? time;
  String? id;

  TodoModel({this.title, this.time, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    time = json["time"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["time"] = time;
    _data["id"] = id;
    return _data;
  }
}