import 'package:ep_fv2/controllers/visit/_id/do_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdDoIdPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdDoIdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${ctrl.rxDo.value?.name}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            List<Widget> wgAnswer = [];
            final dob = ctrl.rxDo.value;
            if (dob != null) {
              final isFormula = dob.isFormula;
              if (isFormula) {
                if (dob.formula == FORMULA_DO_WEIGHT) {
                  wgAnswer = [
                    Text(
                      "Please refer body weight module",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ];
                } else if (dob.formula == FORMULA_DO_PASGAR_SCORE) {
                  wgAnswer = [
                    Text(
                      "Please refer pasgar module",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ];
                }
              } else {
                if (dob.formula == FORMULA_DO_PASGAR_CRITERIA) {
                  final selList = ctrl.rxSelectedPasgarCriteriaList.value;
                  wgAnswer = [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: ctrl.pasgarCriteriaList.length,
                      itemBuilder: (ctx, idx) {
                        final pc = ctrl.pasgarCriteriaList[idx];

                        var bgColor = Theme.of(context).scaffoldBackgroundColor;
                        var isSelected = false;

                        if (selList.contains(pc)) {
                          bgColor = Theme.of(context).primaryColorLight;
                          isSelected = true;
                        }
                        return InkWell(
                          onTap: () => ctrl.selectPasgarCriteria(pc),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            color: bgColor,
                            child: Row(
                              children: [
                                Expanded(child: Text(pc.toUpperCase())),
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (_) => ctrl.selectPasgarCriteria(pc),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ];
                } else {
                  final isNumber = dob.isNumber;
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
            );
          },
        ),
      ),
    );
  }
}
