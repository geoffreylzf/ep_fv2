import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdPasgarIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxVisitPasgarList = Rx<List<BroFa2VisitPasgar>>([]);
  final rxPasgarAvgScore = 0.0.obs;
  final rxAvgWeightScore = 0.0.obs;
  final rxTtlCount = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    db.broFa2VisitPasgarDao.watchAllByVisitId(visitId).listen((vpgList) {
      rxVisitPasgarList.value = vpgList;
      if (vpgList.length == 0) {
        rxPasgarAvgScore.value = 0.0;
      } else {
        double ttlScore = 0.0;
        double ttlWeight = 0.0;
        vpgList.forEach((vpg) {
          ttlWeight += vpg.weight;
          ttlScore += 10;
          if (vpg.isChkReflex) {
            ttlScore -= 1;
          }
          if (vpg.isChkNavel) {
            ttlScore -= 1;
          }
          if (vpg.isChkLegs) {
            ttlScore -= 1;
          }
          if (vpg.isChkBeak) {
            ttlScore -= 1;
          }
          if (vpg.isChkBelly) {
            ttlScore -= 1;
          }
        });
        rxTtlCount.value = vpgList.length;
        rxPasgarAvgScore.value = ttlScore / vpgList.length;
        rxAvgWeightScore.value = ttlWeight / vpgList.length;
      }
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
