import 'package:ep_fv2/db/util.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class SetupMapping {
  final String path;
  final DaoSetupBasic dao;
  final isRefreshing = false.obs;

  SetupMapping(this.path, this.dao);
}

class SetupController extends GetxController {
  final db = XanX.db();

  late Map<String, SetupMapping> setupMap;

  @override
  void onInit() {
    super.onInit();

    setupMap = <String, SetupMapping>{
      "company": SetupMapping("/api/broiler/fa/companies/", db.companyDao),
      "location": SetupMapping("/api/broiler/fa/locations/", db.locationDao),
      "loc_house": SetupMapping("/api/broiler/fa/loc-houses/", db.locHouseDao),
      "bro_fa2_do": SetupMapping("/api/broiler/fa2/doc-observations/", db.broFa2DoDao),
      "bro_fa2_fo": SetupMapping("/api/broiler/fa2/flock-observations/", db.broFa2FoDao),
      "bro_fa2_fo_selection":
          SetupMapping("/api/broiler/fa2/flock-observation-selections/", db.broFa2FoSelectionDao),
      "bro_fa2_ma": SetupMapping("/api/broiler/fa2/management-audits/", db.broFa2MaDao),
      "bro_fa2_pm": SetupMapping("/api/broiler/fa2/post-mortems/", db.broFa2PmDao),
      "bro_fa2_routine": SetupMapping("/api/broiler/fa2/routines/", db.broFa2RoutineDao),
    };
  }

  void retrieveAllData() async {
    try {
      XanX.showLoadingDialog();

      await Future.forEach<SetupMapping>(setupMap.values, (v) async {
        final res = await XanX.apiGetSelect(v.path);
        await v.dao.deleteAll();
        await v.dao.insertAllFromJson(res.data);
      });

      XanX.dismissLoadingDialog();
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }

  void retrieveByKey(String key) async {
    final s = setupMap[key];
    try {
      XanX.showLoadingDialog();
      s!.isRefreshing.value = true;

      final res = await XanX.apiGetSelect(s.path);
      await s.dao.deleteAll();
      await s.dao.insertAllFromJson(res.data);

      s.isRefreshing.value = false;
      XanX.dismissLoadingDialog();
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }
}
