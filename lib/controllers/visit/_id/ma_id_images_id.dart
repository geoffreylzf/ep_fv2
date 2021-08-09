import 'dart:io';

import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart';

class VisitIdMaIdImagesIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final maId = int.parse(Get.parameters['id2']!);
  final imgId = int.parse(Get.parameters['id3']!);

  final rxImg = Rxn<BroFa2VisitMaImg>();

  @override
  void onInit() async {
    super.onInit();
    rxImg.value = await db.broFa2VisitMaImgDao.getById(imgId);
  }

  void deleteImg() {
    if (rxImg.value == null) {
      XanX.showErrorDialog(message: "Image is not load or image is not exist, please try again");
      return;
    }
    XanX.showConfirmDialog(
      title: "Delete this image?",
      message: "Are you sure?",
      btnPositiveText: "Delete",
      vcb: () async {
        await File(rxImg.value!.path).delete();
        await db.broFa2VisitMaImgDao.deleteByPk(imgId);
        Get.back();
      },
    );
  }
}
