import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitRoutineDao extends DatabaseAccessor<Db> {
  BroFa2VisitRoutineDao(Db db) : super(db);

  $BroFa2VisitRoutineTbTable get broFa2VisitRoutineTb => attachedDatabase.broFa2VisitRoutineTb;

  $BroFa2VisitRoutineImgTbTable get broFa2VisitRoutineImgTb =>
      attachedDatabase.broFa2VisitRoutineImgTb;

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

  Stream<List<BroFa2VisitRoutineWithData>> watchAllByVisitId(int visitId) {
    return customSelect(
      """
      SELECT 
        bro_fa2_visit_routine.*,
        COUNT(bro_fa2_visit_routine_img.id) AS imgCount
      FROM bro_fa2_visit_routine
      LEFT JOIN bro_fa2_visit_routine_img
        ON bro_fa2_visit_routine_img.bro_fa2_visit_routine_id = bro_fa2_visit_routine.id
      WHERE bro_fa2_visit_routine.bro_fa2_visit_id = $visitId
      GROUP BY bro_fa2_visit_routine.id
      """,
      readsFrom: {broFa2VisitRoutineTb, broFa2VisitRoutineImgTb},
    ).watch().map((r) {
      return r
          .map((r2) => BroFa2VisitRoutineWithData(
        broFa2VisitRoutine: BroFa2VisitRoutine.fromData(r2.data, this.attachedDatabase),
        imgCount: r2.read("imgCount"),
      ))
          .toList();
    });
  }
}


class BroFa2VisitRoutineWithData {
  final BroFa2VisitRoutine broFa2VisitRoutine;
  final int imgCount;

  BroFa2VisitRoutineWithData({
    required this.broFa2VisitRoutine,
    required this.imgCount,
  });
}
