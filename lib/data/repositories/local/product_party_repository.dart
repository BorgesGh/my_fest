import 'package:my_fest/data/services/local/dao/product_party_dao.dart';
import 'package:my_fest/model/product_party.dart';
import 'package:my_fest/utils/result.dart';

class ProductPartyRepository {
  final ProductPartyDao _productPartyDao = ProductPartyDao();

  Future<Result<List<ProductParty>>> getProductParties() async {
    try {
      return Result(content: await _productPartyDao.getAll());
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> saveProductParty(ProductParty productParty) async {
    try {
      await _productPartyDao.insert(productParty);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> updateProductParty(ProductParty productParty) async {
    try {
      await _productPartyDao.update(productParty);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> deleteProductParty(ProductParty productParty) async {
    try {
      await _productPartyDao.delete(productParty);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }
}
