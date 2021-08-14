import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIndexController extends GetxController {
  final db = XanX.db();

  final rxBroFa2VisitWithDataList = Rx<List<BroFa2VisitWithData>>([]);

  @override
  void onInit() {
    super.onInit();
    db.broFa2VisitDao.watchRecent().listen((vList) {
      rxBroFa2VisitWithDataList.value = vList;
    });
  }

  void openVisit(BroFa2VisitWithData visit) {
    Get.toNamed("/visits/${visit.broFa2Visit.id}");
  }
}
