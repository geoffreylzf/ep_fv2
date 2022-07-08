import 'package:ep_fv2/controllers/visit/_id/routine_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      (x) => x.broFa2VisitRoutine.broFa2RoutineId == dob.id,
                    );

                    if (vd != null) {
                      if (vd.broFa2VisitRoutine.comment.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.comment, size: 16, color: Colors.grey).paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.broFa2VisitRoutine.comment,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vd.broFa2VisitRoutine.action.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.task, size: 16, color: Colors.grey).paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.broFa2VisitRoutine.action,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vd.broFa2VisitRoutine.remark.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.feedback, size: 16, color: Colors.grey)
                                .paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vd.broFa2VisitRoutine.remark,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              no.toString() + ". " + dob.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Icon(Icons.image_outlined).paddingOnly(right: 4),
                                Text(vd?.imgCount.toString() ?? "0"),
                              ],
                            ),
                          ],
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
