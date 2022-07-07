import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdUpdateController extends GetxController {
  final db = XanX.db();
  final id = int.parse(Get.parameters['id']!);

  final tecHouseNo = TextEditingController();

  final rxSelectedHouseNoList = Rx<List<int>>([]);
  final rxLocHouseList = Rx<List<LocHouse>>([]);

  @override
  void onInit() {
    super.onInit();

    XanX.db().broFa2VisitDao.watchById(int.parse(Get.parameters['id']!)).listen((doc) async {
      rxSelectedHouseNoList.value = doc.houseNoList;
      rxLocHouseList.value = await db.locHouseDao.getAllByLocationId(doc.broFa2Visit.locationId);
    });
  }

  @override
  void onClose() {
    tecHouseNo.dispose();
  }

  void selectHouseNo(int houseNo) {
    if (rxSelectedHouseNoList.value.contains(houseNo)) {
      rxSelectedHouseNoList.value.remove(houseNo);
    } else {
      rxSelectedHouseNoList.value.add(houseNo);
      rxSelectedHouseNoList.value.sort();
    }
    rxSelectedHouseNoList.refresh();
  }

  void onAdditionalHouseEnter() {
    final h = int.tryParse(tecHouseNo.text) ?? null;
    if (h == null) {
      XanX.showErrorDialog(message: "Please enter valid house # (number only)");
      return;
    }

    if (rxLocHouseList.value.map((e) => e.houseNo).contains(h)) {
      XanX.showErrorDialog(message: "This house # already exist in selection");
      return;
    }

    selectHouseNo(h);
  }

  void updateNBack() async {
    try {
      XanX.showLoadingDialog();
      await Future.delayed(Duration(milliseconds: 500));

      await db.broFa2VisitHouseDao.deleteAllByBroFa2VisitId(id);
      await Future.forEach(rxSelectedHouseNoList.value, (hse) async {
        final hseNo = int.parse(hse.toString());
        final vh = BroFa2VisitHouseTbCompanion(
          broFa2VisitId: Value(id),
          houseNo: Value(hseNo),
        );
        await db.broFa2VisitHouseDao.insert(vh);
      });

      XanX.dismissLoadingDialog();
      Get.back();
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }
}
