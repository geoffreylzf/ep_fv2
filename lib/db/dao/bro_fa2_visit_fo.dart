import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitFoDao extends DatabaseAccessor<Db> {
  BroFa2VisitFoDao(Db db) : super(db);

  $BroFa2VisitFoTbTable get broFa2VisitFoTb => attachedDatabase.broFa2VisitFoTb;

  $BroFa2VisitFoImgTbTable get broFa2VisitFoImgTb => attachedDatabase.broFa2VisitFoImgTb;

  Future<int> insert(BroFa2VisitFoTbCompanion entry) {
    return into(broFa2VisitFoTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitFo entry) {
    return update(broFa2VisitFoTb).replace(entry);
  }

  Future<BroFa2VisitFo?> getByVisitIdFoId(int visitId, int foId) {
    return (select(broFa2VisitFoTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId) & tbl.broFa2FoId.equals(foId)))
        .getSingleOrNull();
  }

  Stream<List<BroFa2VisitFoWithData>> watchAllByVisitId(int visitId) {
    return customSelect(
      """
      SELECT 
        bro_fa2_visit_fo.*,
        bro_fa2_fo_selection.name AS selection_name,
        COUNT(bro_fa2_visit_fo_img.id) AS imgCount
      FROM bro_fa2_visit_fo
      LEFT JOIN bro_fa2_fo_selection 
        ON bro_fa2_fo_selection.id = bro_fa2_visit_fo.bro_fa2_fo_selection_id
      LEFT JOIN bro_fa2_visit_fo_img
        ON bro_fa2_visit_fo_img.bro_fa2_visit_fo_id = bro_fa2_visit_fo.id
      WHERE bro_fa2_visit_fo.bro_fa2_visit_id = $visitId
      GROUP BY bro_fa2_visit_fo.id
      """,
      readsFrom: {broFa2VisitFoTb, broFa2VisitFoImgTb},
    ).watch().map((r) {
      return r
          .map((r2) => BroFa2VisitFoWithData(
                broFa2VisitFo: BroFa2VisitFo.fromData(r2.data, this.attachedDatabase),
                selectionName: r2.read("selection_name") ?? '',
                imgCount: r2.read("imgCount"),
              ))
          .toList();
    });
  }
}

class BroFa2VisitFoWithData {
  final BroFa2VisitFo broFa2VisitFo;
  final String selectionName;
  final int imgCount;

  BroFa2VisitFoWithData({
    required this.broFa2VisitFo,
    required this.selectionName,
    required this.imgCount,
  });
}
