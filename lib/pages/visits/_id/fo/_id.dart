import 'package:ep_fv2/controllers/visit/_id/fo/_id.dart';
import 'package:ep_fv2/controllers/visit/_id/fo/index.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdFoIdPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdFoIdController());

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${ctrl.rxFo.value?.name}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            List<Widget> wgAnswer = [];
            if (ctrl.rxFo.value != null) {
              final isFormula = ctrl.rxFo.value!.isFormula;
              final isSelection = ctrl.rxFo.value!.isSelection;
              final isNumber = ctrl.rxFo.value!.isNumber;
              if (!isFormula) {
                if (isSelection) {
                  wgAnswer = [
                    FormItemTitle("Answer"),
                    Column(
                      children: [
                        ...ctrl.rxFoSelectionList.value
                            .map(
                              (e) => InkWell(
                                onTap: () => ctrl.rxSelection.value = e,
                                child: Container(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: e,
                                        groupValue: ctrl.rxSelection.value,
                                        onChanged: (v) {
                                          ctrl.rxSelection.value = e;
                                        },
                                      ),
                                      Text(e.name),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList()
                      ],
                    )
                  ];
                } else {
                  wgAnswer = [
                    TextField(
                      controller: ctrl.tecAnswer,
                      autofocus: true,
                      maxLength: 100,
                      keyboardType: isNumber
                          ? TextInputType.numberWithOptions(decimal: true)
                          : TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Answer",
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ];
                }
              }
            }
            return ListView(
              children: [
                ...wgAnswer,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text("Save"),
                    onPressed: () => ctrl.onSaveButtonClick(),
                  ),
                ).paddingOnly(top: 20)
              ],
            );
          },
        ),
      ),
    );
  }
}
