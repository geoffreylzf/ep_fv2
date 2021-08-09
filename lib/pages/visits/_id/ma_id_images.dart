import 'dart:io';

import 'package:ep_fv2/controllers/visit/_id/ma_id_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdMaIdImagesPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdMaIdImagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${ctrl.rxMa.value?.name}' + ' Images')),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => ctrl.openCamera(),
          ),
          IconButton(
            icon: Icon(Icons.add_photo_alternate_outlined),
            onPressed: () => ctrl.openImagePicker(),
          )
        ],
      ),
      body: Obx(() {
        final imgList = ctrl.rxVisitMaImgList.value;

        if (imgList.length == 0) {
          return Center(child: Text("No images"));
        }

        return GridView.count(
          crossAxisCount: 3,
          children: [
            ...imgList
                .map(
                  (e) => InkWell(
                onTap: () {
                  ctrl.onImgClick(e.id);
                },
                child: Image.file(File(e.path)),
              ),
            )
                .toList(),
          ],
        );
      }),
    );
  }
}
