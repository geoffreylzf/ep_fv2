import 'package:ep_fv2/controllers/visit/_id/pasgar_index.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdPasgarIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdPasgarIndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pasgar Score')),
      body: Obx(
        () {
          final list = ctrl.rxVisitPasgarList.value;
          if (list.length == 0) {
            return Center(
              child: Text("No pasgar score record, press + button to enter"),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormItemTitle("Total bird"),
                        Text(
                          ctrl.rxTtlCount.value.toString(),
                        ),
                      ],
                    ).paddingAll(12),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormItemTitle("Pasgar Avg Score"),
                        Text(
                          ctrl.rxPasgarAvgScore.value.toStringAsFixed(3),
                        ),
                      ],
                    ).paddingAll(12),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormItemTitle("Avg Weight"),
                        Text(
                          ctrl.rxAvgWeightScore.value.toStringAsFixed(3),
                        ),
                      ],
                    ).paddingAll(12),
                  ),
                ],
              ),
              Divider(height: 0),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  separatorBuilder: (_, index) => Divider(height: 0),
                  itemBuilder: (_, idx) {
                    final pg = list[list.length - 1 - idx];
                    return ListTile(
                      title: Text('Bird #${pg.order}'),
                      subtitle: Row(
                        children: [
                          Text("Pasgar Score: " +
                              (10 +
                                      (pg.isChkReflex ? -1 : 0) +
                                      (pg.isChkNavel ? -1 : 0) +
                                      (pg.isChkLegs ? -1 : 0) +
                                      (pg.isChkBeak ? -1 : 0) +
                                      (pg.isChkBelly ? -1 : 0))
                                  .toString()),
                          Container(width: 24,),
                          Text("Weight (Gram): "+pg.weight.toString()),
                        ],
                      ),
                      onTap: () => ctrl.onViewClick(pg.order),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ctrl.onCreateClick(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
