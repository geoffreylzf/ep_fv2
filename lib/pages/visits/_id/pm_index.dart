import 'package:ep_fv2/controllers/visit/_id/pm_index.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class VisitIdPmIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdPmIndexController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Mortem'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItemTitle("Post Mortem Bird Qty"),
                    Obx(() => Text(ctrl.rxPostMortemBirdQty.value.toString())),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text("EDIT QTY"),
                  onPressed: () => ctrl.openPmQtyEntryDialog(),
                ),
              ),
            ],
          ).paddingAll(16),
          Divider(height: 0),
          Expanded(
            child: Obx(() {
              final list = ctrl.rxPmList.value;
              if (list.length == 0) {
                return Container();
              }
              return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (_, index) => Divider(height: 0),
                  itemBuilder: (ctx, position) {
                    final no = position + 1;
                    final pm = list[position];

                    return InkWell(
                      onTap: () {
                        ctrl.openPmSubject(pm);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Obx(() {
                          final widgetList = [];

                          final vpList = ctrl.rxVisitPmList.value;
                          final vp = vpList.firstWhereOrNull(
                            (x) => x.broFa2VisitPm.broFa2PmId == pm.id,
                          );

                          if (vp != null) {
                            if (vp.broFa2VisitPm.comment.isNotEmpty) {
                              widgetList.add(Row(
                                children: [
                                  Icon(Icons.comment, size: 16, color: Colors.grey)
                                      .paddingOnly(right: 4),
                                  Flexible(
                                    child: Text(
                                      vp.broFa2VisitPm.comment,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ));
                            }

                            if (vp.broFa2VisitPm.action.isNotEmpty) {
                              widgetList.add(Row(
                                children: [
                                  Icon(Icons.task, size: 16, color: Colors.grey)
                                      .paddingOnly(right: 4),
                                  Flexible(
                                    child: Text(
                                      vp.broFa2VisitPm.action,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ));
                            }

                            if (vp.broFa2VisitPm.remark.isNotEmpty) {
                              widgetList.add(Row(
                                children: [
                                  Icon(Icons.feedback, size: 16, color: Colors.grey)
                                      .paddingOnly(right: 4),
                                  Flexible(
                                    child: Text(
                                      vp.broFa2VisitPm.remark,
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
                                    no.toString() + ". " + pm.name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  if (pm.isAllowPhoto)
                                    Row(
                                      children: [
                                        Icon(Icons.image_outlined).paddingOnly(right: 4),
                                        Text(vp?.imgCount.toString() ?? "0"),
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
          ),
        ],
      ),
    );
  }
}
