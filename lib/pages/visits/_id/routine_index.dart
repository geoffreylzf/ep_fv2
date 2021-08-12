import 'package:ep_fv2/controllers/visit/_id/routine_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class VisitIdRoutineIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdRoutineIndexController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routine'),
      ),
      body: Obx(() {
        final list = ctrl.rxRoutineList.value;
        if (list.length == 0) {
          return Container();
        }
        return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, index) => Divider(height: 0),
            itemBuilder: (ctx, position) {
              final no = position + 1;
              final dob = list[position];

              return InkWell(
                onTap: () {
                  ctrl.openRoutineSubject(dob);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Obx(() {
                    final widgetList = [];

                    final vdList = ctrl.rxVisitRoutineList.value;
                    final vd = vdList.firstWhereOrNull(
                      (x) => x.broFa2RoutineId == dob.id,
                    );

                    if (vd != null) {
                      if (vd.comment.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.comment, size: 16, color: Colors.grey).paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.comment,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vd.action.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.task, size: 16, color: Colors.grey).paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.action,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vd.remark.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.feedback, size: 16, color: Colors.grey)
                                .paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.remark,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          no.toString() + ". " + dob.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        ...widgetList
                      ],
                    );
                  }),
                ),
              );
            });
      }),
    );
  }
}
