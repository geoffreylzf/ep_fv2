import 'package:ep_fv2/controllers/visit/_id/ma_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdMaIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdMaIndexController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management Audit'),
      ),
      body: Obx(() {
        final list = ctrl.rxMaList.value;
        if (list.length == 0) {
          return Container();
        }
        return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, index) => Divider(height: 0),
            itemBuilder: (ctx, position) {
              final no = position + 1;
              final ma = list[position];

              return InkWell(
                onTap: () {
                  ctrl.openMaSubject(ma);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Obx(() {
                    final widgetList = [];

                    final vpList = ctrl.rxVisitMaList.value;
                    final vm = vpList.firstWhereOrNull(
                          (x) => x.broFa2VisitMa.broFa2MaId == ma.id,
                    );

                    if (vm != null) {
                      if (vm.broFa2VisitMa.comment.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.comment, size: 16, color: Colors.grey)
                                .paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vm.broFa2VisitMa.comment,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vm.broFa2VisitMa.action.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.task, size: 16, color: Colors.grey)
                                .paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vm.broFa2VisitMa.action,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ));
                      }

                      if (vm.broFa2VisitMa.remark.isNotEmpty) {
                        widgetList.add(Row(
                          children: [
                            Icon(Icons.feedback, size: 16, color: Colors.grey)
                                .paddingOnly(right: 4),
                            Flexible(
                              child: Text(
                                vm.broFa2VisitMa.remark,
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
                              no.toString() + ". " + ma.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Icon(Icons.image_outlined).paddingOnly(right: 4),
                                Text(vm?.imgCount.toString() ?? "0"),
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
