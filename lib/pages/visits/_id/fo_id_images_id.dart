import 'dart:io';

import 'package:ep_fv2/controllers/visit/_id/fo_id_images_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitIdFoIdImagesIdPage extends StatelessWidget {
  final ctrl = Get.put(VisitIdFoIdImagesIdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => ctrl.deleteImg(),
          ),
        ],
      ),
      body: Obx(
        () {
          if (ctrl.rxImg.value == null) {
            return Container();
          }
          return Image.file(File(ctrl.rxImg.value!.path));
        },
      ),
    );
  }
}
