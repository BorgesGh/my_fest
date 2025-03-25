abstract class MyObject {
  int? id;

  MyObject({int? id});

  Map<String, dynamic> toJson();
  MyObject.fromJson(Map<String, dynamic> json) : id = json['id'];
}
