import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/db/util.dart';
import 'package:moor/moor.dart';

class CompanyDao extends DatabaseAccessor<Db> implements DaoSetupBasic<Company> {
  CompanyDao(Db db) : super(db);

  $CompanyTbTable get companyTb => attachedDatabase.companyTb;

  Stream<int> watchCountAll() {
    final c = countAll();
    final q = selectOnly(companyTb)..addColumns([c]);
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<int> deleteAll() async {
    return await delete(companyTb).go();
  }

  Future<void> insertAllFromJson(dynamic data) async {
    await batch((batch) {
      batch.insertAll(companyTb, List<Company>.from(data.map((r) => Company.fromJson(r))));
    });
  }

  Future<List<Company>> getAll() {
    return select(companyTb).get();
  }
}
