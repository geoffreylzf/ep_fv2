import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroProdScheduleDetailDao extends DatabaseAccessor<Db>
    implements DaoSetupBasic<BroProdScheduleDetail> {
  BroProdScheduleDetailDao(Db db) : super(db);

  $BroProdScheduleDetailTbTable get broProdScheduleDetailTb =>
      attachedDatabase.broProdScheduleDetailTb;

  @override
  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broProdScheduleDetailTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  @override
  Future<int> deleteAll() async {
    return await delete(broProdScheduleDetailTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broProdScheduleDetailTb,
          List<BroProdScheduleDetail>.from(data.map((r) => BroProdScheduleDetail.fromJson(r))));
    });
  }

  Future<BroProdScheduleDetail?> getByBroProdScheduleIdDayNo(int broProdScheduleId, int dayNo) {
    return ((select(broProdScheduleDetailTb)
          ..where(
            (tbl) => tbl.broProdSchedule.equals(broProdScheduleId) & tbl.dayNo.equals(dayNo),
          )))
        .getSingleOrNull();
  }
}
