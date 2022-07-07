import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdIndexController extends GetxController {
  final db = XanX.db();
  final id = int.parse(Get.parameters['id']!);
  final streamVisit = XanX.db().broFa2VisitDao.watchById(int.parse(Get.parameters['id']!));

  final rxIsVisitUpdatable = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();

    XanX.db().broFa2VisitDao.watchById(int.parse(Get.parameters['id']!)).listen((doc) {
      rxIsVisitUpdatable.value = !doc.broFa2Visit.isDelete && !doc.broFa2Visit.isUpload;
    });
  }

  void openUpdate() {
    Get.toNamed("/visits/$id/update");
  }

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

  void openRoutine() {
    Get.toNamed("/visits/$id/routine");
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
