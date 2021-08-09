import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitWeightDao extends DatabaseAccessor<Db> {
  BroFa2VisitWeightDao(Db db) : super(db);

  $BroFa2VisitWeightTbTable get broFa2VisitWeightTb => attachedDatabase.broFa2VisitWeightTb;

  Future<int> insert(BroFa2VisitWeightTbCompanion entry) {
    return into(broFa2VisitWeightTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitWeight entry) {
    return update(broFa2VisitWeightTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitWeightTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<BroFa2VisitWeight>> getAllByVisitId(int visitId) {
    return (select(broFa2VisitWeightTb)..where((tbl) => tbl.broFa2VisitId.equals(visitId))).get();
  }

  Stream<List<BroFa2VisitWeight>> watchAllByVisitId(int visitId, {orderBy: OrderingMode.asc}) {
    return (select(broFa2VisitWeightTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId))
          ..orderBy([(t) => OrderingTerm(expression: t.id, mode: orderBy)]))
        .watch();
  }
}
