import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdDoIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final doId = int.parse(Get.parameters['id2']!);

  final rxDo = Rxn<BroFa2Do>();

  final tecAnswer = TextEditingController();
  final tecComment = TextEditingController();
  final tecAction = TextEditingController();
  final tecRemark = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    final dob = await db.broFa2DoDao.getById(doId);
    rxDo.value = dob;

    final vd = await db.broFa2VisitDoDao.getByVisitIdDoId(visitId, doId);
    int? vdId;
    if (vd == null) {
      vdId = await db.broFa2VisitDoDao.insert(BroFa2VisitDoTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2DoId: Value(doId),
        answer: Value(''),
        comment: Value(''),
        action: Value(''),
        remark: Value(''),
      ));
    } else {
      vdId = vd.id;
      tecAnswer.text = vd.answer;
      tecComment.text = vd.comment;
      tecAction.text = vd.action;
      tecRemark.text = vd.remark;
    }
  }

  @override
  void onClose() async {
    tecAnswer.dispose();
    tecComment.dispose();
    tecAction.dispose();
    tecRemark.dispose();
  }

  Future<void> onSaveButtonClick() async {
    final pm = rxDo.value;
    if (pm == null) {
      return;
    }

    final exist = await db.broFa2VisitDoDao.getByVisitIdDoId(visitId, doId);
    if (exist != null) {
      final isUpdated = await db.broFa2VisitDoDao.updateByPk(
        exist.copyWith(
          answer: tecAnswer.text,
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
