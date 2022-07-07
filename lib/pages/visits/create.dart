import 'package:ep_fv2/controllers/visit/create.dart';
import 'package:ep_fv2/utils/node_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitCreatePage extends StatelessWidget {
  final ctrl = Get.put(VisitCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Visit')),
      body: Obx(
        () => Stepper(
          currentStep: ctrl.rxCurrentStep.value,
          onStepTapped: (step) => ctrl.selectStep(step),
          controlsBuilder: (BuildContext context, ControlsDetails details) => Container(),
          steps: [
            Step(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose company"),
                  if (ctrl.rxSelectedCompany.value != null)
                    Text(ctrl.rxSelectedCompany.value!.companyName)
                ],
              ),
              isActive: ctrl.rxCurrentStep.value >= 0,
              state: ctrl.rxSelectedCompany.value != null ? StepState.complete : StepState.disabled,
              content: ListView.separated(
                shrinkWrap: true,
                itemCount: ctrl.rxCompanyList.value.length,
                separatorBuilder: (_, idx) => Divider(height: 0),
                itemBuilder: (_, idx) {
                  final coy = ctrl.rxCompanyList.value[idx];

                  var bgColor = Theme.of(context).scaffoldBackgroundColor;
                  var isSelected = false;
                  if (ctrl.rxSelectedCompany.value == coy) {
                    bgColor = Theme.of(context).primaryColorLight;
                    isSelected = true;
                  }

                  return Container(
                    color: bgColor,
                    child: ListTile(
                      title: Text(coy.companyName),
                      subtitle: Text(coy.companyCode),
                      onTap: () => ctrl.selectCompany(coy),
                      trailing: Checkbox(
                        value: isSelected,
                        onChanged: (_) => ctrl.selectCompany(coy),
                      ),
                    ),
                  );
                },
              ),
            ),
            Step(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose location"),
                  if (ctrl.rxSelectedLocation.value != null)
                    Text(ctrl.rxSelectedLocation.value!.locationName)
                ],
              ),
              isActive: ctrl.rxCurrentStep.value >= 1,
              state:
                  ctrl.rxSelectedLocation.value != null ? StepState.complete : StepState.disabled,
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ctrl.tecFilterLocation,
                      focusNode: ctrl.fnFilterLocation,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Search Location",
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.6,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: ctrl.rxLocationList.value.length,
                      separatorBuilder: (_, idx) => Divider(height: 0),
                      itemBuilder: (_, idx) {
                        final loc = ctrl.rxLocationList.value[idx];

                        var bgColor = Theme.of(context).scaffoldBackgroundColor;
                        var isSelected = false;
                        if (ctrl.rxSelectedLocation.value == loc) {
                          bgColor = Theme.of(context).primaryColorLight;
                          isSelected = true;
                        }

                        return Container(
                          color: bgColor,
                          child: ListTile(
                            title: Text(loc.locationName),
                            subtitle: Text(loc.locationCode),
                            onTap: () => ctrl.selectLocation(loc),
                            trailing: Checkbox(
                              value: isSelected,
                              onChanged: (_) => ctrl.selectLocation(loc),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select house (Please select same age house)"),
                  if (ctrl.rxSelectedHouseNoList.value.length != 0)
                    Text(ctrl.rxSelectedHouseNoList.value.join(", "))
                ],
              ),
              isActive: ctrl.rxCurrentStep.value >= 2,
              state: ctrl.rxSelectedHouseNoList.value.length != 0
                  ? StepState.complete
                  : StepState.disabled,
              content: Column(
                children: [
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
                  ),
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
                          child: Text("CONTINUE"),
                          onPressed: () => ctrl.onHouseNoContinue(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Step(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select schedule day"),
                  if (ctrl.rxSelectedScheduleDay.value != null)
                    Text(ctrl.rxSelectedScheduleDay.value!.toString())
                ],
              ),
              isActive: ctrl.rxCurrentStep.value >= 3,
              state: ctrl.rxCurrentStep.value >= 3 ? StepState.complete : StepState.disabled,
              content: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      mainAxisExtent: 40,
                    ),
                    itemCount: 7,
                    itemBuilder: (ctx, idx) {
                      final dayNo = idx * 7;
                      var bgColor = Theme.of(context).scaffoldBackgroundColor;
                      var isSelected = false;

                      if (ctrl.rxSelectedScheduleDay.value == dayNo) {
                        bgColor = Theme.of(context).primaryColorLight;
                        isSelected = true;
                      }

                      return InkWell(
                        onTap: () => ctrl.selectScheduleDay(dayNo),
                        child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          color: bgColor,
                          child: Row(
                            children: [
                              Expanded(child: Text(dayNo.toString())),
                              Checkbox(
                                value: isSelected,
                                onChanged: (_) => ctrl.selectScheduleDay(dayNo),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Step(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select visit date"),
                  if (ctrl.rxSelectedVisitDate.value != null) Text(ctrl.rxSelectedVisitDate.value!)
                ],
              ),
              isActive: ctrl.rxCurrentStep.value >= 4,
              state: ctrl.rxCurrentStep.value >= 4 ? StepState.complete : StepState.disabled,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: ctrl.tecVisitDate,
                    enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                    onTap: () async {
                      var iniDate = DateTime.now();
                      if (ctrl.tecVisitDate.text.isNotEmpty) {
                        iniDate = ctrl.dateFormat.parse(ctrl.tecVisitDate.text);
                      }

                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: iniDate,
                        firstDate: DateTime.now().add(Duration(days: -1000)),
                        lastDate: DateTime.now().add(Duration(days: 1000)),
                      );

                      if (selectedDate != null) {
                        ctrl.tecVisitDate.text = ctrl.dateFormat.format(selectedDate);
                      }

                      FocusScope.of(Get.context!).requestFocus(new FocusNode());
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      labelText: "Visit Date",
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("CONTINUE"),
                    onPressed: () => ctrl.onVisitDateContinue(),
                  )
                ],
              ),
            ),
            Step(
              title: Text("Enter age"),
              isActive: ctrl.rxCurrentStep.value >= 5,
              state: ctrl.rxCurrentStep.value >= 5 ? StepState.complete : StepState.disabled,
              content: Column(
                children: [
                  TextFormField(
                    controller: ctrl.tecAge,
                    focusNode: ctrl.fnAge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Age",
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("CREATE"),
                      onPressed: () => ctrl.onCreateButtonClick(),
                    ),
                  ).paddingOnly(top: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
