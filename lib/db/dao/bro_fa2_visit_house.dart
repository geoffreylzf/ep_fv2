import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitHouseDao extends DatabaseAccessor<Db> {
  BroFa2VisitHouseDao(Db db) : super(db);

  $BroFa2VisitHouseTbTable get broFa2VisitHouseTb => attachedDatabase.broFa2VisitHouseTb;

  Future<int> insert(BroFa2VisitHouseTbCompanion entry) {
    return into(broFa2VisitHouseTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitHouse entry) {
    return update(broFa2VisitHouseTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitHouseTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllByBroFa2VisitId(int broFa2VisitId) async {
    return await (delete(broFa2VisitHouseTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(broFa2VisitId)))
        .go();
  }

  Future<List<BroFa2VisitHouse>> getAllByBroFa2VisitId(int broFa2VisitId) {
    return (select(broFa2VisitHouseTb)..where((tbl) => tbl.broFa2VisitId.equals(broFa2VisitId)))
        .get();
  }
}
