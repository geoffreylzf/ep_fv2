import 'package:ep_fv2/db/dao/bro_fa2_visit.dart';
import 'package:ep_fv2/db/dao/bro_fa2_visit_weight.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

const MANAGEMENT_AUDIT_OTHERS_ID = 401;

class VisitIdFarmerReportController extends GetxController {
  final db = XanX.db();
  final id = int.parse(Get.parameters['id']!);

  final rxBroFa2VisitWithData = Rx<BroFa2VisitWithData?>(null);
  final rxBroFa2VisitMa = Rx<BroFa2VisitMa?>(null);
  final rxBodyWgtSummaryList = Rx<List<BodyWgtSummary>>([]);
  final rxScheduleList = Rx<List<BroProdSchedule>>([]);

  final rxSelectedScheduleId = Rxn<int>();

  @override
  void onInit() async {
    super.onInit();

    rxBroFa2VisitWithData.value = await db.broFa2VisitDao.getDataById(id);

    rxBroFa2VisitMa.value =
        await db.broFa2VisitMaDao.getByVisitIdMaId(id, MANAGEMENT_AUDIT_OTHERS_ID);

    rxBodyWgtSummaryList.value = await db.broFa2VisitWeightDao.getSummaryByVisitId(id);

    rxScheduleList.value = await db.broProdScheduleDao.getAll();
    if (rxScheduleList.value.length > 0) {
      rxSelectedScheduleId.value = rxScheduleList.value[0].id;
      populateStdWgt();
    }
  }

  void populateStdWgt() async {
    if (rxSelectedScheduleId.value == null) {
      clearStdWgt();
      return;
    }

    final dt = await db.broProdScheduleDetailDao.getByBroProdScheduleIdDayNo(
      rxSelectedScheduleId.value!,
      rxBroFa2VisitWithData.value!.broFa2Visit.age,
    );

    if (dt == null) {
      clearStdWgt();
      return;
    }
    rxBodyWgtSummaryList.value.forEach((x) {
      if (x.gender == "A") {
        x.stdWgt = dt.ahBodyWgt;
      } else if (x.gender == "F") {
        x.stdWgt = dt.femaleBodyWgt;
      } else if (x.gender == "M") {
        x.stdWgt = dt.maleBodyWgt;
      }
    });
    rxBodyWgtSummaryList.refresh();
  }

  void clearStdWgt() {
    rxBodyWgtSummaryList.value.forEach((x) {
      x.stdWgt = 0;
    });
    rxBodyWgtSummaryList.refresh();
  }
}
