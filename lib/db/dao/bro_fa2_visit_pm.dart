import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitPmDao extends DatabaseAccessor<Db> {
  BroFa2VisitPmDao(Db db) : super(db);

  $BroFa2VisitPmTbTable get broFa2VisitPmTb => attachedDatabase.broFa2VisitPmTb;

  $BroFa2VisitPmImgTbTable get broFa2VisitPmImgTb => attachedDatabase.broFa2VisitPmImgTb;

  Future<int> insert(BroFa2VisitPmTbCompanion entry) {
    return into(broFa2VisitPmTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitPm entry) {
    return update(broFa2VisitPmTb).replace(entry);
  }

  Future<BroFa2VisitPm?> getByVisitIdPmId(int visitId, int pmId) {
    return (select(broFa2VisitPmTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.broFa2PmId.equals(pmId)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitPmWithData>> watchAllByVisitId(int visitId) {
    return customSelect(
      """
      SELECT 
        bro_fa2_visit_pm.*,
        COUNT(bro_fa2_visit_pm_img.id) AS imgCount
      FROM bro_fa2_visit_pm
      LEFT JOIN bro_fa2_visit_pm_img
        ON bro_fa2_visit_pm_img.bro_fa2_visit_pm_id = bro_fa2_visit_pm.id
      WHERE bro_fa2_visit_pm.bro_fa2_visit_id = $visitId
      GROUP BY bro_fa2_visit_pm.id
      """,
      readsFrom: {broFa2VisitPmTb, broFa2VisitPmImgTb},
    ).watch().map((r) {
      return r
          .map((r2) => BroFa2VisitPmWithData(
                broFa2VisitPm: BroFa2VisitPm.fromData(r2.data, this.attachedDatabase),
                imgCount: r2.read("imgCount"),
              ))
          .toList();
    });
  }
}

class BroFa2VisitPmWithData {
  final BroFa2VisitPm broFa2VisitPm;
  final int imgCount;

  BroFa2VisitPmWithData({
    required this.broFa2VisitPm,
    required this.imgCount,
  });
}
