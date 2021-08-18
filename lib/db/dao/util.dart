import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class UtilDao extends DatabaseAccessor<Db> {
  UtilDao(Db db) : super(db);

  $BroFa2VisitFoImgTbTable get broFa2VisitFoImgTb => attachedDatabase.broFa2VisitFoImgTb;

  $BroFa2VisitMaImgTbTable get broFa2VisitMaImgTb => attachedDatabase.broFa2VisitMaImgTb;

  $BroFa2VisitPmImgTbTable get broFa2VisitPmImgTb => attachedDatabase.broFa2VisitPmImgTb;

  $BroFa2VisitRoutineImgTbTable get broFa2VisitRoutineImgTb =>
      attachedDatabase.broFa2VisitRoutineImgTb;

  Stream<int> watchImgNotYetUploadCount() {
    return customSelect("""
    SELECT SUM(cnt) AS cnt
    FROM 
      (
      SELECT COUNT(*) AS cnt FROM bro_fa2_visit_fo_img WHERE server_id IS NULL
      UNION ALL
      SELECT COUNT(*) AS cnt FROM bro_fa2_visit_ma_img WHERE server_id IS NULL
      UNION ALL
      SELECT COUNT(*) AS cnt FROM bro_fa2_visit_pm_img WHERE server_id IS NULL
      UNION ALL
      SELECT COUNT(*) AS cnt FROM bro_fa2_visit_routine_img WHERE server_id IS NULL
      ) A
    """, readsFrom: {
      broFa2VisitFoImgTb,
      broFa2VisitMaImgTb,
      broFa2VisitPmImgTb,
      broFa2VisitRoutineImgTb,
    }).watchSingle().map((r) => r.read("cnt"));
  }
}
