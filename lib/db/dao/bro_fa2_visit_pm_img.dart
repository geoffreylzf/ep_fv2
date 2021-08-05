import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitPmImgDao extends DatabaseAccessor<Db> {
  BroFa2VisitPmImgDao(Db db) : super(db);

  $BroFa2VisitPmImgTbTable get broFa2VisitPmImgTb => attachedDatabase.broFa2VisitPmImgTb;

  Future<int> insert(BroFa2VisitPmImgTbCompanion entry) {
    return into(broFa2VisitPmImgTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitPmImg entry) {
    return update(broFa2VisitPmImgTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitPmImgTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<BroFa2VisitPmImg> getById(int id) {
    return (select(broFa2VisitPmImgTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<BroFa2VisitPmImg>> getAllByVisitPmId(int vfId) async {
    return (select(broFa2VisitPmImgTb)..where((tbl) => tbl.broFa2VisitPmId.equals(vfId))).get();
  }

  Stream<List<BroFa2VisitPmImg>> watchAllByVisitPmId(int vfId) {
    return (select(broFa2VisitPmImgTb)..where((tbl) => tbl.broFa2VisitPmId.equals(vfId))).watch();
  }
}