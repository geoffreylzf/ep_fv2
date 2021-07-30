import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class LocHouseDao extends DatabaseAccessor<Db> implements DaoSetupBasic<LocHouse> {
  LocHouseDao(Db db) : super(db);

  $LocHouseTbTable get locHouseTb => attachedDatabase.locHouseTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(locHouseTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(locHouseTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(locHouseTb, List<LocHouse>.from(data.map((r) => LocHouse.fromJson(r))));
    });
  }

  Future<List<LocHouse>> getAll() {
    return select(locHouseTb).get();
  }

  Future<List<LocHouse>> getAllByLocationId(int locationId) {
    return ((select(locHouseTb)
          ..where(
            (tbl) => tbl.locationId.equals(locationId),
          ))
          ..orderBy([(t) => OrderingTerm.asc(t.houseNo)]))
        .get();
  }
}
