import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitFoImgDao extends DatabaseAccessor<Db> {
  BroFa2VisitFoImgDao(Db db) : super(db);

  $BroFa2VisitTbTable get broFa2VisitTb => attachedDatabase.broFa2VisitTb;

  $BroFa2VisitFoTbTable get broFa2VisitFoTb => attachedDatabase.broFa2VisitFoTb;

  $BroFa2VisitFoImgTbTable get broFa2VisitFoImgTb => attachedDatabase.broFa2VisitFoImgTb;

  Future<int> insert(BroFa2VisitFoImgTbCompanion entry) {
    return into(broFa2VisitFoImgTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitFoImg entry) {
    return update(broFa2VisitFoImgTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitFoImgTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<BroFa2VisitFoImg> getById(int id) {
    return (select(broFa2VisitFoImgTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<BroFa2VisitFoImg>> getAllByVisitFoId(int vfId) async {
    return (select(broFa2VisitFoImgTb)..where((tbl) => tbl.broFa2VisitFoId.equals(vfId))).get();
  }

  Stream<List<BroFa2VisitFoImg>> watchAllByVisitFoId(int vfId) {
    return (select(broFa2VisitFoImgTb)..where((tbl) => tbl.broFa2VisitFoId.equals(vfId))).watch();
  }

  Future<List<BroFa2VisitFoImg>> getAllWithoutServerIdByVisit(List<int> visitIdList) async {
    final res = await (select(broFa2VisitFoImgTb).join([
      innerJoin(broFa2VisitFoTb, broFa2VisitFoTb.id.equalsExp(broFa2VisitFoImgTb.broFa2VisitFoId)),
      innerJoin(broFa2VisitTb, broFa2VisitTb.id.equalsExp(broFa2VisitFoTb.broFa2VisitId)),
    ])
          ..where(broFa2VisitTb.id.isIn(visitIdList) & broFa2VisitFoImgTb.serverId.isNull()))
        .get();
    return res.map((r) => r.readTable(broFa2VisitFoImgTb)).toList();
  }
}
