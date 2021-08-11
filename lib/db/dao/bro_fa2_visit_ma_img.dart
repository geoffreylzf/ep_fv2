import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitMaImgDao extends DatabaseAccessor<Db> {
  BroFa2VisitMaImgDao(Db db) : super(db);

  $BroFa2VisitTbTable get broFa2VisitTb => attachedDatabase.broFa2VisitTb;

  $BroFa2VisitMaTbTable get broFa2VisitMaTb => attachedDatabase.broFa2VisitMaTb;

  $BroFa2VisitMaImgTbTable get broFa2VisitMaImgTb => attachedDatabase.broFa2VisitMaImgTb;

  Future<int> insert(BroFa2VisitMaImgTbCompanion entry) {
    return into(broFa2VisitMaImgTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitMaImg entry) {
    return update(broFa2VisitMaImgTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitMaImgTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<BroFa2VisitMaImg> getById(int id) {
    return (select(broFa2VisitMaImgTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<BroFa2VisitMaImg>> getAllByVisitMaId(int vmId) async {
    return (select(broFa2VisitMaImgTb)..where((tbl) => tbl.broFa2VisitMaId.equals(vmId))).get();
  }

  Stream<List<BroFa2VisitMaImg>> watchAllByVisitMaId(int vmId) {
    return (select(broFa2VisitMaImgTb)..where((tbl) => tbl.broFa2VisitMaId.equals(vmId))).watch();
  }

  Future<List<BroFa2VisitMaImg>> getAllWithoutServerIdByVisit(List<int> visitIdList) async {
    final res = await (select(broFa2VisitMaImgTb).join([
      innerJoin(broFa2VisitMaTb, broFa2VisitMaTb.id.equalsExp(broFa2VisitMaImgTb.broFa2VisitMaId)),
      innerJoin(broFa2VisitTb, broFa2VisitTb.id.equalsExp(broFa2VisitMaTb.broFa2VisitId)),
    ])
          ..where(broFa2VisitTb.id.isIn(visitIdList) & broFa2VisitMaImgTb.serverId.isNull()))
        .get();
    return res.map((r) => r.readTable(broFa2VisitMaImgTb)).toList();
  }
}
