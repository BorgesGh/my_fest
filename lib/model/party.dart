import 'package:my_fest/utils/object.dart';

class Party extends MyObject {
  late String name;
  late DateTime date;
  late int numberOfPeople;

  Party({required this.name, required this.date, required this.numberOfPeople});

  Party.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    date = DateTime.parse(json['date']);
    numberOfPeople = json['numberOfPeople'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date.toIso8601String(),
      'numberOfPeople': numberOfPeople,
    };
  }
}
