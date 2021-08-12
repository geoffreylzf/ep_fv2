import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2RoutineDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroFa2Routine> {
  BroFa2RoutineDao(Db db) : super(db);

  $BroFa2RoutineTbTable get broFa2RoutineTb => attachedDatabase.broFa2RoutineTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2RoutineTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2RoutineTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(
          broFa2RoutineTb, List<BroFa2Routine>.from(data.map((r) => BroFa2Routine.fromJson(r))));
    });
  }

  Future<List<BroFa2Routine>> getAll() {
    return select(broFa2RoutineTb).get();
  }

  Future<BroFa2Routine> getById(int id) {
    return (select(broFa2RoutineTb)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
