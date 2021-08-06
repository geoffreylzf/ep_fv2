import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitDoDao extends DatabaseAccessor<Db> {
  BroFa2VisitDoDao(Db db) : super(db);

  $BroFa2VisitDoTbTable get broFa2VisitDoTb => attachedDatabase.broFa2VisitDoTb;

  Future<int> insert(BroFa2VisitDoTbCompanion entry) {
    return into(broFa2VisitDoTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitDo entry) {
    return update(broFa2VisitDoTb).replace(entry);
  }

  Future<BroFa2VisitDo?> getByVisitIdDoId(int visitId, int doId) {
    return (select(broFa2VisitDoTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.broFa2DoId.equals(doId)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitDo>> watchAllByVisitId(int visitId) {
    return (select(broFa2VisitDoTb)..where((tbl) => tbl.broFa2VisitId.equals(visitId))).watch();
  }
}
