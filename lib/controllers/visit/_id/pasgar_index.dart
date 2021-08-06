import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdPasgarIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxVisitPasgarList = Rx<List<BroFa2VisitPasgar>>([]);

  @override
  void onInit() async {
    super.onInit();

    db.broFa2VisitPasgarDao.watchAllByVisitId(visitId).listen((vpgList) {
      rxVisitPasgarList.value = vpgList;
    });
  }

  void onCreateClick() async {
    final maxOrder = await db.broFa2VisitPasgarDao.getMaxOrderByFaDocId(visitId);
    int newOrder = 1;
    if (maxOrder == null || maxOrder == 0) {
      newOrder = 1;
    } else {
      newOrder = maxOrder + 1;
    }
    Get.toNamed("${Get.currentRoute}/$newOrder");
  }

  void onViewClick(int order) {
    Get.toNamed("${Get.currentRoute}/$order");
  }
}
