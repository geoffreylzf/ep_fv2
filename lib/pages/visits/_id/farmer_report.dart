import 'package:ep_fv2/controllers/visit/_id/farmer_report.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VisitIdFarmerReportPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdFarmerReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Header().paddingOnly(bottom: 16),
            MgmtOther().paddingOnly(bottom: 16),
            BreederType().paddingOnly(bottom: 16),
            WgtSummary(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final ctrl = Get.find<VisitIdFarmerReportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final visit = ctrl.rxBroFa2VisitWithData.value;
      if (visit == null) {
        return Container();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${visit.companyCode} ~ ${visit.companyName}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      "${visit.locationCode} ~ ${visit.locationName} ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.home),
                  Container(width: 8),
                  Text(
                    "${visit.houseNoList.join(", ")}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.today_outlined),
                  Container(width: 8),
                  Text(
                    "Schedule Day " +
                        (visit.broFa2Visit.scheduleDay ?? '-').toString() +
                        " Age " +
                        visit.broFa2Visit.age.toString(),
                  ),
                ],
              ),
              Text(
                visit.broFa2Visit.timestamp,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          if (visit.broFa2Visit.isUpload) Icon(Icons.cloud_upload),
        ],
      );
    });
  }
}

class MgmtOther extends StatelessWidget {
  final ctrl = Get.find<VisitIdFarmerReportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final mgmtOther = ctrl.rxBroFa2VisitMa.value;
        if (mgmtOther == null) {
          return Container();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormItemTitle("Comment"),
            Text(mgmtOther.comment).paddingOnly(bottom: 8),
            FormItemTitle("Action"),
            Text(mgmtOther.action).paddingOnly(bottom: 8),
            FormItemTitle("Remark"),
            Text(mgmtOther.remark).paddingOnly(bottom: 8),
          ],
        );
      },
    );
  }
}

class WgtSummary extends StatelessWidget {
  final ctrl = Get.find<VisitIdFarmerReportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final wgtList = ctrl.rxBodyWgtSummaryList.value;
      if (wgtList.length == 0) {
        return Text("No body weight data");
      }

      final trList = [];
      final intFormatter = NumberFormat("#,##0", "en_US");
      final decimalFormatter = NumberFormat("#,##0.00", "en_US");

      final genderMap = <String, String>{
        "A": "As-Hatched",
        "F": "Female",
        "M": "Male",
      };

      wgtList.forEach((w) {
        trList.add(TableRow(
          children: [
            Text(genderMap[w.gender]!, textAlign: TextAlign.center),
            Text(intFormatter.format(w.ttlQty), textAlign: TextAlign.right),
            Text(intFormatter.format(w.ttlWgt), textAlign: TextAlign.right),
            Text(decimalFormatter.format(w.avgWgt), textAlign: TextAlign.right),
            Text(decimalFormatter.format(w.stdWgt), textAlign: TextAlign.right),
          ],
        ));
      });

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormItemTitle("Body Weight Data"),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Table(
              children: [
                TableRow(decoration: BoxDecoration(color: Colors.black), children: [
                  Text("Gender",
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                  Text("Ttl Qty",
                      textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
                  Text("Ttl Weight",
                      textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
                  Text("Avg Weight",
                      textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
                  Text("Std Weight",
                      textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
                ]),
                ...trList,
              ],
            ),
          ),
        ],
      );
    });
  }
}

class BreederType extends StatelessWidget {
  final ctrl = Get.find<VisitIdFarmerReportController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormItemTitle("Breeder Type"),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => DropdownButton<int>(
                  hint: Text("Breeder Type"),
                  isExpanded: true,
                  elevation: 16,
                  value: ctrl.rxSelectedScheduleId.value,
                  onChanged: (v) {
                    ctrl.rxSelectedScheduleId.value = v;
                    ctrl.populateStdWgt();
                  },
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  items: ctrl.rxScheduleList.value.map(
                    (r) {
                      return DropdownMenuItem(
                        value: r.id,
                        child: Text(r.breTypeCode),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
