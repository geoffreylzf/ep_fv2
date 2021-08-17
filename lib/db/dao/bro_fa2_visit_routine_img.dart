import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitRoutineImgDao extends DatabaseAccessor<Db> {
  BroFa2VisitRoutineImgDao(Db db) : super(db);

  $BroFa2VisitTbTable get broFa2VisitTb => attachedDatabase.broFa2VisitTb;

  $BroFa2VisitRoutineTbTable get broFa2VisitRoutineTb => attachedDatabase.broFa2VisitRoutineTb;

  $BroFa2VisitRoutineImgTbTable get broFa2VisitRoutineImgTb =>
      attachedDatabase.broFa2VisitRoutineImgTb;

  Future<int> insert(BroFa2VisitRoutineImgTbCompanion entry) {
    return into(broFa2VisitRoutineImgTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitRoutineImg entry) {
    return update(broFa2VisitRoutineImgTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitRoutineImgTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<BroFa2VisitRoutineImg> getById(int id) {
    return (select(broFa2VisitRoutineImgTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<BroFa2VisitRoutineImg>> getAllByVisitRoutineId(int vfId) async {
    return (select(broFa2VisitRoutineImgTb)..where((tbl) => tbl.broFa2VisitRoutineId.equals(vfId)))
        .get();
  }

  Stream<List<BroFa2VisitRoutineImg>> watchAllByVisitRoutineId(int vfId) {
    return (select(broFa2VisitRoutineImgTb)..where((tbl) => tbl.broFa2VisitRoutineId.equals(vfId)))
        .watch();
  }

  Future<List<BroFa2VisitRoutineImg>> getAllWithoutServerIdByVisit(List<int> visitIdList) async {
    final res = await (select(broFa2VisitRoutineImgTb).join([
      innerJoin(broFa2VisitRoutineTb,
          broFa2VisitRoutineTb.id.equalsExp(broFa2VisitRoutineImgTb.broFa2VisitRoutineId)),
      innerJoin(broFa2VisitTb, broFa2VisitTb.id.equalsExp(broFa2VisitRoutineTb.broFa2VisitId)),
    ])
          ..where(broFa2VisitTb.id.isIn(visitIdList) & broFa2VisitRoutineImgTb.serverId.isNull()))
        .get();
    return res.map((r) => r.readTable(broFa2VisitRoutineImgTb)).toList();
  }
}
