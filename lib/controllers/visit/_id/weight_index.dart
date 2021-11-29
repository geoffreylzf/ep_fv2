import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/enum.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdWeightIndexController extends GetxController with SingleGetTickerProviderMixin {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);

  late TabController tabController;

  final rxHouseNoList = Rx<List<int>>([]);

  final rxSelectedHouseNo = Rxn<int>();
  final tecSection = TextEditingController();
  final tecQty = TextEditingController();
  final tecWeight = TextEditingController();
  final fnWeight = FocusNode();

  final rxGender = Rxn<Gender>();
  final rxVisitWeightList = Rx<List<BroFa2VisitWeight>>([]);

  final rxSumQtyAh = Rx<int>(0);
  final rxSumQtyFemale = Rx<int>(0);
  final rxSumQtyMale = Rx<int>(0);

  final rxSumWgtAh = Rx<int>(0);
  final rxSumWgtFemale = Rx<int>(0);
  final rxSumWgtMale = Rx<int>(0);

  @override
  void onInit() async {
    super.onInit();

    db.broFa2VisitWeightDao.watchAllByVisitId(visitId, orderBy: OrderingMode.desc).listen((vwList) {
      rxVisitWeightList.value = vwList;

      var qtyAh = 0;
      var qtyFemale = 0;
      var qtyMale = 0;

      var wgtAh = 0;
      var wgtFemale = 0;
      var wgtMale = 0;

      vwList.forEach((vw) {
        if (vw.gender == 'A') {
          qtyAh += vw.qty;
          wgtAh += vw.weight;
        }else if (vw.gender == 'F') {
          qtyFemale += vw.qty;
          wgtFemale += vw.weight;
        }
        else if (vw.gender == 'M') {
          qtyMale += vw.qty;
          wgtMale += vw.weight;
        }
      });

      rxSumQtyAh.value = qtyAh;
      rxSumQtyFemale.value = qtyFemale;
      rxSumQtyMale.value =qtyMale;

      rxSumWgtAh.value = wgtAh;
      rxSumWgtFemale.value = wgtFemale;
      rxSumWgtMale.value =wgtMale;
    });

    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (!tabController.indexIsChanging && tabController.index == 1) {
        //Dismiss keyboard
        FocusScope.of(Get.context!).requestFocus(new FocusNode());
      }
    });

    final broFa2VisitHouseList = await db.broFa2VisitHouseDao.getAllByBroFa2VisitId(visitId);
    rxHouseNoList.value = broFa2VisitHouseList.map((e) => e.houseNo).toList();
  }

  @override
  void onClose() {
    tabController.dispose();
    tecSection.dispose();
    tecQty.dispose();
    tecWeight.dispose();
    fnWeight.dispose();
  }

  void selectGender(Gender g) {
    rxGender.value = g;
  }

  Future<void> insertWeight() async {
    final houseNo = rxSelectedHouseNo.value;
    final section = int.tryParse(tecSection.text);
    final qty = int.tryParse(tecQty.text);
    final weight = int.tryParse(tecWeight.text);
    final gender = rxGender.value;

    if (houseNo == null) {
      XanX.showErrorDialog(message: "Please select house");
      return;
    }

    if (section == null) {
      XanX.showErrorDialog(message: "Please enter section");
      return;
    }

    if (qty == null) {
      XanX.showErrorDialog(message: "Please enter quantity");
      return;
    }

    if (weight == null) {
      XanX.showErrorDialog(message: "Please enter weight");
      return;
    }

    if (gender == null) {
      XanX.showErrorDialog(message: "Please select gender");
      return;
    }

    final visitWeight = BroFa2VisitWeightTbCompanion(
      broFa2VisitId: Value(visitId),
      houseNo: Value(houseNo),
      section: Value(section),
      weight: Value(weight),
      qty: Value(qty),
      gender: Value(gender.toString().split(".").last),
    );

    await db.broFa2VisitWeightDao.insert(visitWeight);

    tecWeight.clear();
    FocusScope.of(Get.context!).requestFocus(fnWeight);
  }

  Future<void> deleteWeight(int weightId) async {
    await db.broFa2VisitWeightDao.deleteByPk(weightId);
  }
}
