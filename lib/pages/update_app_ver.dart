import 'package:ep_fv2/controllers/update_app_ver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAppVerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(UpdateAppVerController());

    return Scaffold(
      appBar: AppBar(title: Text('Update App Version')),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Version Code : ${ctrl.verCode.value}"),
              Text("Version Name : ${ctrl.verName.value}"),
              ElevatedButton.icon(
                onPressed: () => ctrl.updateApp(),
                icon: Icon(Icons.update),
                label: Text("UPDATE APP VERSION"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
