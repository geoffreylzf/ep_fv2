import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdPasgarOrderController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final order = int.parse(Get.parameters['order']!);

  final tecWeight = TextEditingController();
  final rxIsChkReflex = false.obs;
  final rxIsChkNavel = false.obs;
  final rxIsChkLegs = false.obs;
  final rxIsChkBeak = false.obs;
  final rxIsChkBelly = false.obs;

  final rxIsDelectable = false.obs;

  final rxIsInitEnd = false.obs;

  @override
  void dispose() {
    tecWeight.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();

    final vpg = await db.broFa2VisitPasgarDao.getByVisitIdOrder(visitId, order);
    if (vpg != null) {
      tecWeight.text = vpg.weight.toString();
      rxIsChkReflex.value = vpg.isChkReflex;
      rxIsChkNavel.value = vpg.isChkNavel;
      rxIsChkLegs.value = vpg.isChkLegs;
      rxIsChkBeak.value = vpg.isChkBeak;
      rxIsChkBelly.value = vpg.isChkBelly;

      final maxOrder = await db.broFa2VisitPasgarDao.getMaxOrderByFaDocId(visitId);
      if (maxOrder == order) {
        rxIsDelectable.value = true;
      }
    }
    rxIsInitEnd.value = true;
  }

  void onSaveClick() async {
    final wgt = int.tryParse(tecWeight.text);

    if (wgt == null) {
      XanX.showErrorDialog(message: "Please enter weight");
      return;
    }

    final exist = await db.broFa2VisitPasgarDao.getByVisitIdOrder(visitId, order);
    if (exist == null) {
      await db.broFa2VisitPasgarDao.insert(BroFa2VisitPasgarTbCompanion(
        broFa2VisitId: Value(visitId),
        order: Value(order),
        weight: Value(wgt),
        isChkReflex: Value(rxIsChkReflex.value),
        isChkNavel: Value(rxIsChkNavel.value),
        isChkLegs: Value(rxIsChkLegs.value),
        isChkBeak: Value(rxIsChkBeak.value),
        isChkBelly: Value(rxIsChkBelly.value),
      ));
      Fluttertoast.showToast(msg: "Saved");
      Get.back();
    } else {
      final isUpdated = await db.broFa2VisitPasgarDao.updateByPk(
        exist.copyWith(
          weight: wgt,
          isChkReflex: rxIsChkReflex.value,
          isChkNavel: rxIsChkNavel.value,
          isChkLegs: rxIsChkLegs.value,
          isChkBeak: rxIsChkBeak.value,
          isChkBelly: rxIsChkBelly.value,
        ),
      );

      if (!isUpdated) {
        XanX.showErrorDialog(message: "Data is not updated");
      } else {
        Fluttertoast.showToast(msg: "Saved");
        Get.back();
      }
    }
  }

  void onDeleteClick() async {
    XanX.showConfirmDialog(
      title: "Delete this bird score?",
      message: "Are you sure?",
      btnPositiveText: "Delete",
      vcb: () async {
        final exist = await db.broFa2VisitPasgarDao.getByVisitIdOrder(visitId, order);
        if (exist == null) {
          XanX.showErrorDialog(message: "Unable to delete, data does not exist");
        } else {
          await db.broFa2VisitPasgarDao.deleteByPk(exist.id);
          Fluttertoast.showToast(msg: "Deleted");
          Get.back();
        }
      },
    );
  }
}
