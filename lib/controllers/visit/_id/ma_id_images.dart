import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' hide Value;
import 'package:image_picker/image_picker.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class VisitIdMaIdImagesController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final maId = int.parse(Get.parameters['id2']!);

  final rxMa = Rxn<BroFa2Ma>();
  final rxVp = Rxn<BroFa2VisitMa>();
  final rxVisitMaImgList = Rx<List<BroFa2VisitMaImg>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxMa.value = await db.broFa2MaDao.getById(maId);
    rxVp.value = await db.broFa2VisitMaDao.getByVisitIdMaId(visitId, maId);
    if (rxVp.value == null) {
      Get.back();
      XanX.showErrorDialog(message: "Please save first before go to images");
      return;
    }

    db.broFa2VisitMaImgDao.watchAllByVisitMaId(rxVp.value!.id).listen((imgList) {
      rxVisitMaImgList.value = imgList;
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

      await db.broFa2VisitMaImgDao.insert(BroFa2VisitMaImgTbCompanion(
        broFa2VisitMaId: Value(rxVp.value!.id),
        path: Value(newPath),
      ));
    }
  }

  void onImgClick(int imgId) {
    Get.toNamed("${Get.currentRoute}/$imgId");
  }
}
