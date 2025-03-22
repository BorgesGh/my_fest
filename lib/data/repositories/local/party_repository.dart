import 'package:my_fest/data/services/local/dao/party_dao.dart';
import 'package:my_fest/model/party.dart';
import 'package:my_fest/utils/result.dart';

class PartyRepository {
  final PartyDao _partyDao = PartyDao();

  Future<Result<List<Party>>> getParties() async {
    try {
      return Result(content: await _partyDao.getAll());
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> saveParty(Party party) async {
    try {
      await _partyDao.insert(party);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> updateParty(Party party) async {
    try {
      await _partyDao.update(party);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }

  Future<Result<void>> deleteParty(Party party) async {
    try {
      await _partyDao.delete(party);
      return Result(content: null);
    } catch (e) {
      return Result.error(error: e.toString());
    }
  }
}
