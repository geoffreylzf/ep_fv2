import 'package:ep_fv2/controllers/visit/_id/fo/index.dart';
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        no.toString() + ". " + fo.name,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text("answer"),
                    ],
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
