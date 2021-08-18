import 'package:ep_fv2/controllers/upload.dart';
import 'package:ep_fv2/widgets/local_cb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends StatelessWidget {
  final ctrl = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: UploadLog()),
          VerticalDivider(width: 0),
          Expanded(child: UploadStatus()),
        ],
      ),
    );
  }
}

class UploadLog extends StatelessWidget {
  final ctrl = Get.find<UploadController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = ctrl.rxLogList.value;
      return ListView.separated(
        itemCount: list.length,
        shrinkWrap: true,
        separatorBuilder: (_, index) => Divider(height: 0),
        itemBuilder: (_, idx) {
          final log = list[idx];
          return ListTile(
            title: Text(log.remark),
            subtitle: Text(log.timestamp),
          );
        },
      );
    });
  }
}

class UploadStatus extends StatelessWidget {
  final ctrl = Get.find<UploadController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not yet upload image").paddingOnly(bottom: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              ctrl.rxImgNotYetUploadCount.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Icon(Icons.image_outlined),
          ],
        ).paddingOnly(bottom: 36),
        Text("Pending not yet upload data"),
        Obx(() => Text(
              ctrl.rxVisitNotYetUploadCount.toString(),
              style: TextStyle(fontSize: 200),
            )),
        ElevatedButton.icon(
          onPressed: () => ctrl.upload(),
          icon: Icon(Icons.cloud_upload),
          label: Text("UPLOAD"),
        ),
        Container(height: 36),
        LocalCheckBox(),
      ],
    );
  }
}
