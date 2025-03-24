import 'package:equatable/equatable.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/utils/result.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListInitial extends ProductListState {
  const ProductListInitial();

  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();

  @override
  List<Object> get props => [];
}

class ProductListLoaded extends ProductListState {
  final List<Product> productList;

  const ProductListLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductListError extends ProductListState {
  final Result error;

  const ProductListError(this.error);

  @override
  List<Object> get props => [error];
}
