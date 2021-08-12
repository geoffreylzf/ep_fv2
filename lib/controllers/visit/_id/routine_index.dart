import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdRoutineIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxRoutineList = Rx<List<BroFa2Routine>>([]);
  final rxVisitRoutineList = Rx<List<BroFa2VisitRoutine>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxRoutineList.value = await db.broFa2RoutineDao.getAll();

    db.broFa2VisitRoutineDao.watchAllByVisitId(visitId).listen((vrList) {
      rxVisitRoutineList.value = vrList;
    });
  }

  void openRoutineSubject(BroFa2Routine r) {
    Get.toNamed("${Get.currentRoute}/${r.id}");
  }
}
