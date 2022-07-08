import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroProdScheduleDao extends DatabaseAccessor<Db> implements DaoSetupBasic<BroProdSchedule> {
  BroProdScheduleDao(Db db) : super(db);

  $BroProdScheduleTbTable get broProdScheduleTb => attachedDatabase.broProdScheduleTb;

  @override
  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broProdScheduleTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  @override
  Future<int> deleteAll() async {
    return await delete(broProdScheduleTb).go();
  }

  @override
  Future<void> insertAllFromJson(data) async {
    await batch((batch) {
      batch.insertAll(
          broProdScheduleTb, List<BroProdSchedule>.from(data.map((r) => BroProdSchedule.fromJson(r))));
    });
  }

  Future<List<BroProdSchedule>> getAll() {
    return select(broProdScheduleTb).get();
  }
}
