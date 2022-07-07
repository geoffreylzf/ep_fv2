import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class BroFa2VisitDao extends DatabaseAccessor<Db> {
  BroFa2VisitDao(Db db) : super(db);

  $BroFa2VisitTbTable get broFa2VisitTb => attachedDatabase.broFa2VisitTb;

  $BroFa2VisitHouseTbTable get broFa2VisitHouseTb => attachedDatabase.broFa2VisitHouseTb;

  Future<int> insert(BroFa2VisitTbCompanion visit) {
    return into(broFa2VisitTb).insert(visit);
  }

  Future<bool> updateByPk(BroFa2Visit entry) {
    return update(broFa2VisitTb).replace(entry);
  }

  Future<BroFa2Visit?> getById(int id) {
    return (select(broFa2VisitTb)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
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
    ).watchSingle().map((r) {
      final hseNoStr = r.read<String?>("houseNoList") ?? "";

      return BroFa2VisitWithData(
        broFa2Visit: BroFa2Visit.fromData(r.data, this.attachedDatabase),
        companyCode: r.read("company_code"),
        companyName: r.read("company_name"),
        locationCode: r.read("location_code"),
        locationName: r.read("location_name"),
        houseNoList: hseNoStr.isNotEmpty ? hseNoStr.split(",").map((x) => int.parse(x)).toList() : [],
      );
    });
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
      return r.map((r2) {
        final hseListStr = r2.read<String?>("houseNoList");
        return BroFa2VisitWithData(
          broFa2Visit: BroFa2Visit.fromData(r2.data, this.attachedDatabase),
          companyCode: r2.read("company_code"),
          companyName: r2.read("company_name"),
          locationCode: r2.read("location_code") ?? "Inactive",
          locationName: r2.read("location_name") ?? "Inactive Location",
          houseNoList: hseListStr?.split(",").map((x) => int.parse(x)).toList() ?? [],
        );
      }).toList();
    });
  }

  Future<int> markAsDeletedById(int visitId) async {
    return await (update(broFa2VisitTb)
          ..where(
            (tbl) => tbl.id.equals(visitId),
          ))
        .write(BroFa2VisitTbCompanion(
      isDelete: Value(true),
    ));
  }

  Stream<int> watchCountByUpload({bool isUpload: false}) {
    final c = countAll();
    final q = selectOnly(broFa2VisitTb)
      ..addColumns([c])
      ..where(broFa2VisitTb.isUpload.equals(isUpload));
    return q.map((row) => row.read(c)).watchSingle();
  }

  Future<List<int>> getListOfIdByUpload({bool isUpload: false}) async {
    final res = await (select(broFa2VisitTb)
          ..where((tbl) => broFa2VisitTb.isUpload.equals(isUpload)))
        .get();
    return res.map((e) => e.id).toList();
  }

  $BroFa2VisitDoTbTable get broFa2VisitDoTb => attachedDatabase.broFa2VisitDoTb;

  $BroFa2VisitRoutineTbTable get broFa2VisitRoutineTb => attachedDatabase.broFa2VisitRoutineTb;

  $BroFa2VisitRoutineImgTbTable get broFa2VisitRoutineImgTb =>
      attachedDatabase.broFa2VisitRoutineImgTb;

  $BroFa2VisitPasgarTbTable get broFa2VisitPasgarTb => attachedDatabase.broFa2VisitPasgarTb;

  $BroFa2VisitWeightTbTable get broFa2VisitWeightTb => attachedDatabase.broFa2VisitWeightTb;

  $BroFa2VisitFoTbTable get broFa2VisitFoTb => attachedDatabase.broFa2VisitFoTb;

  $BroFa2VisitFoImgTbTable get broFa2VisitFoImgTb => attachedDatabase.broFa2VisitFoImgTb;

  $BroFa2VisitMaTbTable get broFa2VisitMaTb => attachedDatabase.broFa2VisitMaTb;

  $BroFa2VisitMaImgTbTable get broFa2VisitMaImgTb => attachedDatabase.broFa2VisitMaImgTb;

  $BroFa2VisitPmTbTable get broFa2VisitPmTb => attachedDatabase.broFa2VisitPmTb;

  $BroFa2VisitPmImgTbTable get broFa2VisitPmImgTb => attachedDatabase.broFa2VisitPmImgTb;

  Future<List<Map<String, dynamic>>> getJsonForUploadByIdList(List<int> visitIdList) async {
    final visitList = await (select(broFa2VisitTb)..where((tbl) => tbl.id.isIn(visitIdList))).get();

    final visitJsonList = <Map<String, dynamic>>[];
    await Future.forEach<BroFa2Visit>(visitList, (e) async {
      final id = e.id;
      final visitJson = e.toJson();
      visitJson.remove('id');
      visitJson.remove('is_upload');

      /// child houses listing
      final houseList =
          await (select(broFa2VisitHouseTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      visitJson['houses'] = houseList
          .map((r) => r.toJson()
            ..remove('id')
            ..remove('bro_fa2_visit'))
          .toList();

      /// child do listing
      final doList =
          await (select(broFa2VisitDoTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      visitJson['doc_observations'] = doList
          .map((r) => r.toJson()
            ..remove('id')
            ..remove('bro_fa2_visit'))
          .toList();

      /// child pasgar listing
      final pasgarList =
          await (select(broFa2VisitPasgarTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      visitJson['pasgars'] = pasgarList
          .map((r) => r.toJson()
            ..remove('id')
            ..remove('bro_fa2_visit'))
          .toList();

      /// child weight listing
      final weightList =
          await (select(broFa2VisitWeightTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      visitJson['weights'] = weightList
          .map((r) => r.toJson()
            ..remove('id')
            ..remove('bro_fa2_visit'))
          .toList();

      /// child routine listing
      final routineList =
          await (select(broFa2VisitRoutineTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      final routineJsonList = <Map<String, dynamic>>[];

      await Future.forEach<BroFa2VisitRoutine>(routineList, (rt) async {
        final rtId = rt.id;
        final rtJson = rt.toJson();
        rtJson.remove('id');
        rtJson.remove('bro_fa2_visit');

        /// Filter those image without server_id
        final imageList = await (select(broFa2VisitRoutineImgTb)
              ..where((tbl) => tbl.broFa2VisitRoutineId.equals(rtId) & tbl.serverId.isNotNull()))
            .get();
        rtJson['images'] = imageList.map((r) {
          return {'bro_fa2_visit_img_path': r.serverId};
        }).toList();

        routineJsonList.add(rtJson);
      });
      visitJson['routines'] = routineJsonList;

      /// child fo listing
      final foList =
          await (select(broFa2VisitFoTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      final foJsonList = <Map<String, dynamic>>[];

      await Future.forEach<BroFa2VisitFo>(foList, (fo) async {
        final foId = fo.id;
        final foJson = fo.toJson();
        foJson.remove('id');
        foJson.remove('bro_fa2_visit');

        /// Filter those image without server_id
        final imageList = await (select(broFa2VisitFoImgTb)
              ..where((tbl) => tbl.broFa2VisitFoId.equals(foId) & tbl.serverId.isNotNull()))
            .get();
        foJson['images'] = imageList.map((r) {
          return {'bro_fa2_visit_img_path': r.serverId};
        }).toList();

        foJsonList.add(foJson);
      });
      visitJson['flock_observations'] = foJsonList;

      /// child ma listing
      final maList =
          await (select(broFa2VisitMaTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      final maJsonList = <Map<String, dynamic>>[];

      await Future.forEach<BroFa2VisitMa>(maList, (fo) async {
        final maId = fo.id;
        final maJson = fo.toJson();
        maJson.remove('id');
        maJson.remove('bro_fa2_visit');

        /// Filter those image without server_id
        final imageList = await (select(broFa2VisitMaImgTb)
              ..where((tbl) => tbl.broFa2VisitMaId.equals(maId) & tbl.serverId.isNotNull()))
            .get();
        maJson['images'] = imageList.map((r) {
          return {'bro_fa2_visit_img_path': r.serverId};
        }).toList();

        maJsonList.add(maJson);
      });
      visitJson['management_audits'] = maJsonList;

      /// child pm listing
      final pmList =
          await (select(broFa2VisitPmTb)..where((tbl) => tbl.broFa2VisitId.equals(id))).get();
      final pmJsonList = <Map<String, dynamic>>[];

      await Future.forEach<BroFa2VisitPm>(pmList, (fo) async {
        final pmId = fo.id;
        final pmJson = fo.toJson();
        pmJson.remove('id');
        pmJson.remove('bro_fa2_visit');

        /// Filter those image without server_id
        final imageList = await (select(broFa2VisitPmImgTb)
              ..where((tbl) => tbl.broFa2VisitPmId.equals(pmId) & tbl.serverId.isNotNull()))
            .get();
        pmJson['images'] = imageList.map((r) {
          return {'bro_fa2_visit_img_path': r.serverId};
        }).toList();

        pmJsonList.add(pmJson);
      });
      visitJson['post_mortems'] = pmJsonList;

      visitJsonList.add(visitJson);
    });
    return visitJsonList;
  }

  Future<int> markAsUpdatedByIdList(List<int> visitIdList) async {
    return await (update(broFa2VisitTb)
          ..where(
            (tbl) => tbl.id.isIn(visitIdList),
          ))
        .write(BroFa2VisitTbCompanion(isUpload: Value(true)));
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
