import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' hide Value;
import 'package:image_picker/image_picker.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class VisitIdRoutineIdImagesController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final routineId = int.parse(Get.parameters['id2']!);

  final rxRoutine = Rxn<BroFa2Routine>();
  final rxVr = Rxn<BroFa2VisitRoutine>();
  final rxVisitRoutineImgList = Rx<List<BroFa2VisitRoutineImg>>([]);

  @override
  void onInit() async {
    super.onInit();
    rxRoutine.value = await db.broFa2RoutineDao.getById(routineId);
    rxVr.value = await db.broFa2VisitRoutineDao.getByVisitIdRoutineId(visitId, routineId);
    if (rxVr.value == null) {
      Get.back();
      XanX.showErrorDialog(message: "Please save first before go to images");
      return;
    }

    db.broFa2VisitRoutineImgDao.watchAllByVisitRoutineId(rxVr.value!.id).listen((imgList) {
      rxVisitRoutineImgList.value = imgList;
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

      await db.broFa2VisitRoutineImgDao.insert(BroFa2VisitRoutineImgTbCompanion(
        broFa2VisitRoutineId: Value(rxVr.value!.id),
        path: Value(newPath),
      ));
    }
  }

  void onImgClick(int imgId) {
    Get.toNamed("${Get.currentRoute}/$imgId");
  }
}
