import 'package:my_fest/data/services/local/dao/generic_dao.dart';
import 'package:my_fest/model/product_party.dart';

class ProductPartyDao extends GenericDao<ProductParty> {
  ProductPartyDao() : super('product_party');

  @override
  ProductParty fromJson(Map<String, dynamic> map) {
    return ProductParty.fromJson(map);
  }
}
