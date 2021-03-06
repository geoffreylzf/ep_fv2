import 'package:ep_fv2/controllers/visit/_id/weight_index.dart';
import 'package:ep_fv2/utils/enum.dart';
import 'package:ep_fv2/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class VisitIdWeightIndexPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdWeightIndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text('Weight'),
          bottom: TabBar(
            controller: ctrl.tabController,
            tabs: [
              Container(height: 28, child: Tab(icon: Icon(FontAwesomeIcons.weight, size: 16))),
              Container(height: 28, child: Tab(icon: Icon(Icons.view_list, size: 16))),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: ctrl.tabController,
        children: [
          Row(
            children: [
              Expanded(flex: 5, child: WeightShortList()),
              VerticalDivider(width: 0),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeightEntry(),
                  )),
            ],
          ),
          WeightSummary(),
        ],
      ),
    );
  }
}

class WeightShortList extends StatelessWidget {
  final ctrl = Get.find<VisitIdWeightIndexController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: ListHeader("#")),
                Expanded(flex: 2, child: ListHeader("H#")),
                Expanded(flex: 2, child: ListHeader("G#")),
                Expanded(flex: 3, child: ListHeader("Wgt(g)"))
              ],
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            final list = ctrl.rxVisitWeightList.value;
            if (list.length == 0) {
              return Text("No Data");
            }
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, position) {
                final no = list.length - position;
                final temp = list[position];
                var bgColor = Theme.of(ctx).scaffoldBackgroundColor;

                if (no % 2 == 0) {
                  bgColor = Theme.of(ctx).highlightColor;
                }

                return Container(
                  color: bgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            no.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              temp.houseNo.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              temp.gender.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              temp.weight.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

class WeightEntry extends StatelessWidget {
  final ctrl = Get.find<VisitIdWeightIndexController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormItemTitle("House No"),
          Obx(
            () => DropdownButton<int>(
              hint: Text("House No"),
              isExpanded: true,
              elevation: 16,
              value: ctrl.rxSelectedHouseNo.value,
              onChanged: (v) {
                ctrl.rxSelectedHouseNo.value = v;
              },
              underline: Container(
                height: 2,
                color: Theme.of(context).primaryColorLight,
              ),
              items: ctrl.rxHouseNoList.value.map(
                (r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(r.toString()),
                  );
                },
              ).toList(),
            ),
          ),
          TextFormField(
            controller: ctrl.tecSection,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Section",
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Icon(Icons.change_history)),
            validator: (value) {
              if (value!.isEmpty) {
                return "Cannot blank";
              }
              if (int.tryParse(value) == null) {
                return "Number only";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Gender",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Radio<Gender>(
                      value: Gender.A,
                      groupValue: ctrl.rxGender.value,
                      onChanged: (value) {
                        ctrl.selectGender(value!);
                      },
                    ),
                    Text("A.H."),
                  ],
                ),
                Row(
                  children: [
                    Radio<Gender>(
                      value: Gender.M,
                      groupValue: ctrl.rxGender.value,
                      onChanged: (value) {
                        ctrl.selectGender(value!);
                      },
                    ),
                    Text("Male"),
                  ],
                ),
                Row(
                  children: [
                    Radio<Gender>(
                      value: Gender.F,
                      groupValue: ctrl.rxGender.value,
                      onChanged: (value) {
                        ctrl.selectGender(value!);
                      },
                    ),
                    Text("Female"),
                  ],
                )
              ],
            ),
          ),
          TextFormField(
            controller: ctrl.tecQty,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Quantity",
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Icon(FontAwesomeIcons.dove)),
            validator: (value) {
              if (value!.isEmpty) {
                return "Cannot blank";
              }
              if (int.tryParse(value) == null) {
                return "Number only";
              }
              return null;
            },
          ),
          TextFormField(
            controller: ctrl.tecWeight,
            focusNode: ctrl.fnWeight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Weight (Gram)",
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Icon(FontAwesomeIcons.weight)),
            validator: (value) {
              if (value!.isEmpty) {
                return "Cannot blank";
              }
              if (int.tryParse(value) == null) {
                return "Number only";
              }
              return null;
            },
          ).paddingOnly(top: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(Icons.arrow_back),
              label: Text("SAVE"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ctrl.insertWeight();
                }
              },
            ),
          ).paddingOnly(top: 8),
        ],
      ),
    );
  }
}

class WeightSummary extends StatelessWidget {
  final ctrl = Get.find<VisitIdWeightIndexController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(Get.context!).primaryColorDark,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(flex: 1, child: ListHeader("#")),
                Expanded(flex: 2, child: ListHeader("House")),
                Expanded(flex: 2, child: ListHeader("Section")),
                Expanded(flex: 2, child: ListHeader("Gender")),
                Expanded(flex: 2, child: ListHeader("Quantity")),
                Expanded(flex: 3, child: ListHeader("Weight(Gram)")),
              ],
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            final list = ctrl.rxVisitWeightList.value;
            if (list.length == 0) {
              return Text("No Data");
            }
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, position) {
                final no = list.length - position;
                final temp = list[position];
                var bgColor = Theme.of(ctx).scaffoldBackgroundColor;

                if (no % 2 == 0) {
                  bgColor = Theme.of(ctx).highlightColor;
                }

                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: PageStorageKey(list[position].id.toString()),
                  onDismissed: (direction) {
                    ctrl.deleteWeight(list[position].id);
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete this data?"),
                            content: Text("Weight : ${temp.weight} gram"),
                            actions: <Widget>[
                              TextButton(
                                child: Text("CANCEL"),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: Text("DELETE"),
                                onPressed: () {
                                  Get.back(result: true);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    color: bgColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1, child: Text(no.toString(), textAlign: TextAlign.center)),
                          Expanded(
                              flex: 2,
                              child: Text(temp.houseNo.toString(), textAlign: TextAlign.center)),
                          Expanded(
                              flex: 2,
                              child: Text(temp.section.toString(), textAlign: TextAlign.center)),
                          Expanded(flex: 2, child: Text(temp.gender, textAlign: TextAlign.center)),
                          Expanded(
                              flex: 2,
                              child: Text(temp.qty.toString(), textAlign: TextAlign.center)),
                          Expanded(
                              flex: 3,
                              child: Text(temp.weight.toString(), textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          child: Text(
            "Swipe left to delete",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Table(
                children: [
                  TableRow(decoration: BoxDecoration(color: Colors.black), children: [
                    Text(" "),
                    Text("Ttl Qty",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                    Text("Ttl Weight",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                    Text("Avg Weight",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                  ]),
                  TableRow(children: [
                    Text("As-Hatched", textAlign: TextAlign.center),
                    Text(ctrl.rxSumQtyAh.toString(), textAlign: TextAlign.right),
                    Text(ctrl.rxSumWgtAh.toString(), textAlign: TextAlign.right),
                    Text((ctrl.rxSumWgtAh.value / ctrl.rxSumQtyAh.value).toStringAsFixed(3), textAlign: TextAlign.right),
                  ]),
                  TableRow(children: [
                    Text("Male", textAlign: TextAlign.center),
                    Text(ctrl.rxSumQtyMale.toString(), textAlign: TextAlign.right),
                    Text(ctrl.rxSumWgtMale.toString(), textAlign: TextAlign.right),
                    Text((ctrl.rxSumWgtMale.value / ctrl.rxSumQtyMale.value).toStringAsFixed(3), textAlign: TextAlign.right),
                  ]),
                  TableRow(children: [
                    Text("Female", textAlign: TextAlign.center),
                    Text(ctrl.rxSumQtyFemale.toString(), textAlign: TextAlign.right),
                    Text(ctrl.rxSumWgtFemale.toString(), textAlign: TextAlign.right),
                    Text((ctrl.rxSumWgtFemale.value / ctrl.rxSumQtyFemale.value).toStringAsFixed(3), textAlign: TextAlign.right),
                  ]),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ListHeader extends StatelessWidget {
  final String text;

  ListHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
