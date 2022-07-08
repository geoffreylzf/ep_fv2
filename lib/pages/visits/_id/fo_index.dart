import 'package:ep_fv2/controllers/visit/_id/fo_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdFoIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdFoIndexController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flock Observation'),
      ),
      body: Obx(
        () {
          final list = ctrl.rxFoList.value;
          if (list.length == 0) {
            return Container();
          }
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, index) => Divider(height: 0),
            itemBuilder: (ctx, position) {
              final no = position + 1;
              final fo = list[position];

              return InkWell(
                onTap: () {
                  ctrl.openFoSubject(fo);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Obx(
                    () {
                      final widgetList = [];

                      final vfList = ctrl.rxVisitFoList.value;
                      final vf = vfList.firstWhereOrNull(
                        (x) => x.broFa2VisitFo.broFa2FoId == fo.id,
                      );
                      if (vf != null) {
                        if (fo.isFormula) {
                          //  do nothing
                        } else {
                          if (fo.isSelection) {
                            widgetList.add(Text(
                              vf.selectionName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(ctx).primaryColor,
                              ),
                            ));
                          } else {
                            widgetList.add(Text(
                              vf.broFa2VisitFo.answer,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(ctx).primaryColor,
                              ),
                            ));
                          }
                        }

                        if (vf.broFa2VisitFo.comment.isNotEmpty) {
                          widgetList.add(Row(
                            children: [
                              Icon(Icons.comment, size: 16, color: Colors.grey)
                                  .paddingOnly(right: 4),
                              Flexible(
                                child: Text(
                                  vf.broFa2VisitFo.comment,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ));
                        }

                        if (vf.broFa2VisitFo.action.isNotEmpty) {
                          widgetList.add(Row(
                            children: [
                              Icon(Icons.task, size: 16, color: Colors.grey).paddingOnly(right: 4),
                              Flexible(
                                child: Text(
                                  vf.broFa2VisitFo.action,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ));
                        }

                        if (vf.broFa2VisitFo.remark.isNotEmpty) {
                          widgetList.add(Row(
                            children: [
                              Icon(Icons.feedback, size: 16, color: Colors.grey)
                                  .paddingOnly(right: 4),
                              Flexible(
                                child: Text(
                                  vf.broFa2VisitFo.remark,
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
                                no.toString() + ". " + fo.name,
                                style: TextStyle(fontSize: 16),
                              ),
                              if (fo.isAllowPhoto)
                                Row(
                                  children: [
                                    Icon(Icons.image_outlined).paddingOnly(right: 4),
                                    Text(vf?.imgCount.toString() ?? "0"),
                                  ],
                                ),
                            ],
                          ),
                          ...widgetList
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
