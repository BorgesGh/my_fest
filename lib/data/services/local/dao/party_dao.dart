import 'package:my_fest/data/services/local/dao/generic_dao.dart';
import 'package:my_fest/model/party.dart';

class PartyDao extends GenericDao<Party> {
  PartyDao() : super('party');

  @override
  Party fromJson(Map<String, dynamic> map) {
    return Party.fromJson(map);
  }
}
