import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitPasgarDao extends DatabaseAccessor<Db> {
  BroFa2VisitPasgarDao(Db db) : super(db);

  $BroFa2VisitPasgarTbTable get broFa2VisitPasgarTb => attachedDatabase.broFa2VisitPasgarTb;

  Future<int> insert(BroFa2VisitPasgarTbCompanion entry) {
    return into(broFa2VisitPasgarTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitPasgar entry) {
    return update(broFa2VisitPasgarTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitPasgarTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int?> getMaxOrderByFaDocId(int visitId) {
    final maxOrder = broFa2VisitPasgarTb.order.max();
    final q = selectOnly(broFa2VisitPasgarTb)
      ..addColumns([maxOrder])
      ..where(broFa2VisitPasgarTb.broFa2VisitId.equals(visitId));
    return q.map((row) => row.read(maxOrder)).getSingleOrNull();
  }

  Future<BroFa2VisitPasgar?> getByVisitIdOrder(int visitId, int order) {
    return (select(broFa2VisitPasgarTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.order.equals(order)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitPasgar>> watchAllByVisitId(int visitId) {
    return (select(broFa2VisitPasgarTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId))
          ..orderBy([(t) => OrderingTerm.asc(t.order)]))
        .watch();
  }
}
