import 'package:ep_fv2/controllers/setup.dart';
import 'package:ep_fv2/widgets/local_cb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SetupController());

    return Scaffold(
      appBar: AppBar(title: Text('Setup')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ...ctrl.setupMap.entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                          child: StreamBuilder<int>(
                            initialData: 0,
                            stream: e.value.dao.watchCountAll(),
                            builder: (ctx, snapshot) {
                              final c = snapshot.data;
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                color: Theme.of(context).primaryColorLight,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(e.key),
                                          Text(c.toString()),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 24.0),
                                        child: InkWell(
                                          onTap: () {
                                            ctrl.retrieveByKey(e.key);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                            child: Obx(
                                              () => Text(
                                                e.value.isRefreshing.value
                                                    ? "LOADING..."
                                                    : "REFRESH",
                                                style: TextStyle(
                                                  color: Colors.lightBlue,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: LocalCheckBox()),
                Container(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.cloud_download),
                    label: Text("RETRIEVE SETUP"),
                    onPressed: () {
                      ctrl.retrieveAllData();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
