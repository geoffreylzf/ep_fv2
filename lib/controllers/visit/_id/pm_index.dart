import 'package:ep_fv2/db/dao/bro_fa2_visit_pm.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdPmIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxPmList = Rx<List<BroFa2Pm>>([]);
  final rxVisitPmList = Rx<List<BroFa2VisitPmWithData>>([]);

  final rxPostMortemBirdQty = 0.obs;
  final tecQty = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    rxPmList.value = await db.broFa2PmDao.getAll();

    db.broFa2VisitPmDao.watchAllByVisitId(visitId).listen((vpList) {
      rxVisitPmList.value = vpList;
    });

    bool isFirst = true;

    db.broFa2VisitDao.watchById(visitId).listen((v) {
      rxPostMortemBirdQty.value = v.broFa2Visit.postMortemBirdQty ?? 0;
      if (isFirst) {
        if (rxPostMortemBirdQty.value == 0) {
          openPmQtyEntryDialog();
        }
        isFirst = false;
      }
    });
  }

  @override
  void onClose() async {
    tecQty.dispose();
  }

  void openPmSubject(BroFa2Pm pm) {
    Get.toNamed("${Get.currentRoute}/${pm.id}");
  }

  void openPmQtyEntryDialog() async {
    final currentQty = rxPostMortemBirdQty.value;
    tecQty.text = currentQty == 0 ? '' : currentQty.toString();
    await Get.dialog(

      AlertDialog(
        title: Text('Post Mortem Bird Qty'),
        content: Container(
          width: Get.width * 0.7,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                controller: tecQty,
                autofocus: true,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Post Mortem Bird Qty",
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text("CANCEL"),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text("SAVE"),
            onPressed: () async {
              if (tecQty.text.isEmpty) {
                XanX.showErrorDialog(message: "Please enter qty");
                return;
              } else {
                if ((int.tryParse(tecQty.text) ?? 0) == 0) {
                  XanX.showErrorDialog(message: "Please enter valid number");
                  return;
                }
              }

              final visit = await db.broFa2VisitDao.getById(visitId);
              if (visit == null) {
                XanX.showErrorDialog(
                    message: "Save failed, visit not exist, please restart and try");
                return;
              }

              final qty = int.parse(tecQty.text);
              final isUpdated =
                  await db.broFa2VisitDao.updateByPk(visit.copyWith(postMortemBirdQty: qty));

              if (!isUpdated) {
                XanX.showErrorDialog(message: "Qty is not updated, please restart and try");
              } else {
                Get.back();
              }
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
