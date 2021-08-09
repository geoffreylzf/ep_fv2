import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2MaDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroFa2Ma> {
  BroFa2MaDao(Db db) : super(db);

  $BroFa2MaTbTable get broFa2MaTb => attachedDatabase.broFa2MaTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2MaTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2MaTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broFa2MaTb, List<BroFa2Ma>.from(data.map((r) => BroFa2Ma.fromJson(r))));
    });
  }

  Future<List<BroFa2Ma>> getAll() {
    return select(broFa2MaTb).get();
  }

  Future<BroFa2Ma> getById(int id) {
    return (select(broFa2MaTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
