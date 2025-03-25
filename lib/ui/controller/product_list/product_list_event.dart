import 'package:equatable/equatable.dart';

import '../../../model/product.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListLoad extends ProductListEvent {
  const ProductListLoad();

  @override
  List<Object> get props => [];
}

class ProductListDelete extends ProductListEvent {
  final Product product;

  const ProductListDelete(this.product);

  @override
  List<Object> get props => [product];
}
