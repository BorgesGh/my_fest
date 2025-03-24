import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_fest/ui/controller/events/form_product_event.dart';
import 'package:my_fest/ui/controller/states/form_product_state.dart';

class FormProductBloc extends Bloc<FormProductEvent, FormProductState> {
  FormProductBloc() : super(const FormProductState()) {
    on<NameChanged>((event, emit) {
      final error = _validateName(event.name);
      print(error);
      emit(state.copyWith(
        name: event.name,
        nameError: error,
        isValid: _isFormValid(event.name, state.unit, state.quantity),
      ));
    });

    on<UnitChanged>((event, emit) {
      final error = _validateUnit(event.unit);
      emit(state.copyWith(
        unit: event.unit,
        unitError: error,
        isValid: _isFormValid(state.name, event.unit, state.quantity),
      ));
    });

    on<QuantityChanged>((event, emit) {
      final error = _validateQuantity(event.quantity);
      emit(state.copyWith(
        quantity: event.quantity,
        quantityError: error,
        isValid: _isFormValid(state.name, state.unit, event.quantity),
      ));
    });

    on<SubmitProduct>((event, emit) {
      emit(state.copyWith(
          isValid: _isFormValid(state.name, state.unit, state.quantity)));
    });
  }

  bool _isFormValid(String name, String unit, String quantity) {
    return _validateName(name) == null &&
        _validateUnit(unit) == null &&
        _validateQuantity(quantity) == null;
  }

  String? _validateName(String name) {
    return name.isEmpty ? 'Nome não pode estar vazio' : null;
  }

  String? _validateUnit(String unit) {
    return unit.isEmpty ? 'Unidade de medida obrigatória' : null;
  }

  String? _validateQuantity(String quantity) {
    if (quantity.isEmpty) {
      return 'Quantidade é obrigatória';
    }
    if (int.tryParse(quantity) == null) {
      return 'Deve ser um número válido';
    }
    return null;
  }
}
