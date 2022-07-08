import 'package:ep_fv2/controllers/visit/_id/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdUpdatePage extends StatelessWidget {
  final ctrl = Get.put(VisitIdUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Visit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected House (Please select same age house)",
                style: TextStyle(color: Colors.grey),
              ).paddingOnly(bottom: 8),
              Text(
                ctrl.rxSelectedHouseNoList.value.join(", "),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).paddingOnly(left: 8, bottom: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 160,
                  mainAxisExtent: 40,
                ),
                itemCount: ctrl.rxLocHouseList.value.length,
                itemBuilder: (ctx, idx) {
                  final hse = ctrl.rxLocHouseList.value[idx];
                  var bgColor = Theme.of(context).scaffoldBackgroundColor;
                  var isSelected = false;

                  if (ctrl.rxSelectedHouseNoList.value.contains(hse.houseNo)) {
                    bgColor = Theme.of(context).primaryColorLight;
                    isSelected = true;
                  }

                  return InkWell(
                    onTap: () => ctrl.selectHouseNo(hse.houseNo),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      color: bgColor,
                      child: Row(
                        children: [
                          Expanded(child: Text("#${hse.houseNo.toString()}")),
                          Checkbox(
                            value: isSelected,
                            onChanged: (_) => ctrl.selectHouseNo(hse.houseNo),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).paddingOnly(bottom: 8),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: ctrl.tecHouseNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ad. Hse #",
                      contentPadding: EdgeInsets.all(16),
                    ),
                  )),
                  Expanded(
                    child: TextButton(
                      child: Text("Add"),
                      onPressed: () => ctrl.onAdditionalHouseEnter(),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("UPDATE AND BACK"),
                      onPressed: () => ctrl.updateNBack(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
