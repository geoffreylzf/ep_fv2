import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class BroFa2FoSelectionDao extends DatabaseAccessor<Db>
    implements DaoSetupBasic<BroFa2FoSelection> {
  BroFa2FoSelectionDao(Db db) : super(db);

  $BroFa2FoSelectionTbTable get broFa2FoSelectionTb => attachedDatabase.broFa2FoSelectionTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(broFa2FoSelectionTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(broFa2FoSelectionTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(broFa2FoSelectionTb,
          List<BroFa2FoSelection>.from(data.map((r) => BroFa2FoSelection.fromJson(r))));
    });
  }

  Future<List<BroFa2FoSelection>> getAll() {
    return select(broFa2FoSelectionTb).get();
  }

  Future<List<BroFa2FoSelection>> getAllByFoId(int foId) {
    return ((select(broFa2FoSelectionTb)
          ..where(
            (tbl) => tbl.broFa2FoId.equals(foId),
          ))
          ..orderBy([(t) => OrderingTerm.asc(t.order)]))
        .get();
  }
}
