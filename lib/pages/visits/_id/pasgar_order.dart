import 'package:ep_fv2/controllers/visit/_id/pasgar_order.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class VisitIdPasgarOrderPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdPasgarOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pasgar Score Bird #${ctrl.order}')),
      body: Obx(() {
        if (!ctrl.rxIsInitEnd.value) {
          return Center(child: Text("Loading..."));
        }
        Map<String, RxBool> pgList = {
          "Reflex": ctrl.rxIsChkReflex,
          "Navel": ctrl.rxIsChkNavel,
          "Legs": ctrl.rxIsChkLegs,
          "Beak": ctrl.rxIsChkBeak,
          "Belly": ctrl.rxIsChkBelly,
        };

        final rbList = <Widget>[];
        pgList.forEach((key, rxb) {
          rbList.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                key,
                style: TextStyle(fontWeight: FontWeight.bold),
              ).paddingSymmetric(horizontal: 16, vertical: 8),
              Row(
                children: [
                  ...[false, true].map((b) {
                    return Expanded(
                      child: InkWell(
                        onTap: () => rxb.value = b,
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Radio(
                                value: b,
                                groupValue: rxb.value,
                                onChanged: (v) {
                                  rxb.value = b;
                                },
                              ),
                              Text(b ? "Yes" : "No"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ));
        });

        return ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, idx) => Divider(height: 0),
              itemBuilder: (_, idx) {
                return rbList[idx];
              },
            ),
            Divider(height: 1),
            TextFormField(
              controller: ctrl.tecWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Weight (Gram)",
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Icon(FontAwesomeIcons.weight),
              ),
            ).paddingAll(8),
            Divider(thickness: 12),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: ctrl.rxIsDelectable.value,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.delete),
                        label: Text("DELETE"),
                        onPressed: () => ctrl.onDeleteClick(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FormItemTitle("Total Score"),
                        Text(
                          (10 +
                                  (ctrl.rxIsChkReflex.value ? -1 : 0) +
                                  (ctrl.rxIsChkNavel.value ? -1 : 0) +
                                  (ctrl.rxIsChkLegs.value ? -1 : 0) +
                                  (ctrl.rxIsChkBeak.value ? -1 : 0) +
                                  (ctrl.rxIsChkBelly.value ? -1 : 0))
                              .toString(),
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text("SAVE"),
                      onPressed: () => ctrl.onSaveClick(),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
