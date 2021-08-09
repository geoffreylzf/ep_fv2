import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdMaIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final maId = int.parse(Get.parameters['id2']!);

  final rxMa = Rxn<BroFa2Ma>();
  final rxImgCount = 0.obs;

  final tecComment = TextEditingController();
  final tecAction = TextEditingController();
  final tecRemark = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    final ma = await db.broFa2MaDao.getById(maId);
    rxMa.value = ma;

    final vm = await db.broFa2VisitMaDao.getByVisitIdMaId(visitId, maId);
    int? vpId;
    if (vm == null) {
      vpId = await db.broFa2VisitMaDao.insert(BroFa2VisitMaTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2MaId: Value(maId),
        comment: Value(''),
        action: Value(''),
        remark: Value(''),
      ));
    } else {
      vpId = vm.id;
      tecComment.text = vm.comment;
      tecAction.text = vm.action;
      tecRemark.text = vm.remark;
    }

    db.broFa2VisitMaImgDao.watchAllByVisitMaId(vpId).listen((imgList) {
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
    final ma = rxMa.value;
    if (ma == null) {
      return;
    }

    final exist = await db.broFa2VisitMaDao.getByVisitIdMaId(visitId, maId);
    if (exist != null) {
      final isUpdated = await db.broFa2VisitMaDao.updateByPk(
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
