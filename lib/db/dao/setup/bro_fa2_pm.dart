import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2PmDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroFa2Pm> {
  BroFa2PmDao(Db db) : super(db);

  $BroFa2PmTbTable get broFa2PmTb => attachedDatabase.broFa2PmTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2PmTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2PmTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broFa2PmTb, List<BroFa2Pm>.from(data.map((r) => BroFa2Pm.fromJson(r))));
    });
  }

  Future<List<BroFa2Pm>> getAll() {
    return select(broFa2PmTb).get();
  }

  Future<BroFa2Pm> getById(int id) {
    return (select(broFa2PmTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
