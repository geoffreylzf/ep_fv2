import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class LocationDao extends DatabaseAccessor<Db> implements DaoSetupBasic<Location> {
  LocationDao(Db db) : super(db);

  $LocationTbTable get locationTb => attachedDatabase.locationTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(locationTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(locationTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(locationTb, List<Location>.from(data.map((r) => Location.fromJson(r))));
    });
  }

  Future<List<Location>> getAll() {
    return select(locationTb).get();
  }

  Future<List<Location>> getAllByCompanyIdWord(int companyId, {String word = ''}) {
    return (select(locationTb)
          ..where(
            (tbl) =>
                tbl.companyId.equals(companyId) &
                (tbl.locationCode.like('%$word%') | tbl.locationName.like('%$word%')),
          ))
        .get();
  }
}
