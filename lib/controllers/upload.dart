import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/modules/api.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:get/get.dart' hide Value, FormData, MultipartFile;
import 'package:moor/moor.dart';

class UploadController extends GetxController {
  final db = XanX.db();

  final rxLogList = Rx<List<Log>>([]);
  final rxVisitNotYetUploadCount = 0.obs;
  final rxImgNotYetUploadCount = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    db.logDao.watchAll().listen((logList) {
      rxLogList.value = logList;
    });
    db.broFa2VisitDao.watchCountByUpload().listen((cnt) {
      rxVisitNotYetUploadCount.value = cnt;
    });
    db.utilDao.watchImgNotYetUploadCount().listen((x) {
      rxImgNotYetUploadCount.value = x;
    });

  }

  Future<void> upload() async {
    /// Get list of id of not yet upload doc
    final visitIdList = await db.broFa2VisitDao.getListOfIdByUpload();
    final dataCount = visitIdList.length;

    if (dataCount == 0) {
      XanX.showErrorDialog(message: "No data to upload");
      return;
    }

    try {
      XanX.showLoadingDialog();

      final routineImageList =
          await db.broFa2VisitRoutineImgDao.getAllWithoutServerIdByVisit(visitIdList);
      await Future.forEach<BroFa2VisitRoutineImg>(routineImageList, (img) async {
        /// Upload the image one by one, as each success, set the server_id from the received res
        final res = await Api().dio.post(
              '/api/broiler/fa2/visit-img-paths/',
              data: FormData.fromMap({
                'path': await MultipartFile.fromFile(
                  img.path,
                  filename: 'img.png',
                ),
              }),
            );
        final serverId = res.data['id'];
        final isOk = await db.broFa2VisitRoutineImgDao.updateByPk(img.copyWith(serverId: serverId));
        if (!isOk) {
          throw Exception("Unable to set server_id of Routine img");
        }
      });

      final foImageList = await db.broFa2VisitFoImgDao.getAllWithoutServerIdByVisit(visitIdList);
      await Future.forEach<BroFa2VisitFoImg>(foImageList, (img) async {
        /// Upload the image one by one, as each success, set the server_id from the received res
        final res = await Api().dio.post(
              '/api/broiler/fa2/visit-img-paths/',
              data: FormData.fromMap({
                'path': await MultipartFile.fromFile(
                  img.path,
                  filename: 'img.png',
                ),
              }),
            );
        final serverId = res.data['id'];
        final isOk = await db.broFa2VisitFoImgDao.updateByPk(img.copyWith(serverId: serverId));
        if (!isOk) {
          throw Exception("Unable to set server_id of FO img");
        }
      });

      final maImageList = await db.broFa2VisitMaImgDao.getAllWithoutServerIdByVisit(visitIdList);
      await Future.forEach<BroFa2VisitMaImg>(maImageList, (img) async {
        /// Upload the image one by one, as each success, set the server_id from the received res
        final res = await Api().dio.post(
              '/api/broiler/fa2/visit-img-paths/',
              data: FormData.fromMap({
                'path': await MultipartFile.fromFile(
                  img.path,
                  filename: 'img.png',
                ),
              }),
            );
        final serverId = res.data['id'];
        final isOk = await db.broFa2VisitMaImgDao.updateByPk(img.copyWith(serverId: serverId));
        if (!isOk) {
          throw Exception("Unable to set server_id of MA img");
        }
      });

      final pmImageList = await db.broFa2VisitPmImgDao.getAllWithoutServerIdByVisit(visitIdList);
      await Future.forEach<BroFa2VisitPmImg>(pmImageList, (img) async {
        /// Upload the image one by one, as each success, set the server_id from the received res
        final res = await Api().dio.post(
              '/api/broiler/fa2/visit-img-paths/',
              data: FormData.fromMap({
                'path': await MultipartFile.fromFile(
                  img.path,
                  filename: 'img.png',
                ),
              }),
            );
        final serverId = res.data['id'];
        final isOk = await db.broFa2VisitPmImgDao.updateByPk(img.copyWith(serverId: serverId));
        if (!isOk) {
          throw Exception("Unable to set server_id of PM img");
        }
      });

      final mapList = await db.broFa2VisitDao.getJsonForUploadByIdList(visitIdList);
      final jsonStr = jsonEncode(mapList);
      await Api().dio.post('/api/broiler/fa2/visits/', data: jsonStr);

      final updateCount = await db.broFa2VisitDao.markAsUpdatedByIdList(visitIdList);

      await db.logDao.insert(LogTbCompanion(
        type: Value(XanX.logTypeUpload),
        remark: Value("$dataCount($updateCount) record(s) uploaded"),
      ));

      XanX.dismissLoadingDialog();

      if (updateCount != dataCount) {
        XanX.showAlertDialog(
            message: "Update count is not same as data count, please report to IT");
      } else {
        XanX.showAlertDialog(message: "Upload success");
      }
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }
}
