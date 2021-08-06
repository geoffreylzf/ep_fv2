import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2DoDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroFa2Do> {
  BroFa2DoDao(Db db) : super(db);

  $BroFa2DoTbTable get broFa2DoTb => attachedDatabase.broFa2DoTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2DoTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2DoTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broFa2DoTb, List<BroFa2Do>.from(data.map((r) => BroFa2Do.fromJson(r))));
    });
  }

  Future<List<BroFa2Do>> getAll() {
    return select(broFa2DoTb).get();
  }

  Future<BroFa2Do> getById(int id) {
    return (select(broFa2DoTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
