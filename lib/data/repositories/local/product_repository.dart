import 'package:my_fest/data/persistence/local/dao/product_dao.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/utils/result.dart';

class ProductRepository {
  final ProductDao _productDao = ProductDao();

  Future<Result<List<Product>>> getProducts() async {
    try {
      return Result(content: await _productDao.getAll());
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> saveProduct(Product product) async {
    try {
      await _productDao.insert(product);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> updateProduct(Product product) async {
    try {
      await _productDao.update(product);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> deleteProduct(Product product) async {
    try {
      await _productDao.delete(product);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }
}
