import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitFoImgDao extends DatabaseAccessor<Db> {
  BroFa2VisitFoImgDao(Db db) : super(db);

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

}
