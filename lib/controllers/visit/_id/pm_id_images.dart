import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' hide Value;
import 'package:image_picker/image_picker.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class VisitIdPmIdImagesController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final pmId = int.parse(Get.parameters['id2']!);

  final rxPm = Rxn<BroFa2Pm>();
  final rxVp = Rxn<BroFa2VisitPm>();
  final rxVisitPmImgList = Rx<List<BroFa2VisitPmImg>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxPm.value = await db.broFa2PmDao.getById(pmId);
    rxVp.value = await db.broFa2VisitPmDao.getByVisitIdPmId(visitId, pmId);
    if (rxVp.value == null) {
      Get.back();
      XanX.showErrorDialog(message: "Please save first before go to images");
      return;
    }

    db.broFa2VisitPmImgDao.watchAllByVisitPmId(rxVp.value!.id).listen((imgList) {
      rxVisitPmImgList.value = imgList;
    });
  }

  Future<void> openImagePicker() async {
    await getImg(ImageSource.gallery);
  }

  Future<void> openCamera() async {
    await getImg(ImageSource.camera);
  }

  Future<void> getImg(ImageSource source) async {
    final newImg = await ImagePicker().pickImage(source: source);
    if (newImg != null) {
      final newPath = join((await getExternalStorageDirectory())!.path, '${DateTime.now()}.jpeg');

      await FlutterImageCompress.compressAndGetFile(
        newImg.path,
        newPath,
        quality: 80,
      );

      await db.broFa2VisitPmImgDao.insert(BroFa2VisitPmImgTbCompanion(
        broFa2VisitPmId: Value(rxVp.value!.id),
        path: Value(newPath),
      ));
    }
  }

  void onImgClick(int imgId) {
    Get.toNamed("${Get.currentRoute}/$imgId");
  }
}
