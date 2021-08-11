import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final db = XanX.db();

  final rxBroFa2VisitWithDataList = Rx<List<BroFa2VisitWithData>>([]);
  final rxNotYetUploadCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    db.broFa2VisitDao.watchRecent(limit: 5).listen((vList) {
      rxBroFa2VisitWithDataList.value = vList;
    });

    db.broFa2VisitDao.watchCountByUpload().listen((cnt) {
      rxNotYetUploadCount.value = cnt;
    });
  }

  void openVisit(BroFa2VisitWithData visit) {
    Get.toNamed("/visits/${visit.broFa2Visit.id}");
  }

  void openUpload() {
    Get.toNamed("/upload");
  }

  void refreshSetupLocation() async {
    try {
      XanX.showLoadingDialog();

      final resLoc = await XanX.apiGetSelect('/api/broiler/fa/locations/');
      await db.locationDao.deleteAll();
      await db.locationDao.insertAllFromJson(resLoc.data);

      final resHse = await XanX.apiGetSelect('/api/broiler/fa/loc-houses/');
      await db.locHouseDao.deleteAll();
      await db.locHouseDao.insertAllFromJson(resHse.data);

      XanX.dismissLoadingDialog();

      XanX.showAlertDialog(message: "Location data refreshed");
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }
}
