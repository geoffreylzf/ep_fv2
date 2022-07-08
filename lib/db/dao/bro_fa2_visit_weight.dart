import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitWeightDao extends DatabaseAccessor<Db> {
  BroFa2VisitWeightDao(Db db) : super(db);

  $BroFa2VisitWeightTbTable get broFa2VisitWeightTb => attachedDatabase.broFa2VisitWeightTb;

  Future<int> insert(BroFa2VisitWeightTbCompanion entry) {
    return into(broFa2VisitWeightTb).insert(entry);
  }

  Future<bool> updateByPk(BroFa2VisitWeight entry) {
    return update(broFa2VisitWeightTb).replace(entry);
  }

  Future<int> deleteByPk(int id) {
    return (delete(broFa2VisitWeightTb)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<BroFa2VisitWeight>> getAllByVisitId(int visitId) {
    return (select(broFa2VisitWeightTb)..where((tbl) => tbl.broFa2VisitId.equals(visitId))).get();
  }

  Stream<List<BroFa2VisitWeight>> watchAllByVisitId(int visitId, {orderBy: OrderingMode.asc}) {
    return (select(broFa2VisitWeightTb)
          ..where((tbl) => tbl.broFa2VisitId.equals(visitId))
          ..orderBy([(t) => OrderingTerm(expression: t.id, mode: orderBy)]))
        .watch();
  }

  Future<List<BodyWgtSummary>> getSummaryByVisitId(int visitId) async {
    return (await customSelect("""
    SELECT 
      gender,
      SUM(qty) AS ttl_qty,
      SUM(weight) AS ttl_wgt,
      SUM(weight) / SUM(qty) AS avg_wgt
    FROM bro_fa2_visit_weight
    WHERE bro_fa2_visit_id = $visitId
    GROUP BY gender
    ORDER BY gender
        """).get()).map((r) {
      return BodyWgtSummary(
        gender: r.read("gender"),
        ttlQty: r.read("ttl_qty"),
        ttlWgt: r.read("ttl_wgt"),
        avgWgt: r.read("avg_wgt"),
      );
    }).toList();
  }
}

class BodyWgtSummary {
  String gender;
  int ttlQty;
  double ttlWgt, avgWgt;
  double stdWgt = 0;

  BodyWgtSummary({
    required this.gender,
    required this.ttlQty,
    required this.ttlWgt,
    required this.avgWgt,
  });
}
