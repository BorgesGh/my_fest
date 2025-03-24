import 'package:equatable/equatable.dart';

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
