import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdPmIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final pmId = int.parse(Get.parameters['id2']!);

  final rxPm = Rxn<BroFa2Pm>();
  final rxImgCount = 0.obs;

  final tecComment = TextEditingController();
  final tecAction = TextEditingController();
  final tecRemark = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    final pm = await db.broFa2PmDao.getById(pmId);
    rxPm.value = pm;

    final vp = await db.broFa2VisitPmDao.getByVisitIdPmId(visitId, pmId);
    int? vpId;
    if (vp == null) {
      vpId = await db.broFa2VisitPmDao.insert(BroFa2VisitPmTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2PmId: Value(pmId),
        comment: Value(''),
        action: Value(''),
        remark: Value(''),
      ));
    } else {
      vpId = vp.id;
      tecComment.text = vp.comment;
      tecAction.text = vp.action;
      tecRemark.text = vp.remark;
    }

    db.broFa2VisitPmImgDao.watchAllByVisitPmId(vpId).listen((imgList) {
      rxImgCount.value = imgList.length;
    });
  }

  @override
  void onClose() async {
    tecComment.dispose();
    tecAction.dispose();
    tecRemark.dispose();
  }

  Future<void> onImgButtonClick() async {
    Get.toNamed("${Get.currentRoute}/images");
  }

  Future<void> onSaveButtonClick() async {
    final pm = rxPm.value;
    if (pm == null) {
      return;
    }

    final exist = await db.broFa2VisitPmDao.getByVisitIdPmId(visitId, pmId);
    if (exist != null) {
      final isUpdated = await db.broFa2VisitPmDao.updateByPk(
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
