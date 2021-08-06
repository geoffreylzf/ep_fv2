import 'package:ep_fv2/db/dao/bro_fa2_visit_fo.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdFoIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxFoList = Rx<List<BroFa2Fo>>([]);
  final rxVisitFoList = Rx<List<BroFa2VisitFoWithData>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxFoList.value = await db.broFa2FoDao.getAll();

    db.broFa2VisitFoDao.watchAllByVisitId(visitId).listen((vfList) {
      rxVisitFoList.value = vfList;
    });
  }

  void openFoSubject(BroFa2Fo fo) {
    Get.toNamed("/visits/$visitId/fo/${fo.id}");
  }
}
