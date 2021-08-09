import 'package:ep_fv2/controllers/visit/_id/pasgar_index.dart';
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
              Text(
                "Pasgar Avg Score: " + ctrl.rxPasgarAvgScore.value.toStringAsFixed(3),
              ).paddingAll(16),
              Divider(height: 0),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  separatorBuilder: (_, index) => Divider(height: 0),
                  itemBuilder: (_, idx) {
                    final pg = list[idx];
                    return ListTile(
                      title: Text('Bird #${pg.order}'),
                      subtitle: Text("Score " +
                          (10 +
                                  (pg.isChkReflex ? -1 : 0) +
                                  (pg.isChkNavel ? -1 : 0) +
                                  (pg.isChkLegs ? -1 : 0) +
                                  (pg.isChkBeak ? -1 : 0) +
                                  (pg.isChkBelly ? -1 : 0))
                              .toString()),
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
