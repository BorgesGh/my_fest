import 'package:equatable/equatable.dart';

class FormProductState extends Equatable {
  final String name;
  final String unit;
  final String quantity;
  final bool isValid;

  final String? quantityError;
  final String? unitError;
  final String? nameError;

  const FormProductState({
    this.name = '',
    this.unit = '',
    this.quantity = '',
    this.isValid = false,
    this.quantityError,
    this.unitError,
    this.nameError,
  });

  FormProductState copyWith({
    String? name,
    String? unit,
    String? quantity,
    bool? isValid,
    String? quantityError,
    String? unitError,
    String? nameError,
  }) {
    return FormProductState(
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      isValid: isValid ?? this.isValid,
      quantityError: quantityError ?? this.quantityError,
      unitError: unitError ?? this.unitError,
      nameError: nameError ?? this.nameError,
    );
  }

  @override
  List<Object?> get props =>
      [name, unit, quantity, isValid, quantityError, unitError, nameError];
}
