import 'package:my_fest/utils/object.dart';

class Product extends MyObject {
  late String name;
  late String unitOfMeasurement;
  late double amountPerPerson;

  Product(
      {int? id,
      required this.name,
      required this.unitOfMeasurement,
      required this.amountPerPerson})
      : super.fromJson({}) {
    this.id = id;
  }

  Product.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    unitOfMeasurement = json['unitOfMeasurement'];
    amountPerPerson = json['amountPerPerson'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'unitOfMeasurement': unitOfMeasurement,
      'amountPerPerson': amountPerPerson,
    };
  }
}
