import 'package:equatable/equatable.dart';
import 'package:my_fest/utils/result.dart';

abstract class FormProductState extends Equatable {
  final bool? edit;

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
    this.edit,
  });

  FormProductState copyWith({
    String? name,
    String? unit,
    String? quantity,
    bool? isValid,
    String? quantityError,
    String? unitError,
    String? nameError,
  });

  @override
  List<Object?> get props =>
      [name, unit, quantity, isValid, quantityError, unitError, nameError];
}

class InitFormProductState extends FormProductState {
  const InitFormProductState({
    super.name,
    super.unit,
    super.quantity,
    super.isValid,
    super.quantityError,
    super.unitError,
    super.nameError,
  });

  @override
  FormProductState copyWith({
    String? name,
    String? unit,
    String? quantity,
    bool? isValid,
    String? quantityError,
    String? unitError,
    String? nameError,
  }) {
    return InitFormProductState(
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      isValid: isValid ?? this.isValid,
      quantityError: quantityError,
      unitError: unitError,
      nameError: nameError,
    );
  }
}

class SubmitFormProductState extends FormProductState {
  const SubmitFormProductState({
    super.name,
    super.unit,
    super.quantity,
    super.isValid,
    super.quantityError,
    super.unitError,
    super.nameError,
  });

  @override
  FormProductState copyWith({
    String? name,
    String? unit,
    String? quantity,
    bool? isValid,
    String? quantityError,
    String? unitError,
    String? nameError,
  }) {
    return SubmitFormProductState(
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      isValid: isValid ?? this.isValid,
      quantityError: quantityError ?? this.quantityError,
      unitError: unitError ?? this.unitError,
      nameError: nameError ?? this.nameError,
    );
  }
}

class SuccessFormProductState extends FormProductState {
  final Result result;

  const SuccessFormProductState({
    required this.result,
    super.name,
    super.unit,
    super.quantity,
    super.isValid = true,
  });

  @override
  FormProductState copyWith(
      {String? name,
      String? unit,
      String? quantity,
      bool? isValid,
      String? quantityError,
      String? unitError,
      String? nameError}) {
    return SuccessFormProductState(
      result: result,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [result, name, unit, quantity];
}

class ErrorFormProductState extends FormProductState {
  final Result result;

  const ErrorFormProductState({
    required this.result,
    super.name,
    super.unit,
    super.quantity,
    super.isValid,
    super.quantityError,
    super.unitError,
    super.nameError,
  });

  @override
  FormProductState copyWith(
      {String? name,
      String? unit,
      String? quantity,
      bool? isValid,
      String? quantityError,
      String? unitError,
      String? nameError}) {
    return ErrorFormProductState(
      result: result,
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
  List<Object?> get props => [result, name, unit, quantity];
}
