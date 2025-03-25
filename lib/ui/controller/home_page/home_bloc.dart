import 'package:bloc/bloc.dart';
import 'package:my_fest/data/repositories/local/party_repository.dart';
import 'package:my_fest/model/party.dart';
import 'package:my_fest/utils/result.dart';

class HomeCubit extends Cubit<Result<List<Party>>> {
  final PartyRepository _partyRepository = PartyRepository();

  HomeCubit() : super(Result(content: [])) {
    getParties();
  }

  void getParties() async {
    final response = await _partyRepository.getParties();
    emit(response);
  }

  void addParty(Party party) async {
    final response = await _partyRepository.saveParty(party);
    if (response.success) {
      getParties(); // Atualiza a lista após adicionar
    } else {
      emit(Result.error(error: response.error));
    }
  }

  void updateParty(Party party) async {
    final response = await _partyRepository.updateParty(party);
    if (response.success) {
      getParties(); // Atualiza a lista após editar
    } else {
      emit(Result.error(error: response.error));
    }
  }

  void deleteParty(Party party) async {
    final response = await _partyRepository.deleteParty(party);
    if (response.success) {
      getParties(); // Atualiza a lista após deletar
    } else {
      emit(Result.error(error: response.error));
    }
  }
}
