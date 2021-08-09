import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdDoIndexController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  final rxDoList = Rx<List<BroFa2Do>>([]);
  final rxVisitDoList = Rx<List<BroFa2VisitDo>>([]);

  final rxDocObservationBirdQty = 0.obs;
  final tecQty = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    rxDoList.value = await db.broFa2DoDao.getAll();

    db.broFa2VisitDoDao.watchAllByVisitId(visitId).listen((vdList) {
      rxVisitDoList.value = vdList;
    });

    bool isFirst = true;

    db.broFa2VisitDao.watchById(visitId).listen((v) {
      rxDocObservationBirdQty.value = v.broFa2Visit.docObservationBirdQty ?? 0;
      if (isFirst) {
        if (rxDocObservationBirdQty.value == 0) {
          openDoQtyEntryDialog();
        }
        isFirst = false;
      }
    });
  }

  @override
  void onClose() async {
    tecQty.dispose();
  }

  void openDoSubject(BroFa2Do dob) {
    Get.toNamed("${Get.currentRoute}/${dob.id}");
  }

  void openDoQtyEntryDialog() async {
    final currentQty = rxDocObservationBirdQty.value;
    tecQty.text = currentQty == 0 ? '' : currentQty.toString();
    await Get.dialog(

      AlertDialog(
        title: Text('DOC Observation Qty'),
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
                  labelText: "DOC Observation Bird Qty",
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
              await db.broFa2VisitDao.updateByPk(visit.copyWith(docObservationBirdQty: qty));

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
