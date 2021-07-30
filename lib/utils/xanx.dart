import 'package:dio/dio.dart';
import 'package:ep_fv2/controllers/utils/db.dart';
import 'package:ep_fv2/db/db.dart';
import 'package:ep_fv2/modules/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ep_fv2/utils/ext.dart';

class XanX {
  static String logTypeUpload = 'UPLOAD';

  static showErrorDialog({String title = "Error", required String message}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("CLOSE"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showConfirmDialog({
    required String title,
    required String message,
    required String btnPositiveText,
    required VoidCallback vcb,
    btnNegativeText = 'Cancel',
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(btnNegativeText.toUpperCase()),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text(btnPositiveText.toUpperCase()),
            onPressed: () {
              vcb();
              Get.back();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showLoadingDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static dismissLoadingDialog() {
    Get.back();
  }

  static showAlertDialog({String title = 'Info', required String message}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("CLOSE"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  static handleErrorMessage(dynamic e) {
    if (e is DioError) {
      XanX.showErrorDialog(
        title: "Network Error",
        message: e.formatApiErrorMsg(),
      );
    } else {
      XanX.showErrorDialog(
        title: "Unexpected Error",
        message: e.toString(),
      );
    }
  }

  static apiGetSelect(path) {
    return Api().dio.get(path, queryParameters: {'select': '{}'});
  }

  static Db db() {
    return Get.find<DbController>().db;
  }
}
