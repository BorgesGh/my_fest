import 'package:my_fest/model/party.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/utils/object.dart';

class ProductParty extends MyObject {
  late Party party;
  late List<Product> products;
  late bool buyed;

  ProductParty(
      {required this.party, required this.products, required this.buyed})
      : super.fromJson({});

  ProductParty.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    party = Party.fromJson(json['party']);
    products =
        List<Product>.from(json['products'].map((x) => Product.fromJson(x)));
    buyed = json['buyed'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'party': party.toJson(),
      'products': List<dynamic>.from(products.map((x) => x.toJson())),
      'buyed': buyed,
    };
  }
}
