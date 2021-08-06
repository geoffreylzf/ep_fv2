import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdIndexController extends GetxController {
  final db = XanX.db();
  final id = int.parse(Get.parameters['id']!);
  final streamVisit = XanX.db().broFa2VisitDao.watchById(int.parse(Get.parameters['id']!));

  void softDelete() {
    XanX.showConfirmDialog(
      title: "Delete this visit?",
      message: "Are you sure?",
      btnPositiveText: "Delete",
      vcb: () async {
        db.broFa2VisitDao.markAsDeletedById(id);
      },
    );
  }

  void openFlockObservation() {
    Get.toNamed("/visits/$id/fo");
  }

  void openPostMortem() {
    Get.toNamed("/visits/$id/pm");
  }

  void openDocObservation() {
    Get.toNamed("/visits/$id/do");
  }

  void openPasgar() {
    Get.toNamed("/visits/$id/pasgar");
  }

  void openManagementAudit() {
    Get.toNamed("/visits/$id/ma");
  }

  void openWeight() {
    Get.toNamed("/visits/$id/weight");
  }
}
