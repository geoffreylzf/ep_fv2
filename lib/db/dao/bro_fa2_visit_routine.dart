import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitRoutineDao extends DatabaseAccessor<Db> {
  BroFa2VisitRoutineDao(Db db) : super(db);

  $BroFa2VisitRoutineTbTable get broFa2VisitRoutineTb => attachedDatabase.broFa2VisitRoutineTb;

  Future<int> insert(BroFa2VisitRoutineTbCompanion entry) {
    return into(broFa2VisitRoutineTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitRoutine entry) {
    return update(broFa2VisitRoutineTb).replace(entry);
  }

  Future<BroFa2VisitRoutine?> getByVisitIdRoutineId(int visitId, int rId) {
    return (select(broFa2VisitRoutineTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.broFa2RoutineId.equals(rId)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitRoutine>> watchAllByVisitId(int visitId) {
    return (select(broFa2VisitRoutineTb)..where((tbl) => tbl.broFa2VisitId.equals(visitId)))
        .watch();
  }
}
