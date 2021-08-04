import 'package:ep_fv2/controllers/visit/_id/fo_id.dart';
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
            final fo = ctrl.rxFo.value;
            if (fo != null) {
              final isFormula = fo.isFormula;
              final isSelection = fo.isSelection;
              final isNumber = fo.isNumber;
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
              } else {
                if (fo.formula == "te+rh") {
                  wgAnswer = [
                    Text(
                      "Temperature Environment 'C + Relative Humidity %",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ];
                }
              }
            }
            return ListView(
              children: [
                ...wgAnswer,
                Row(
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: fo?.isAllowPhoto ?? false,
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
