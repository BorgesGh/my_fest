abstract class MyObject {
  int? id;

  MyObject();

  Map<String, dynamic> toJson();
  MyObject.fromJson(Map<String, dynamic> json) : id = json['id'];
}
