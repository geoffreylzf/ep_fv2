import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';

class VisitIdFoIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final foId = int.parse(Get.parameters['id2']!);

  final rxFo = Rxn<BroFa2Fo>();
  final rxFoSelectionList = Rx<List<BroFa2FoSelection>>([]);
  final rxImgCount = 0.obs;

  final tecAnswer = TextEditingController();
  final rxSelection = Rxn<BroFa2FoSelection>();
  final tecComment = TextEditingController();
  final tecAction = TextEditingController();
  final tecRemark = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    final fo = await db.broFa2FoDao.getById(foId);
    rxFo.value = fo;

    if (fo.isSelection) {
      rxFoSelectionList.value = await db.broFa2FoSelectionDao.getAllByFoId(fo.id);
    }

    final vf = await db.broFa2VisitFoDao.getByVisitIdFoId(visitId, foId);
    int? vfId;
    if (vf == null) {
      vfId = await db.broFa2VisitFoDao.insert(BroFa2VisitFoTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2FoId: Value(foId),
        answer: Value(''),
        comment: Value(''),
        action: Value(''),
        remark: Value(''),
      ));
    } else {
      vfId = vf.id;
      tecAnswer.text = vf.answer;
      if (vf.broFa2FoSelectionId != null) {
        final selected = rxFoSelectionList.value.firstWhereOrNull(
          (x) => x.id == vf.broFa2FoSelectionId,
        );
        if (selected != null) {
          rxSelection.value = selected;
        }
      }
      tecComment.text = vf.comment;
      tecAction.text = vf.action;
      tecRemark.text = vf.remark;
    }

    db.broFa2VisitFoImgDao.watchAllByVisitFoId(vfId).listen((imgList) {
      rxImgCount.value = imgList.length;
    });
  }

  @override
  void onClose() async {
    tecAnswer.dispose();
    tecComment.dispose();
    tecAction.dispose();
    tecRemark.dispose();
  }

  Future<void> onImgButtonClick() async {
    Get.toNamed("${Get.currentRoute}/images");
  }

  Future<void> onSaveButtonClick() async {
    final fo = rxFo.value;
    if (fo == null) {
      return;
    }
    if (!fo.isFormula) {
      if (fo.isSelection) {
        if (rxSelection.value == null) {
          XanX.showErrorDialog(message: "Please select answer");
          return;
        }
      } else {
        if (tecAnswer.text.isEmpty) {
          XanX.showErrorDialog(message: "Please enter answer");
          return;
        }
      }
    }

    final exist = await db.broFa2VisitFoDao.getByVisitIdFoId(visitId, foId);
    if (exist != null) {
      final isUpdated = await db.broFa2VisitFoDao.updateByPk(
        exist.copyWith(
          answer: tecAnswer.text,
          broFa2FoSelectionId: rxSelection.value?.id ?? null,
          comment: tecComment.text,
          action: tecAction.text,
          remark: tecRemark.text,
        ),
      );

      if (!isUpdated) {
        XanX.showErrorDialog(message: "Data is not updated");
      } else {
        Fluttertoast.showToast(msg: "Saved");
        Get.back();
      }
    } else {
      XanX.showErrorDialog(message: "Save failed, please try again");
    }
  }
}
