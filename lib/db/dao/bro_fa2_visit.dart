import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitDao extends DatabaseAccessor<Db> {
  BroFa2VisitDao(Db db) : super(db);

  $BroFa2VisitTbTable get broFa2VisitTb => attachedDatabase.broFa2VisitTb;

  $BroFa2VisitHouseTbTable get broFa2VisitHouseTb => attachedDatabase.broFa2VisitHouseTb;

  Future<int> insert(BroFa2VisitTbCompanion visit) {
    return into(broFa2VisitTb).insert(visit);
  }

  Stream<BroFa2VisitWithData> watchById(int id) {
    return customSelect(
      """
    SELECT 
      bro_fa2_visit.*,
      company.company_code,
      company.company_name,
      location.location_code,
      location.location_name,
      GROUP_CONCAT(bro_fa2_visit_house.house_no) AS houseNoList
    FROM bro_fa2_visit
    LEFT JOIN company ON company.id = bro_fa2_visit.company_id
    LEFT JOIN location ON location.id = bro_fa2_visit.location_id
    LEFT JOIN bro_fa2_visit_house ON  bro_fa2_visit_house.bro_fa2_visit_id = bro_fa2_visit.id
    WHERE bro_fa2_visit.id = $id
    GROUP BY bro_fa2_visit.id
    ORDER BY bro_fa2_visit.timestamp DESC
    """,
      readsFrom: {broFa2VisitTb, broFa2VisitHouseTb},
    ).watchSingle().map((r) => BroFa2VisitWithData(
          broFa2Visit: BroFa2Visit.fromData(r.data, this.attachedDatabase),
          companyCode: r.read("company_code"),
          companyName: r.read("company_name"),
          locationCode: r.read("location_code"),
          locationName: r.read("location_name"),
          houseNoList: r.read<String>("houseNoList").split(",").map((x) => int.parse(x)).toList(),
        ));
  }

  Stream<List<BroFa2VisitWithData>> watchRecent({int? limit}) {
    String qLimit = "";
    if (limit != null) {
      qLimit = "LIMIT $limit";
    }
    return customSelect(
      """
    SELECT 
      bro_fa2_visit.*,
      company.company_code,
      company.company_name,
      location.location_code,
      location.location_name,
      GROUP_CONCAT(bro_fa2_visit_house.house_no) AS houseNoList
    FROM bro_fa2_visit
    LEFT JOIN company ON company.id = bro_fa2_visit.company_id
    LEFT JOIN location ON location.id = bro_fa2_visit.location_id
    LEFT JOIN bro_fa2_visit_house ON  bro_fa2_visit_house.bro_fa2_visit_id = bro_fa2_visit.id
    GROUP BY bro_fa2_visit.id
    ORDER BY bro_fa2_visit.timestamp DESC 
    $qLimit
    """,
      readsFrom: {broFa2VisitTb, broFa2VisitHouseTb},
    ).watch().map((r) {
      return r
          .map((r2) => BroFa2VisitWithData(
                broFa2Visit: BroFa2Visit.fromData(r2.data, this.attachedDatabase),
                companyCode: r2.read("company_code"),
                companyName: r2.read("company_name"),
                locationCode: r2.read("location_code"),
                locationName: r2.read("location_name"),
                houseNoList:
                    r2.read<String>("houseNoList").split(",").map((x) => int.parse(x)).toList(),
              ))
          .toList();
    });
  }

  Future<int> markAsDeletedById(int docId) async {
    return await (update(broFa2VisitTb)
          ..where(
            (tbl) => tbl.id.equals(docId),
          ))
        .write(BroFa2VisitTbCompanion(
      isDelete: Value(true),
    ));
  }
}

class BroFa2VisitWithData {
  final BroFa2Visit broFa2Visit;
  final String companyCode, companyName;
  final String locationCode, locationName;
  final List<int> houseNoList;

  BroFa2VisitWithData({
    required this.broFa2Visit,
    required this.companyCode,
    required this.companyName,
    required this.locationCode,
    required this.locationName,
    required this.houseNoList,
  });
}
