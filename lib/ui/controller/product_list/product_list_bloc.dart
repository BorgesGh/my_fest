import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_fest/data/repositories/local/product_repository.dart';
import 'package:my_fest/ui/controller/product_list/product_list_event.dart';
import 'package:my_fest/ui/controller/product_list/product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository = ProductRepository();

  ProductListBloc() : super(const ProductListInitial()) {
    on<ProductListLoad>(_loadProductList);
  }

  _loadProductList(
      ProductListLoad event, Emitter<ProductListState> emit) async {
    emit(const ProductListLoading());
    final response = await _productRepository.getProducts();

    if (response.success) {
      emit(ProductListLoaded(response.content!));
    } else {
      emit(ProductListError(response));
    }
  }
}
