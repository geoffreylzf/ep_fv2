import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' hide Value;
import 'package:image_picker/image_picker.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class VisitIdFoIdImagesController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final foId = int.parse(Get.parameters['id2']!);

  final rxFo = Rxn<BroFa2Fo>();
  final rxVf = Rxn<BroFa2VisitFo>();
  final rxVisitFoImgList = Rx<List<BroFa2VisitFoImg>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxFo.value = await db.broFa2FoDao.getById(foId);
    rxVf.value = await db.broFa2VisitFoDao.getByVisitIdFoId(visitId, foId);
    if (rxVf.value == null) {
      Get.back();
      XanX.showErrorDialog(message: "Please save first before go to images");
      return;
    }

    db.broFa2VisitFoImgDao.watchAllByVisitFoId(rxVf.value!.id).listen((imgList) {
      rxVisitFoImgList.value = imgList;
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

      await db.broFa2VisitFoImgDao.insert(BroFa2VisitFoImgTbCompanion(
        broFa2VisitFoId: Value(rxVf.value!.id),
        path: Value(newPath),
      ));
    }
  }

  void onImgClick(int imgId) {
    Get.toNamed("${Get.currentRoute}/$imgId");
  }
}
