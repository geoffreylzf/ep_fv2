import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final db = XanX.db();

  Stream<List<BroFa2VisitWithData>> get faDocRecentStream =>
      db.broFa2VisitDao.watchRecent(limit: 5);

  void openVisit(BroFa2VisitWithData visit) {
    Get.toNamed("/visits/${visit.broFa2Visit.id}");
  }
}
