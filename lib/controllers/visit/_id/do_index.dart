import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdDoIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxDoList = Rx<List<BroFa2Do>>([]);
  final rxVisitDoList = Rx<List<BroFa2VisitDo>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxDoList.value = await db.broFa2DoDao.getAll();

    db.broFa2VisitDoDao.watchAllByVisitId(visitId).listen((vdList) {
      rxVisitDoList.value = vdList;
    });
  }

  void openDoSubject(BroFa2Do dob) {
    Get.toNamed("${Get.currentRoute}/${dob.id}");
  }
}
