import 'package:equatable/equatable.dart';

abstract class FormProductEvent extends Equatable {
  const FormProductEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends FormProductEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class UnitChanged extends FormProductEvent {
  final String unit;

  const UnitChanged(this.unit);

  @override
  List<Object> get props => [unit];
}

class QuantityChanged extends FormProductEvent {
  final String quantity;

  const QuantityChanged(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class SubmitProduct extends FormProductEvent {
  final String name;
  final String unit;
  final String quantity;
  final bool isValid;

  const SubmitProduct({
    this.name = '',
    this.unit = '',
    this.quantity = '',
    this.isValid = false,
  });
}
