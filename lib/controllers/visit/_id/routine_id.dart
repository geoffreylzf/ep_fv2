import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdRoutineIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final routineId = int.parse(Get.parameters['id2']!);

  final rxRoutine = Rxn<BroFa2Routine>();

  final tecComment = TextEditingController();
  final tecAction = TextEditingController();
  final tecRemark = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    final rou = await db.broFa2RoutineDao.getById(routineId);
    rxRoutine.value = rou;

    final vr = await db.broFa2VisitRoutineDao.getByVisitIdRoutineId(visitId, routineId);
    int? vrId;
    if (vr == null) {
      vrId = await db.broFa2VisitRoutineDao.insert(BroFa2VisitRoutineTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2RoutineId: Value(routineId),
        comment: Value(''),
        action: Value(''),
        remark: Value(''),
      ));
    } else {
      vrId = vr.id;
      tecComment.text = vr.comment;
      tecAction.text = vr.action;
      tecRemark.text = vr.remark;
    }
  }

  @override
  void onClose() async {
    tecComment.dispose();
    tecAction.dispose();
    tecRemark.dispose();
  }

  Future<void> onSaveButtonClick() async {
    final pm = rxRoutine.value;
    if (pm == null) {
      return;
    }

    final exist = await db.broFa2VisitRoutineDao.getByVisitIdRoutineId(visitId, routineId);
    if (exist != null) {
      final isUpdated = await db.broFa2VisitRoutineDao.updateByPk(
        exist.copyWith(
          comment: tecComment.text,
          action: tecAction.text,
          remark: tecRemark.text,
        ),
      );

      if (!isUpdated) {
        XanX.showErrorDialog(message: "Data is not updated");
      } else {
        Fluttertoast.showToast(msg: "Saved");
        Get.back();
      }
    } else {
      XanX.showErrorDialog(message: "Save failed, please try again");
    }
  }
}
