import 'package:my_fest/data/repositories/local/dao/generic_dao.dart';
import 'package:my_fest/model/product.dart';

class ProductDao extends GenericDao<Product> {
  ProductDao() : super('product');

  @override
  Product fromJson(Map<String, dynamic> map) {
    return Product.fromJson(map);
  }
}
