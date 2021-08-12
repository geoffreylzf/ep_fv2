import 'package:ep_fv2/controllers/visit/_id/routine_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdRoutineIdPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdRoutineIdController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${ctrl.rxRoutine.value?.name}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text("SAVE"),
                onPressed: () => ctrl.onSaveButtonClick(),
              ),
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
        ),
      ),
    );
  }
}
