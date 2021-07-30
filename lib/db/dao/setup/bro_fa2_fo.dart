import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2FoDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroFa2Fo> {
  BroFa2FoDao(Db db) : super(db);

  $BroFa2FoTbTable get broFa2FoTb => attachedDatabase.broFa2FoTb;

  Stream<List<BroFa2Fo>> watchAll() {
    return select(broFa2FoTb).watch();
  }

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2FoTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2FoTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broFa2FoTb, List<BroFa2Fo>.from(data.map((r) => BroFa2Fo.fromJson(r))));
    });
  }

  Future<List<BroFa2Fo>> getAll() {
    return select(broFa2FoTb).get();
  }
}
