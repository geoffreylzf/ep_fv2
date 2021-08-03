import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';
import 'package:collection/collection.dart';

class VisitIdFoIdController extends GetxController {
  final db = XanX.db();
  final visitId = int.parse(Get.parameters['id']!);
  final foId = int.parse(Get.parameters['id2']!);

  final rxFo = Rxn<BroFa2Fo>();
  final rxFoSelectionList = Rx<List<BroFa2FoSelection>>([]);

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

    final exist = await db.broFa2VisitFoDao.getByVisitIdFoId(visitId, foId);
    if (exist != null) {
      tecAnswer.text = exist.answer;

      if (exist.broFa2FoSelectionId != null) {
        final selected = rxFoSelectionList.value.firstWhereOrNull(
          (x) => x.id == exist.broFa2FoSelectionId,
        );
        if (selected != null) {
          rxSelection.value = selected;
        }
      }

      tecComment.text = exist.comment;
      tecAction.text = exist.action;
      tecRemark.text = exist.remark;
    }
  }

  @override
  void onClose() async {
    tecAnswer.dispose();
    tecComment.dispose();
    tecAction.dispose();
    tecRemark.dispose();
  }

  void onSaveButtonClick() async {
    // TODO verify answer and selectionId
    // TODO img

    final exist = await db.broFa2VisitFoDao.getByVisitIdFoId(visitId, foId);
    if (exist == null) {
      await db.broFa2VisitFoDao.insert(BroFa2VisitFoTbCompanion(
        broFa2VisitId: Value(visitId),
        broFa2FoId: Value(foId),
        answer: Value(tecAnswer.text),
        broFa2FoSelectionId: Value(rxSelection.value?.id ?? null),
        comment: Value(tecComment.text),
        action: Value(tecAction.text),
        remark: Value(tecRemark.text),
      ));
      Get.back();
    } else {
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
        Get.back();
      }
    }
  }
}
