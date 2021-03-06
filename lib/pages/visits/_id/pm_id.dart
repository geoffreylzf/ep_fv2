import 'package:ep_fv2/controllers/visit/_id/pm_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdPmIdPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdPmIdController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${ctrl.rxPm.value?.name}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
              () {
            List<Widget> wgAnswer = [];
            final pm = ctrl.rxPm.value;
            return ListView(
              children: [
                ...wgAnswer,
                Row(
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: pm?.isAllowPhoto ?? false,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.image_outlined),
                          label: Text("IMAGE (" + ctrl.rxImgCount.value.toString() + ")"),
                          onPressed: () => ctrl.onImgButtonClick(),
                        ),
                      ),
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.save),
                        label: Text("SAVE"),
                        onPressed: () => ctrl.onSaveButtonClick(),
                      ),
                    ),
                  ],
                ).paddingOnly(top: 8),
                Container(height: 8),
                TextField(
                  controller: ctrl.tecComment,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 300,
                  decoration: InputDecoration(
                    icon: Icon(Icons.comment),
                    border: OutlineInputBorder(),
                    labelText: "Comment",
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                Container(height: 8),
                TextField(
                  controller: ctrl.tecAction,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 300,
                  decoration: InputDecoration(
                    icon: Icon(Icons.task),
                    border: OutlineInputBorder(),
                    labelText: "Action",
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                Container(height: 8),
                TextField(
                  controller: ctrl.tecRemark,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 300,
                  decoration: InputDecoration(
                    icon: Icon(Icons.feedback),
                    border: OutlineInputBorder(),
                    labelText: "Remark",
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
