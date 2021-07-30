import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VisitCreateController extends GetxController {
  final db = XanX.db();

  final tecFilterLocation = TextEditingController();
  final fnFilterLocation = FocusNode();
  final rxFilterLocationWord = ''.obs;
  final tecVisitDate = TextEditingController();
  final tecAge = TextEditingController();
  final tecHouseNo = TextEditingController();
  final fnAge = FocusNode();

  final dateFormat = DateFormat('yyyy-MM-dd');

  final rxCompanyList = Rx<List<Company>>([]);
  final rxLocationList = Rx<List<Location>>([]);
  final rxLocHouseList = Rx<List<LocHouse>>([]);

  final rxCurrentStep = 0.obs;

  final rxSelectedCompany = Rxn<Company>();
  final rxSelectedLocation = Rxn<Location>();
  final rxSelectedHouseNoList = Rx<List<int>>([]);
  final rxSelectedVisitDate = Rxn<String>();
  final rxSelectedAge = Rxn<String>();

  @override
  void onInit() async {
    super.onInit();
    rxCompanyList.value = await db.companyDao.getAll();

    tecFilterLocation.addListener(() {
      rxFilterLocationWord.value = tecFilterLocation.text;
    });

    debounce(
      rxFilterLocationWord,
      (word) async {
        if (rxSelectedCompany.value != null) {
          rxLocationList.value = await db.locationDao.getAllByCompanyIdWord(
            rxSelectedCompany.value!.id,
            word: word.toString(),
          );
        }
      },
      time: Duration(milliseconds: 500),
    );

    tecVisitDate.addListener(() {
      rxSelectedVisitDate.value = tecVisitDate.text;
    });

    final today = dateFormat.format(DateTime.now());
    tecVisitDate.text = today;

    tecAge.addListener(() {
      rxSelectedAge.value = tecAge.text;
    });
  }

  @override
  Future<void> onClose() async {
    tecFilterLocation.dispose();
    fnFilterLocation.dispose();
    tecVisitDate.dispose();
    tecHouseNo.dispose();
    tecAge.dispose();
    fnAge.dispose();
  }

  void selectStep(int step) {
    if (step < rxCurrentStep.value) {
      rxCurrentStep.value = step;
    }
  }

  void selectCompany(Company coy) async {
    rxSelectedCompany.value = coy;
    rxLocationList.value = await db.locationDao.getAllByCompanyIdWord(coy.id);
    rxSelectedLocation.value = null;
    rxSelectedHouseNoList.value = [];
    rxCurrentStep.value = 1;
    FocusScope.of(Get.context!).requestFocus(fnFilterLocation);
  }

  void selectLocation(Location loc) async {
    rxSelectedLocation.value = loc;
    rxLocHouseList.value = await db.locHouseDao.getAllByLocationId(loc.id);
    rxSelectedHouseNoList.value = [];
    rxCurrentStep.value = 2;
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
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
    if(h == null){
      XanX.showErrorDialog(message: "Please enter valid house # (number only)");
      return;
    }

    if(rxLocHouseList.value.map((e) => e.houseNo).contains(h)){
      XanX.showErrorDialog(message: "This house # already exist in selection");
      return;
    }

    selectHouseNo(h);
  }

  void onHouseNoContinue() {
    if(rxSelectedHouseNoList.value.length == 0){
      XanX.showErrorDialog(message: "Please select at least 1 house");
      return;
    }
    rxCurrentStep.value = 4;
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
  }

  void onVisitDateContinue() {
    rxCurrentStep.value = 3;
    FocusScope.of(Get.context!).requestFocus(fnAge);
  }

  void onCreateButtonClick() {
    if (rxSelectedCompany.value == null) {
      XanX.showErrorDialog(message: "Please choose company");
      return;
    }

    if (rxSelectedLocation.value == null) {
      XanX.showErrorDialog(message: "Please choose location");
      return;
    }

    if (rxSelectedVisitDate.value == null) {
      XanX.showErrorDialog(message: "Please select date");
      return;
    }

    final age = int.tryParse(rxSelectedAge.value!) ?? null;
    if (age == null) {
      XanX.showErrorDialog(message: "Please enter age");
      return;
    }
  }
}
