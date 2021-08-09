import 'package:ep_fv2/db/dao/bro_fa2_visit_ma.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdMaIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxMaList = Rx<List<BroFa2Ma>>([]);
  final rxVisitMaList = Rx<List<BroFa2VisitMaWithData>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxMaList.value = await db.broFa2MaDao.getAll();

    db.broFa2VisitMaDao.watchAllByVisitId(visitId).listen((vmList) {
      rxVisitMaList.value = vmList;
    });
  }

  void openMaSubject(BroFa2Ma ma) {
    Get.toNamed("${Get.currentRoute}/${ma.id}");
  }
}
