import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitMaDao extends DatabaseAccessor<Db> {
  BroFa2VisitMaDao(Db db) : super(db);

  $BroFa2VisitMaTbTable get broFa2VisitMaTb => attachedDatabase.broFa2VisitMaTb;

  $BroFa2VisitMaImgTbTable get broFa2VisitMaImgTb => attachedDatabase.broFa2VisitMaImgTb;

  Future<int> insert(BroFa2VisitMaTbCompanion entry) {
    return into(broFa2VisitMaTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitMa entry) {
    return update(broFa2VisitMaTb).replace(entry);
  }

  Future<BroFa2VisitMa?> getByVisitIdMaId(int visitId, int maId) {
    return (select(broFa2VisitMaTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.broFa2MaId.equals(maId)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitMaWithData>> watchAllByVisitId(int visitId) {
    return customSelect(
      """
      SELECT 
        bro_fa2_visit_ma.*,
        COUNT(bro_fa2_visit_ma_img.id) AS imgCount
      FROM bro_fa2_visit_ma
      LEFT JOIN bro_fa2_visit_ma_img
        ON bro_fa2_visit_ma_img.bro_fa2_visit_ma_id = bro_fa2_visit_ma.id
      WHERE bro_fa2_visit_ma.bro_fa2_visit_id = $visitId
      GROUP BY bro_fa2_visit_ma.id
      """,
      readsFrom: {broFa2VisitMaTb, broFa2VisitMaImgTb},
    ).watch().map((r) {
      return r
          .map((r2) => BroFa2VisitMaWithData(
                broFa2VisitMa: BroFa2VisitMa.fromData(r2.data, this.attachedDatabase),
                imgCount: r2.read("imgCount"),
              ))
          .toList();
    });
  }
}

class BroFa2VisitMaWithData {
  final BroFa2VisitMa broFa2VisitMa;
  final int imgCount;

  BroFa2VisitMaWithData({
    required this.broFa2VisitMa,
    required this.imgCount,
  });
}
